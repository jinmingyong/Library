package com.socket;

import com.alibaba.fastjson.JSONObject;
import com.entity.Chat;
import com.google.gson.GsonBuilder;
import com.service.IChatService;
import com.service.IReaderService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentMap;

@Component
public class MyWebSocketHandler implements WebSocketHandler {
    private final static Logger log=Logger.getLogger(MyWebSocketHandler.class);

    @Resource
    private IChatService chatService;
    @Resource
    private IReaderService readerService;

    //握手实现连接后
    public void afterConnectionEstablished(WebSocketSession webSocketSession)
            throws Exception {
        Long readerId = (Long) webSocketSession.getAttributes().get("readId");
        if (WebSocketMapService.get(readerId) == null) {
            WebSocketMapService.put(readerId, webSocketSession);
            log.info("Websocket："+readerId+"用户建立连接成功！");
        }
    }

    //发送信息前的处理
    public void handleMessage(WebSocketSession webSocketSession,
                              WebSocketMessage<?> webSocketMessage) throws Exception {

        if (webSocketMessage.getPayloadLength() == 0)
            return;
        //获取Socket通道中的数据
        JSONObject object = JSONObject
                .parseObject(webSocketMessage.getPayload().toString());

        Chat chat = new Chat();
        chat.setReader(readerService.selectByPrimaryKey(object.getLong("readId")));
        chat.setRid((Long) object.getLong("readId"));
        chat.setContext((String) object.getString("context"));
        chat.setPid(object.getLong("pid"));
        //...
        //将信息保存至数据库
         //chatService.insertSelective(chat);
        // 给自己发送消息
        sendMessageToUser(chat.getRid(),
                new TextMessage(
                        new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
                                .create().toJson(chat)));
        // 给对方发送消息
        ConcurrentMap<Long, WebSocketSession> webSocketSessionMap = WebSocketMapService.webSocketSessionMap;
        Set<Long> readerIds=webSocketSessionMap.keySet();
        //群发不包括自己
        sendMessageToUsers(readerIds, new TextMessage(
                new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
                .create().toJson(chat)),chat.getRid());
/*        //单发
        sendMessageToUser(chat.getPid(),
                new TextMessage(
                        new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
                                .create().toJson(chat)));*/
    }

    public void handleTransportError(WebSocketSession webSocketSession,
                                     Throwable throwable) throws Exception {
        log.error("Websocket：handleMessage send message："+throwable);

    }

    public void afterConnectionClosed(WebSocketSession webSocketSession,
                                      CloseStatus closeStatus) throws Exception {
        //断开连接即将此用户对应的WebSocketSession移除，以便再次连接时添加新的WebSocketSession
        Iterator<Map.Entry<Long, WebSocketSession>> iterator = WebSocketMapService
                .entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<Long, WebSocketSession> entry = iterator.next();
            if (entry.getValue().getAttributes()
                    .get("readId") == webSocketSession.getAttributes()
                    .get("readId")) {
                WebSocketMapService.remove((Long) webSocketSession
                        .getAttributes().get("readId"));
            }
        }
    }

    public boolean supportsPartialMessages() {
        return false;
    }

    //发送信息的实现
    public void sendMessageToUser(Long readerId, TextMessage message)
            throws IOException {
        WebSocketSession session = WebSocketMapService.get(readerId);
        if (session != null && session.isOpen()) {
            session.sendMessage(message);
            log.info("Websocket：handleMessage send message："+message);
        }
    }
    public void sendMessageToUsers(Set<Long> readerIds, TextMessage message,Long id) {
        for(Long r: readerIds) {
            try {
                if (r==id) continue;
                this.sendMessageToUser(r,message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
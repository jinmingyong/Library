package com.socket;

import org.springframework.web.socket.WebSocketSession;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

public class WebSocketMapService {
    public static final ConcurrentMap<Long, WebSocketSession> webSocketSessionMap;
    static {
        webSocketSessionMap = new ConcurrentHashMap<Long, WebSocketSession>();
    }

    public static void put(Long key, WebSocketSession myWebSocket) {
        webSocketSessionMap.put(key, myWebSocket);
    }

    public static WebSocketSession get(Long key) {
        return webSocketSessionMap.get(key);
    }

    public static void remove(Long key) {
        webSocketSessionMap.remove(key);
    }

    public static Collection<WebSocketSession> getValues() {
        return webSocketSessionMap.values();
    }

    public static Set<Map.Entry<Long, WebSocketSession>> entrySet() {
        return webSocketSessionMap.entrySet();
    }
}
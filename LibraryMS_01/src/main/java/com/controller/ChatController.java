package com.controller;

import com.entity.Reader;
import com.service.IBookResService;
import com.service.IChatService;
import com.service.IReaderService;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/chat")
public class ChatController {
    @Resource(name = "readerService")
    private IReaderService readerService;

    @RequestMapping("/readerlogin")
    public String readerlogin(String rname, String rpwd, HttpServletRequest request){
        Reader reader=readerService.readerlogin(rname,rpwd);
        request.getSession().setAttribute("reader",reader);
        System.out.println(reader);
        if (reader!=null){
            return "Chat/chat";
        }
        else {
            return null;
        }

    }

}

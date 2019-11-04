package com.controller;

import com.entity.Reader;
import com.service.IBookResService;
import com.service.IChatService;
import com.service.IReaderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/chat")
public class ChatController {
    @Resource(name = "readerService")
    private IReaderService readerService;
    @RequestMapping("/readerlogin")
    public String readerlogin(String rname, String rpwd, HttpServletRequest request){
        Reader reader=readerService.readerlogin(rname,rpwd);
        request.getSession().setAttribute();
        System.out.println(reader);
        if (reader!=null){
            return "Chat/chat";
        }
        else {
            return null;
        }

    }
}

package com.controller;

import com.entity.BookRes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/test")
public class TestController {
    @RequestMapping("/uploadfile")
    public String uploadfile(@RequestParam("pic") MultipartFile picture,BookRes bookRes){
        System.out.println(picture.getName());
        System.out.println(bookRes.getBname());
        return "success";
    }
}

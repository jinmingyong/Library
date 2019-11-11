package com.controller;

import com.alibaba.fastjson.JSON;
import com.entity.Borrow;
import com.service.IBorrowService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/bookBorrow")
public class BookBorrowController {
    @Resource
    private IBorrowService borrowService;

    @RequestMapping("/moreBorrow")
    public @ResponseBody String imagenames(){
        List<String> imageList=new ArrayList<String>();
        List<Borrow> list=borrowService.moreBorrow();
        for (Borrow b:list
             ) {
            System.out.println(b.getBookRes().getImage());
                imageList.add(b.getBookRes().getImage());
        }
        return JSON.toJSONString(imageList);
    }
}

package com.controller;

import com.alibaba.fastjson.JSON;
import com.entity.BookInuse;
import com.github.pagehelper.PageInfo;
import com.service.IBookInuseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("bookInuse")
public class BookInuseController {
    @Resource
    private IBookInuseService bookInuseService;


    @RequestMapping(value = "/showAllBooks",produces = {"application/json;chartset=UTF-8"})
    public @ResponseBody PageInfo<BookInuse> showAllBooks(Integer page){
        if (page==null||page==0)page=1;
        PageInfo<BookInuse> pageInfo=  bookInuseService.findAllByPage(page);
        return pageInfo;
    }
}

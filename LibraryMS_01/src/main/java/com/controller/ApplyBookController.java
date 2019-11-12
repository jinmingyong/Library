package com.controller;


import com.entity.ApplyBook;
import com.entity.BookRes;
import com.service.IApplyBookService;
import com.service.IBookResService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("applyBook")
public class ApplyBookController {
    @Resource(name = "applyBookService")
    private IApplyBookService applyBookService;

    @RequestMapping(value = "/showApply",produces = {"application/json;chartset=UTF-8"})
    public @ResponseBody List<ApplyBook> showApply(){
        List<ApplyBook> result=applyBookService.findAll();
        return result;
    }
    @RequestMapping(value = "/applyNewBook")
    public @ResponseBody List<String> applyNewBook(ApplyBook applyBook){
        ApplyBook apply = new ApplyBook();
        apply=applyBookService.selectByIsbn(applyBook.getIsbn());
        List<String> list = new ArrayList<String>();
        if(apply==null){
            applyBook.setApplytime(new Date());
            System.out.println("===========================");
            System.out.println(applyBook.getIsbn());
            applyBookService.insert(applyBook);
            System.out.println("添加成功");
            list.add("添加成功");
            System.out.println("添加成功");
        }
        else{
            list.add("已存在此书");
        }
        System.out.println(list.get(0));
        return  list;
    }


}

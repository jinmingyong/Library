package com.controller;

import com.entity.BookInuse;
import com.entity.BookRes;
import com.service.IBookBadService;
import com.entity.BookBad;
import com.service.IBookInuseService;
import com.service.IBookResService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("bookBad")
public class BookBadController {
    @Resource
    private IBookBadService iBookBadService;
    @Resource
    private IBookResService iBookResService;
    @Resource
    private IBookInuseService iBookInuseService;

    @RequestMapping(value = "/showAllBadBooks",produces = {"application/json;chartset=UTF-8"})
    public @ResponseBody List<BookBad> showAllBadBooks(){
        List<BookBad>  list= iBookBadService.findAll();
        return list;
    }
    /*
    * 彻底销毁
    * */
    @RequestMapping(value = "/deleteBadBooks",produces = {"application/json;chartset=UTF-8"})
    public @ResponseBody List<String> deleteBadBooks(String isbn){
        List<String> list = new ArrayList<String>();
        BookBad record1 = iBookBadService.selectByIsbn(isbn);
        if(record1.getBadnum()>1){
            record1.setBadnum(record1.getBadnum()-1);
            iBookBadService.updateByPrimaryKey(record1);
        }else{
            iBookBadService.deleteByPrimaryKey(record1.getBadId());
        }
        list.add("操作成功");
        return list;
    }

    @RequestMapping(value = "/replaceBadBook",produces = {"application/json;chartset=UTF-8"})
    public @ResponseBody List<String> replaceBadBook(BookBad bookBad){
        List<String> list = new ArrayList<String>();
        bookBad.setBadtime(new Date());
        BookBad bad=iBookBadService.selectByIsbn(bookBad.getIsbn());
        BookRes bookRes=iBookResService.findBookResByisbn(bookBad.getIsbn());
        if (bookRes!=null){
            BookInuse bookInuse=iBookInuseService.selectByIsbn(bookBad.getIsbn());
            if(bad==null){
                bookBad.setBtype(0);
                iBookBadService.insert(bookBad);
            }else {
                bad.setBadnum(bad.getBadnum()+1);
                iBookBadService.updateByPrimaryKey(bad);
            }
            if (bookRes.getAmount()>0){
                bookRes.setAmount(bookRes.getAmount()-1);
                iBookResService.updateBookRes(bookRes);
                list.add("操作成功");
                return list;
            }else {
                bookInuse.setAmount(bookInuse.getAmount() - 1);
                iBookInuseService.updateByPrimaryKey(bookInuse);
                list.add("操作成功但库存已空");
                return list;

            }

        }else {
            list.add("无此书");
            return list;
        }

    }
    @RequestMapping(value = "/applyBadBook",produces = {"application/json;chartset=UTF-8"})
    public @ResponseBody List<String> applyBadBook(BookBad bookBad){
        List<String> list = new ArrayList<String>();
        BookBad book=iBookBadService.selectByIsbn(bookBad.getIsbn());
        book.setBtype(bookBad.getBtype());
        iBookBadService.updateByPrimaryKey(book);
        list.add("操作成功");
        return  list;
    }
}

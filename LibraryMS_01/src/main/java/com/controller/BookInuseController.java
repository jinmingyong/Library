package com.controller;

import com.alibaba.fastjson.JSON;
import com.entity.BookInuse;
import com.github.pagehelper.PageInfo;
import com.service.IBookInuseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(path = "/bookInuse")
public class BookInuseController {
    //maki:add
    @Autowired
    private IBookInuseService iBookInuseService;


    //maki:add
    @RequestMapping("/findInuseAll")
    public String findInuseAll(Model model){
        List<BookInuse> list=iBookInuseService.findAll();
        if (list.size()>0){
            model.addAttribute("inuseList",list);
            return "bookinuse";
        }else {
            return "Test";
        }
    }

    //maki:add
    @RequestMapping("/FindByIsbn")
    @ResponseBody
    public List<BookInuse> FindByIsbn(@RequestParam String isbn,Model model){
        BookInuse bookInuse=iBookInuseService.selectByIsbn(isbn);
        List<BookInuse> list=new ArrayList<BookInuse>();
        list.add(0,bookInuse);
        return list;
    }

    //maki:add
    @RequestMapping("/updateBookInuse")
    public void updateBookInuse(@RequestParam String isbn, @RequestParam Integer account, HttpServletResponse response, HttpServletRequest request) throws IOException {
        int i=iBookInuseService.updateInuseShelf(isbn,account);
        if (i>0){
            response.sendRedirect(request.getContextPath()+"/findInuseAll");
        }else {
            System.out.println("插入失败！");
            response.sendRedirect("/Test.jsp");
        }

    }

    //maki:add
    @RequestMapping("/updateBookInuseMoren")
    @ResponseBody
    public String updateBookInuseMoren(@RequestParam String isbn, @RequestParam Integer account, HttpServletResponse response, HttpServletRequest request) throws IOException {
        int i=iBookInuseService.updateInuseShelf(isbn,account);
        if (i>0){
            return "success";
        }else {
            return "err";
        }

    }

    //maki:add
    @RequestMapping("/deleteBookInuse")
    @ResponseBody
    public String deleteBookInuse(@RequestParam Integer id,HttpServletRequest request,HttpServletResponse response) throws IOException {
        int i=iBookInuseService.deleteInuseShelf(id);
        if (i>0){
            return "success";
        }else {
            return "err";
        }
    }

    //maki:add
    @RequestMapping("/insertBookInuse")
    public void insertBookInuse(@RequestParam String isbn,@RequestParam Integer account,HttpServletRequest request,HttpServletResponse response ) throws IOException {
        int i=iBookInuseService.insertInuseShelf(isbn,account);
        if (i>0){
            response.sendRedirect(request.getContextPath()+"/findInuseAll");
        }else {
            response.sendRedirect("/Test.jsp");
        }
    }

    //maki:add
    @RequestMapping("/selectByAccount")
    @ResponseBody
    public List<BookInuse> selectByAccount(@RequestParam Integer account,Model model){
        List<BookInuse> bookInuse=iBookInuseService.selectByAccount(account);
        if (bookInuse.size()>0){
            return bookInuse;
        }else {
            return null;
        }

    }
    @RequestMapping("/showAllbookjsp")
    public String showAllbookjsp(){
        return "jsp/showAllbook";
    }

    @RequestMapping(value = "/showAllBooks",produces = {"application/json;chartset=UTF-8"})
    public @ResponseBody PageInfo<BookInuse> showAllBooks(Integer page,String name){
        if (page==null||page==0)page=1;
        PageInfo<BookInuse> pageInfo=  iBookInuseService.findAllByPage(page,name);
        return pageInfo;
    }
}

package com.controller;

import com.entity.BookBooking;
import com.entity.Borrow;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.IBookBookingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.xml.crypto.Data;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: MrLiu
 * Date: 2019/11/7
 */
@Controller
@RequestMapping("/bookBooking")
public class BookBookingController {
@Resource(name = "bookBookingService")
private IBookBookingService iBookBookingService;
BookBooking bookBooking=new BookBooking();
Borrow borrow =new Borrow();
BookBorrowController bookBorrowController =new BookBorrowController();


    @RequestMapping("/list")
    public @ResponseBody List<BookBooking> list(){

        return iBookBookingService.findAllBookBooking();
    }

    //设计Map聚合存储需要给页面的对象数据
    private Map<String,Object> result = new HashMap<String,Object>();

    @RequestMapping("/listByPage")
    @ResponseBody
    public  Map<String,Object> list(Integer page, Integer rows){
        //设置分页参数
        PageHelper.startPage(page,rows);
        //查询所有数据
        List<BookBooking> list=iBookBookingService.findAllBookBooking();
        //使用 PageInfo 封装查询结果
        PageInfo<BookBooking> pageInfo=new PageInfo<BookBooking>(list);
        //从 PageInfo 对象取出查询结果
        //总记录数
        long total=pageInfo.getTotal();
        //当前页数据列表
        List<BookBooking>  cutList=pageInfo.getList();

        result.put("total",total);
        result.put("rows",cutList);

        return result;
    }

    @RequestMapping("/insert")
    @ResponseBody
    public Map<String,Object> insert(BookBooking bookBooking){
        int flag=0;
        Date date=new Date();
        bookBooking.setBookingTime(date);
        List<BookBooking> list= list();

        for (BookBooking b : list) {
            if (bookBooking.getBid() == b.getBid() && bookBooking.getRid() == b.getRid()) {
                    flag=1;
            }
            }
        if (flag==1){
            result.put("success",false);
            result.put("message","该用户已预约该书");

        }else {
            try {
                iBookBookingService.insert(bookBooking);
                result.put("success",true);
            }catch (Exception e){
                e.printStackTrace();
                result.put("success",false);
                result.put("message","您的输入有误");

            }

        }




            return result;


    }


    @RequestMapping("/delete")
    @ResponseBody
    public Map<String,Object> delete(Integer[] id){
        try {

            iBookBookingService.delete(id);
            result.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @RequestMapping("/deleteForm")
    @ResponseBody
    public Map<String,Object> deleteForm(Integer[] id){
        try {
            for (int i=0;i<id.length;i++)
            {   Date date = new Date();
               bookBooking= iBookBookingService.findBookBookingbyid(id[i]);
               String isbn=iBookBookingService.getIsbn(bookBooking.getBid());
                borrow.setIsbn(isbn);
                borrow.setRid(bookBooking.getRid().longValue());
                borrow.setBorTime(date);
                borrow.setBorType("0");
                iBookBookingService.insertSelective(borrow);

            }

            iBookBookingService.delete(id);
            result.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("msg", e.getMessage());
        }
        return result;
    }
//    @RequestMapping("/listByRid")
//    public @ResponseBody List<BookBooking> listByRid(Integer rid){
//        //设置分页参数
//
//        //查询所有数据
//        List<BookBooking> list=iBookBookingService.findBookBookingbyrid(rid);
//        //使用 PageInfo 封装查询结果
//
//
//        return list;
//    }

    @RequestMapping("/listByRid")
    @ResponseBody
    public  Map<String,Object> listByRid(Integer page, Integer rows,Integer rid){
        //设置分页参数
        PageHelper.startPage(page,rows);
        //查询所有数据
        List<BookBooking> list=iBookBookingService.findBookBookingbyrid(rid);
        //使用 PageInfo 封装查询结果
        PageInfo<BookBooking> pageInfo=new PageInfo<BookBooking>(list);
        //从 PageInfo 对象取出查询结果
        //总记录数
        long total=pageInfo.getTotal();
        //当前页数据列表
        List<BookBooking>  cutList=pageInfo.getList();

        result.put("total",total);
        result.put("rows",cutList);

        return result;
    }

    @RequestMapping("/listByBid")
    @ResponseBody
    public  Map<String,Object> listByBid(Integer page, Integer rows,Integer bid){
        //设置分页参数
        PageHelper.startPage(page,rows);
        //查询所有数据
        List<BookBooking> list=iBookBookingService.findBookBookingbybid(bid);
        //使用 PageInfo 封装查询结果
        PageInfo<BookBooking> pageInfo=new PageInfo<BookBooking>(list);
        //从 PageInfo 对象取出查询结果
        //总记录数
        long total=pageInfo.getTotal();
        //当前页数据列表
        List<BookBooking>  cutList=pageInfo.getList();

        result.put("total",total);
        result.put("rows",cutList);

        return result;
    }


}

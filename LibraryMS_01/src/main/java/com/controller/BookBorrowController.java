package com.controller;

import com.alibaba.fastjson.JSON;
import com.entity.BookInuse;
import com.entity.BookRes;
import com.entity.Borrow;
import com.github.pagehelper.PageInfo;
import com.service.IBookInuseService;
import com.service.IBookResService;
import com.service.IBorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/bookBorrow")
public class BookBorrowController {

    @Autowired
    private IBorrowService iBorrowService;

    @Autowired
    private IBookResService iBookResService;
    @Autowired
    private IBookInuseService iBookInuseService;
    public static Date addDate (int num) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, num);
        Date date = calendar.getTime();
        return date;
    }
    @RequestMapping("/borrowFindAll")
    public String borrowFindAll(HttpServletRequest request, Model model){
        List<Borrow> list=iBorrowService.selectAllBorrow();
        model.addAttribute("list",list);
        //HttpSession session=request.getSession();
        //session.setAttribute("list",list);
        return "borrow";
    }
    @RequestMapping("/borrowFindAllbyPage")
    public String borrowFindAll(HttpServletRequest request, Model model,@RequestParam(value = "pn",defaultValue = "1") Integer pageNum){
        PageInfo<Borrow> list=new PageInfo<Borrow>(iBorrowService.selectAllBorrow(pageNum));
        model.addAttribute("pageInfo",list);
        //HttpSession session=request.getSession();
        //session.setAttribute("list",list);
        return "borrow";
    }
    @RequestMapping("/borrowFindType")
    public @ResponseBody List<Borrow> borrowFindType(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
        List<Borrow> list=iBorrowService.selectByBorType();
        HttpSession session=request.getSession();
        if (list.size()>0){
            //model.addAttribute("type",list);
            /*            session.setAttribute("type",list);*/
            //request.getRequestDispatcher(request.getContextPath()+"../pages/borrow.jsp").forward(request,response);
            return list;
        }else {
            return null;
        }

    }
    @RequestMapping("/borrowFindTypebyPage")
    public @ResponseBody PageInfo<Borrow> borrowFindType(HttpServletRequest request, HttpServletResponse response, Model model, Integer pageNum) throws ServletException, IOException {
        PageInfo<Borrow> list=new PageInfo<Borrow>(iBorrowService.selectByBorType(pageNum));
        HttpSession session=request.getSession();
        if (list.getList().size()>0){
            //model.addAttribute("type",list);
            /*            session.setAttribute("type",list);*/
            //request.getRequestDispatcher(request.getContextPath()+"../pages/borrow.jsp").forward(request,response);
            return list;
        }else {
            return null;
        }

    }
    @RequestMapping("/insertBorrow")
    public String insertBorrow(@RequestParam String isbn, @RequestParam String stuId, Model model) throws IOException {
        BookRes bookRes=iBookResService.findBookResByisbn(isbn);
        if (bookRes==null){
            model.addAttribute("msg","此Isbn不存在");
        }else {
            Borrow borrow=new Borrow();
            borrow.setIsbn(isbn);
            borrow.setRid(Long.valueOf(stuId));
            borrow.setBorTime(new Date());
            borrow.setBorType("0");
            borrow.setRetTime(addDate(7));
            int i=iBorrowService.insert(borrow);
            if (i==0){
                model.addAttribute("msg","存入失败");
            }
        }
        return "borrow";
    }
    //还书
    @RequestMapping("/updateBorrowBackType")
    public void updateBorrowBackType(@RequestParam Integer id, HttpServletRequest request,HttpServletResponse response) throws IOException {
        System.out.println("id的值为："+id);
        Borrow borrow=iBorrowService.selectByPrimaryKey((long)id);
        borrow.setBorType("1");
        borrow.setRealTime(new Date());
        int i=iBorrowService.updateByPrimaryKey(borrow);
        BookInuse bookInuse=iBookInuseService.selectByIsbn(borrow.getIsbn());
        bookInuse.setAmount(bookInuse.getAmount()+1);
        int ii=iBookInuseService.updateByPrimaryKey(bookInuse);
        if (i>0&&ii>0){
            response.sendRedirect(request.getContextPath()+"/bookBorrow/borrowFindAll");
        }else {
            System.out.println("还书失败！");
        }
    }

    @RequestMapping("/findBookInuseByRid")
    public @ResponseBody List<Borrow> findBookInuseByRid(@RequestParam("rid") String rid,@RequestParam("type") String type,Model model){
        if (type.equals("1")){
            List<Borrow> list=iBorrowService.selectByRid(Long.valueOf(rid));
            // model.addAttribute("list",list);
            System.out.println("全部"+list);
            return list;
        }else if (type.equals("2")){
            List<Borrow> list=iBorrowService.selectByRidWithoutType1(Long.valueOf(rid));
            //model.addAttribute("type",list);
            System.out.println("未还"+list);
            return list;
        }else {
            List<Borrow> list=iBorrowService.selectByRidWithType1(Long.valueOf(rid));
            //model.addAttribute("list",list);
            System.out.println("已还"+list);
            return list;
        }
    }
    @RequestMapping("/findBookInuseByRidbyPage")
    public @ResponseBody PageInfo<Borrow> findBookInuseByRid(@RequestParam("rid") String rid,@RequestParam("type") String type,Model model,Integer pageNum){
        if (type.equals("1")){
            PageInfo<Borrow> list=new PageInfo<Borrow>(iBorrowService.selectByRid(Long.valueOf(rid),pageNum));
            // model.addAttribute("list",list);
            System.out.println("全部"+list);
            return list;
        }else if (type.equals("2")){
            PageInfo<Borrow> list=new PageInfo<Borrow>(iBorrowService.selectByRidWithoutType1(Long.valueOf(rid),pageNum));
            //model.addAttribute("type",list);
            System.out.println("未还"+list);
            return list;
        }else {
            PageInfo<Borrow> list=new PageInfo<Borrow>(iBorrowService.selectByRidWithType1(Long.valueOf(rid),pageNum));
            //model.addAttribute("list",list);
            System.out.println("已还"+list);
            return list;
        }
    }

    @RequestMapping("/findBookInuseByOverdue")
    @ResponseBody
    public List<Borrow> findBookInuseByOverdue(HttpServletRequest request,Model model){
        List<Borrow> list=iBorrowService.selectCheckTime();
        //model.addAttribute("bor",list);
//        HttpSession session=request.getSession();
//        System.out.println("我是后台的："+list);
        //session.setAttribute("bor",list);
        if (list.size()>0){
            return list;
        }else {
            return null;
        }

    }

    @RequestMapping("/findBookInuseByOverduebyPage")
    @ResponseBody
    public PageInfo<Borrow> findBookInuseByOverdue(HttpServletRequest request,Model model,Integer pageNum){
        PageInfo<Borrow> list=new PageInfo<Borrow>(iBorrowService.selectCheckTime(pageNum));
        //model.addAttribute("bor",list);
//        HttpSession session=request.getSession();
//        System.out.println("我是后台的："+list);
        //session.setAttribute("bor",list);
        if (list.getList().size()>0){
            return list;
        }else {
            return null;
        }

    }

    @RequestMapping("/moreBorrow")
    public @ResponseBody String imagenames(){
        List<BookRes> imageList= new ArrayList<BookRes>();
        List<Borrow> list=iBorrowService.moreBorrow();
        for (Borrow b:list
             ) {
            System.out.println(b.getBookRes());
                imageList.add(b.getBookRes());
        }
        return JSON.toJSONString(imageList);
    }
}

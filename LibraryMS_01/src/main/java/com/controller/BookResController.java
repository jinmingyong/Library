package com.controller;

import com.entity.BookRes;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.service.IBookResService;
import com.service.impl.BookResServiceimpl;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.jar.JarOutputStream;

@Controller
@RequestMapping("/bookres")
public class BookResController {
    //maki:same
    @Resource(name = "bookResService")
    private IBookResService bookResService;
    //maki:none
    @RequestMapping("/showallbook")
    public String showallbook(){
        return "jsp/showAllbook";
    }
    //maki:same
    @RequestMapping("/addBookRes")
    public @ResponseBody List<BookRes> addBookRes(@RequestBody List<BookRes> bookResList){
        bookResService.addBookResList(bookResList);
        return bookResList;
    }
    //same
    @RequestMapping("/updateBookRes")
    public void updateBookRes(BookRes bookRes,Integer bid){
        System.out.println(bid);
        bookResService.updateBookRes(bookRes);
    }
    //same
    @RequestMapping("/findAllBookRes")
    public String findAllBookRes(@RequestParam(name = "currpage",required = false) Integer currpage,Model model){
        if (currpage==null){
            currpage=1;
        }
        List<BookRes> list=bookResService.findAllByPage(currpage);
        PageInfo<BookRes> pageInfo=new PageInfo<BookRes>(list);
        model.addAttribute("pageInfo",pageInfo);
        return "BookRes/showAll";
    }

    //
    @RequestMapping("/upload")
    @ResponseBody
    public  String upload(@RequestBody@RequestParam(value = "UploadForm[image]") MultipartFile upload,@RequestBody@RequestParam(value = "bid")Integer bid){
        //定义上传服务器路径
        String path="http://localhost:9090/uploads/";
        File file=new File(path);
        if (!file.exists()){
            file.mkdirs();
        }
        String filename = upload.getOriginalFilename();//获得名字
        filename= UUID.randomUUID().toString().replace("-","")+"_"+filename;
        //完成上传，跨服务器
        //创建客户端对象
        Client client=Client.create();
        client.setConnectTimeout(3000);
        //和图片服务器连接
        WebResource webResource = client.resource(path + filename);/*注意“/”*/
        //上传文件
        try {
            webResource.put(upload.getBytes());
        } catch (IOException e) {
        }
        BookRes bookRes=new BookRes();
        bookRes.setBid(bid);
        bookRes.setImage(filename);
        bookResService.updateBookRes(bookRes);
        return "http://localhost:9090/uploads/"+filename;
    }


}

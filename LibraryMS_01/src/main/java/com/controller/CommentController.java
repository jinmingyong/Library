package com.controller;

import com.alibaba.fastjson.JSON;
import com.entity.BookInuse;
import com.entity.BookRes;
import com.entity.Comment;
import com.entity.Remark;
import com.github.pagehelper.PageInfo;
import com.service.IBookResService;
import com.service.ICommentService;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Resource
    private ICommentService commentService;
    @Resource
    private IBookResService bookResService;


    @RequestMapping("/addCommentjsp")
    public String addCommentjsp(Integer bid,Model model){
        BookRes bookRes=bookResService.findBookResById(bid);
        model.addAttribute("bookRes",bookRes);
        return "jsp/addComment";
    }
    @RequestMapping("/addComment")
    public String addComment(Model model,Comment comment, String isbn, Long rid,@RequestParam(value ="upload" ,required = false) MultipartFile upload){
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
        comment.setIsbn(isbn);
        comment.setRid(rid);
        comment.setImage(filename);
        commentService.insertSelective(comment);
        model.addAttribute("isbn",isbn);
        return "redirect:/comment/showAllComments";
    }

    @RequestMapping(value = "/showAllComments")
    public ModelAndView showAllComments(String isbn){
        ModelAndView mv=new ModelAndView();
        List<Comment> list=commentService.selectCommentByIsbn(isbn,1);
        BookRes bookRes=bookResService.findBookResByisbn(isbn);
        PageInfo<Comment> pageInfo=new PageInfo<Comment>(list);
        mv.addObject("comments",JSON.toJSONString(list));
        mv.addObject("isbn",isbn);
        mv.addObject("bookRes",bookRes);
        mv.setViewName("jsp/showComment");
        return mv;
    }

    @RequestMapping("/showAllComments2")
    public @ResponseBody PageInfo<Comment> showAllBooks(String isbn,Integer page){
        PageInfo<Comment> pageInfo=new PageInfo<Comment>(commentService.selectCommentByIsbn(isbn,page));
        return pageInfo;
    }

    @RequestMapping("/findCommentById")
    public ModelAndView findCommentById(Long comId){
        Comment comment=commentService.selectByPrimaryKey(comId);
        ModelAndView mv=new ModelAndView();
        mv.addObject("comment",JSON.toJSONString(comment));
        System.out.println(comment);
        mv.setViewName("jsp/showAllRemark");
        return mv;
    }

    @RequestMapping ("/findCommentByTitle")
    public @ResponseBody PageInfo<Comment> findCommentByTitle(String title,String isbn,Integer pageNum){
        PageInfo<Comment> pageInfo=new PageInfo<Comment>(commentService.selectCommentByTitle(title,isbn,pageNum));
        return pageInfo;
    }

}

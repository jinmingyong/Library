package com.controller;


import com.entity.BookRes;
import com.entity.Reader;
import com.service.IReaderService;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/reader")
public class ReaderController
{
    @Autowired
    private IReaderService readerService;
    @RequestMapping("/findReaderAll")
    public String findReaderAll(Model model){
        List<Reader> list=readerService.findReaderAll();
        model.addAttribute("list",list);
        return "list";
    }
    @RequestMapping("/saveReader")
    public void saveReader(Reader reader, HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        readerService.saveReader(reader);
        response.sendRedirect(request.getContextPath()+"/findReaderAll");
    }
    @RequestMapping("/updateReader")
    public void updateReader(Reader reader,HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        readerService.updateReader(reader);
        response.sendRedirect(request.getContextPath()+"/findReaderAll");
    }
    @RequestMapping("/deleteReader")
    public void deleteReader(Integer id,HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        readerService.deleteReader(id);
        response.sendRedirect(request.getContextPath()+"/user/findAll");
    }
    @RequestMapping("/findByName")
    public String findByName(String name,Model model){
        List<Reader> list=readerService.findByName(name);
        model.addAttribute("delList",list);
        return "";//还未知返回那个jsp
    }
    @RequestMapping(value = "/ReaderLogin")
    public @ResponseBody String ReaderLogin(@RequestParam("name") String name, @RequestParam("password") String password,@RequestParam("inputCode") String inputCode, HttpServletRequest request,HttpServletResponse response) throws Exception
    {
        // 图片的验证码
        String text = (String) request.getSession().getAttribute("text");
            if (!text.equalsIgnoreCase(inputCode)) {
            return "msg";
        }
        Reader user=new Reader();
        if (name.matches("^[1][3,4,5,7,8][0-9]{9}$")){
            System.out.println("手机");
            user.setRphone(name);
            user.setRpwd(password);
            List<Reader> list=readerService.findLogin(user);
            if (list.size()>0){
                return "list";
            }else {
                return "err1";
            }

        }else if (name.matches("^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$")){
            System.out.println("邮箱号");
            user.setRpwd(password);
            user.setRemail(name);
            List<Reader> list=readerService.findLogin(user);
            if (list.size()>0){
                return "list";
            }else {
                return "err1";
            }

        }else {
            return "err";
        }
    }
    @RequestMapping("/findByReader")
    public String findByReader(@RequestParam String name,@RequestParam String password,String inputCode,Model model,HttpServletRequest request){
        Reader user=new Reader();
        if (name.matches("^[1][3,4,5,7,8][0-9]{9}$")){
            System.out.println("手机");
            user.setRphone(name);
            user.setRpwd(password);
            List<Reader> list=readerService.findLogin(user);
            for (Reader user1:list){
               /* model.addAttribute("reader",user1);*/
                request.getSession().setAttribute("reader",user1);
            }
            return "jsp/showAllbook";
        }else if (name.matches("^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$")){
            user.setRpwd(password);
            user.setRemail(name);
            List<Reader> list=readerService.findLogin(user);
            for (Reader user1:list){
              /*  model.addAttribute("reader",user1);*/
                request.getSession().setAttribute("reader",user1);
            }
            return "jsp/showAllbook";
        }else {
            user.setReadId(Long.valueOf(name));
            user.setRpwd(password);
            List<Reader> list=readerService.findLogin(user);
            for (Reader user1:list){
              /*  model.addAttribute("reader",user1);*/
                request.getSession().setAttribute("reader",user1);
            }
            return "jsp/showAllbook";

        }
    }
    @RequestMapping("/readerRegiser")
    public String readerRegiser(@RequestParam("fileUp") MultipartFile pic,@RequestParam String name,@RequestParam String email,@RequestParam String sex,@RequestParam String phone,@RequestParam String address, HttpServletRequest request, Model model) throws IOException
    {
        HttpSession session=request.getSession();
        String password= (String) session.getAttribute(phone);
        //准备使用fileupload组件完成上传
        //上传的位置
        String path="http://localhost:9090/uploads/";
        //判断该路劲是否存在
        File file=new File(path);
        if (!file.exists()){
            file.mkdirs();
        }
        //说明上传文件项
        //获取上传文件的名称
        String filename=pic.getOriginalFilename();
        //文件的名称设置为唯一值
        String uuid=UUID.randomUUID().toString().replace("-","");
        filename=uuid+"_"+filename;
        //完成文件上传
        //pic.transferTo(new File(path,filename));
        Client client=Client.create();
        client.setConnectTimeout(3000);
        //和图片服务器连接
        WebResource webResource = client.resource(path + filename);/*注意“/”*/
        //上传文件
        try {
            webResource.put(pic.getBytes());
        } catch (IOException e) {
            new Exception("文件上传失败！");
        }
        Reader user=new Reader(name,password,sex,email,phone,address,filename,30);
        List<Reader> list=readerService.findLogin(user);
        for (Reader user2:list){
            user.setReadId(user2.getReadId());
        }
        readerService.updateReader(user);
        model.addAttribute("user",user);
        return "redirect:/login.jsp";
    }
    @RequestMapping("/checkPhone")
    @ResponseBody
    public String checkPhone(@RequestParam("name")String name,@RequestParam String password,@RequestParam String inputCode,HttpServletRequest request){
        HttpSession session=request.getSession();
        String code= (String) session.getAttribute(name);
        session.setAttribute(name,password);
        if (inputCode.equals(code)){
            List<Reader> list=readerService.findByPhoneNum(name);
            if (list.size()>0){
                return "err1";
            }else {
                return "list";
            }
        }else {
            return "err";
        }

    }
    @RequestMapping("/saveRegister")
    public String saveRegister(@RequestParam("name")String name,HttpServletRequest request,Model model){
        Reader user=new Reader();
        HttpSession session=request.getSession();
        String password= (String) session.getAttribute(name);
        System.out.println(password);
        user.setRphone(name);
        user.setRpwd(password);
        readerService.saveReader(user);
        List<Reader> list=readerService.findLogin(user);
        model.addAttribute("list",list);
        return "userInfor";
    }
    @RequestMapping("/findReaderPassword")
    @ResponseBody
    public String findReaderPassword(@RequestParam("name")String name,@RequestParam String password,@RequestParam String inputCode,HttpServletRequest request){
        Reader user=new Reader();
        HttpSession session=request.getSession();
        String code= (String) session.getAttribute(name);
        if (code.equals(inputCode)){
            List<Reader> list=readerService.findByPhoneNum(name);
            if (list.size()>0){
                for (Reader u:list){
                    user.setRpwd(u.getRpwd());
                }
                if (user.getRpwd().equals(password)){
                    return "update";
                }else {
                    HttpSession session1=request.getSession();
                    session1.setAttribute(name,password);
                    return "list";
                }
            }else {
                return "err";
            }
        }else {
            return "err1";
        }
    }
    @RequestMapping("/updateReaderPassword")
    public String updateReaderPassword(@RequestParam String name,HttpServletRequest request){
        HttpSession session=request.getSession();
        String pwd= (String) session.getAttribute(name);
        Reader user=new Reader();
        user.setRpwd(pwd);
        user.setRphone(name);
        readerService.updateReaderPassword(user);
        return "redirect:/login.jsp";
    }

    @RequestMapping("/upload")
    @ResponseBody
    public  String upload( @RequestParam(value = "UploadForm[image]") MultipartFile upload,Long readId){
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
        Reader reader=new Reader();
        reader.setReadId(readId);
        reader.setImage(filename);
        readerService.updateByPrimaryKeySelective(reader);
        return "http://localhost:9090/uploads/"+filename;
    }
    @RequestMapping("/updateReaderinfo")
    public @ResponseBody Reader updateReader(HttpServletRequest request,Reader reader){
        readerService.updateByPrimaryKeySelective(reader);
        Reader r=readerService.selectByPrimaryKey(reader.getReadId());
        request.getSession().setAttribute("reader",r);
        return reader;
    }
}

package com.controller;

import com.entity.Admin;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping(path = "admin")
public class AdminController
{
    @Autowired
    private AdminService adminService;
    @RequestMapping("/findAdminAll")
    public String findAll(Model model){
        List<Admin> list=adminService.findAll();
        model.addAttribute("list",list);
        return "adminList";//暂定jsp
    }
    @RequestMapping("/insertAdmin")
    public void insertAdmin(Admin admin, HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        adminService.saveAdmin(admin);
        response.sendRedirect(request.getContextPath()+"/admin/findAll");
    }
    @RequestMapping("/updateAdmin")
    public void updateAdmin(Admin admin,HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        adminService.updateAdmin(admin);
        response.sendRedirect(request.getContextPath()+"/admin/findAll");
    }

    public void deleteAdmin(Integer id,HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        adminService.deleteAdmin(id);
        response.sendRedirect(request.getContextPath()+"/admin/findAll");
    }

    public String findByName(String name,Model model){
        List<Admin> list=adminService.findById(Integer.parseInt(name));
        model.addAttribute("list",list);
        return "";//暂定
    }
    @RequestMapping("/findInputCode")
    public @ResponseBody String findInputCode(@RequestParam("name1") String name, @RequestParam("password1") String password,@RequestParam("inputCode1") String inputCode, HttpServletRequest request,HttpServletResponse response){
        Admin admin=new Admin();
        // 图片的验证码
        String text = (String) request.getSession().getAttribute("text");
        if (!text.equalsIgnoreCase(inputCode)) {
            return "msg1";
        }
        if (name.matches("^[1][3,4,5,7,8][0-9]{9}$")){
            System.out.println("手机");
            admin.setPhoneNum(name);
            admin.setA_password(password);
            List<Admin> list=adminService.findLogin(admin);
            if (list.size()>0){
                return "list1";
            }else {
                return "err1";
            }

        }else if (name.matches("^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$")){
            System.out.println("邮箱号");
            admin.setA_password(password);
            admin.setA_email(name);
            List<Admin> list=adminService.findLogin(admin);
            if (list.size()>0){
                return "list1";
            }else {
                return "err1";
            }

        }else {
            System.out.println("id登录");
            admin.setA_id(Integer.parseInt(name));
            admin.setA_password(password);
            List<Admin> list=adminService.findLogin(admin);
            System.out.println("是我！");
            if (list.size()>0){
                return "list1";
            } else {
                return "err1";
            }
        }
    }
    @RequestMapping("/findByAdmin")
    public String login(@RequestParam String name, @RequestParam String password,@RequestParam String inputCode, HttpServletRequest request,HttpServletResponse response, Model model) throws Exception
    {
        Admin admin=new Admin();
        if (name.matches("^[1][3,4,5,7,8][0-9]{9}$")){
            System.out.println("手机");
            admin.setPhoneNum(name);
            admin.setA_password(password);
            List<Admin> list=adminService.findLogin(admin);
            for (Admin admin1:list){
                admin.setType(admin1.getType());
            }
            if (admin.getType().equals("1")){
                for (Admin admin1:list)
                {
                    //model.addAttribute("admin", admin1);
                    request.getSession().setAttribute("admin",admin1);
                }
                return "redirect:/index.jsp";
            }else if (admin.getType().equals("2")){
                for (Admin admin1:list)
                {
                    model.addAttribute("admin", admin1);
                    request.getSession().setAttribute("admin",admin1);
                }
                return "redirect:/index_good.jsp";
            }else {
                model.addAttribute("msg","没有您的用户类型，请重新输入！");
                return "loginErr";
            }

        }else if (name.matches("^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$")){
            admin.setA_password(password);
            admin.setA_email(name);
            List<Admin> list=adminService.findLogin(admin);
            for (Admin admin1:list){
                admin.setType(admin1.getType());
            }
            if (admin.getType().equals("1")){
                for (Admin admin1:list)
                {
                    //model.addAttribute("admin", admin1);
                    request.getSession().setAttribute("admin",admin1);
                }
                return "redirect:/index.jsp";
            }else if (admin.getType().equals("2")){
                for (Admin admin1:list){
                    //model.addAttribute("admin",admin1);
                    request.getSession().setAttribute("admin",admin1);
                }
                return "redirect:/index_good.jsp";
            }else {
                model.addAttribute("msg","没有您的用户类型，请重新输入！");
                return "loginErr";
            }
        }else {
            System.out.println("id登录");
            admin.setA_id(Integer.parseInt(name));
            admin.setA_password(password);
            List<Admin> list=adminService.findLogin(admin);
            for (Admin admin1:list){
                admin.setType(admin1.getType());
            }
            if (admin.getType().equals("1")){
                for (Admin admin1:list)
                {
                    //model.addAttribute("admin", admin1);
                    request.getSession().setAttribute("admin",admin1);
                }
                return "redirect:/index.jsp";
            }else if (admin.getType().equals("2")){
                for (Admin admin1:list)
                {
                    //model.addAttribute("admin", admin1);
                    request.getSession().setAttribute("admin",admin1);
                }
                return "redirect:/index_good.jsp";
            }else {
                model.addAttribute("msg","没有您的用户类型，请重新输入！");
                return "loginErr";
            }
        }
    }
    @RequestMapping("/checkAdmin")
    @ResponseBody
    public String checkAdmin(@RequestParam("name")String name,@RequestParam String password,@RequestParam String inputCode,HttpServletRequest request){
        HttpSession session=request.getSession();
        String code= (String) session.getAttribute(name);
        session.setAttribute(name,password);
        if (inputCode.equals(code)){
            Admin admin=new Admin();
            admin.setA_password(password);
            admin.setPhoneNum(name);
            List<Admin> list=adminService.findLogin(admin);
            if (list.size()>0){
                return "err1";
            }else {
                return "list";
            }
        }else {
            return "err";
        }
    }
    @RequestMapping("/saveAdminRigester")
    public String saveAdminRigester(@RequestParam("name")String name,HttpServletRequest request,Model model){
        Admin admin=new Admin();
        HttpSession session=request.getSession();
        String password= (String) session.getAttribute(name);
        System.out.println(password);
        admin.setPhoneNum(name);
        admin.setA_password(password);
        adminService.saveAdmin(admin);
        List<Admin> list=adminService.findLogin(admin);
        model.addAttribute("list",list);
        return "adminInfor";
    }
    @RequestMapping("/adminRegiser")
    public String adminRegiser(@RequestParam String stuId, @RequestParam String name, @RequestParam String email, @RequestParam String type, @RequestParam("fileUp") MultipartFile file, @RequestParam String phone, HttpServletRequest request, Model model) throws IOException
    {
        HttpSession session=request.getSession();
        String password= (String) session.getAttribute(phone);
        System.out.println(password);
        //准备使用fileupload组件完成上传
        //上传的位置

        String path=request.getSession(true).getServletContext().getRealPath("/images/");
        //判断该路劲是否存在

        File file1=new File(path);
        if (!file1.exists()){
            file1.mkdirs();
        }

        //说明上传文件项
        //获取上传文件的名称
        String filename=file.getOriginalFilename();
        //文件的名称设置为唯一值

        String uuid= UUID.randomUUID().toString().replace("-","");
        filename=uuid+"_"+filename;
        //完成文件上传
        file.transferTo(new File(path,filename));
        Admin admin=new Admin(Integer.parseInt(stuId),name,password,email,phone,type,filename);
        List<Admin> list=adminService.findLogin(admin);
        for (Admin admin1:list){
            admin.setId(admin1.getId());
        }
        adminService.updateAdmin(admin);

        if (admin.getType().equals("1")){
            model.addAttribute("admin",admin);
            return "redirect:/login.jsp";//普通管理员界面
        }else {
            model.addAttribute("admin",admin);
            return "redirect:/login.jsp";//返回到高级管理员界面
        }
    }
    @RequestMapping("/findAdminPassword")
    @ResponseBody
    public String findAdminPassword(@RequestParam("name")String name,@RequestParam String password,@RequestParam String inputCode,HttpServletRequest request){
       HttpSession session=request.getSession();
       String code= (String) session.getAttribute(name);
       if (code.equals(inputCode)){
           Admin admin=new Admin();
           List<Admin> list=adminService.findByPhoneNum(name);
           for (Admin a:list){
               admin.setA_password(a.getA_password());
           }
           if (admin.getA_password().equals(password)){
               return "update";
           }else {
               session.setAttribute(name,password);
               return "list";
           }
       }else {
           return "err";
       }
    }
    @RequestMapping("/updateAdminPassword")
    public String updateAdminPassword(@RequestParam String name,HttpServletRequest request){
        HttpSession session=request.getSession();
        String pwd= (String) session.getAttribute(name);
        Admin admin=new Admin();
        admin.setA_password(pwd);
        admin.setPhoneNum(name);
        adminService.updateByPhoneNum(admin);
        return "redirect:/login.jsp";
    }
}


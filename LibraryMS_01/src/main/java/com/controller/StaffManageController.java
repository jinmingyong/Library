package com.controller;

import com.entity.Admin;
import com.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(path = "staff")
public class StaffManageController {
    @Resource
    private AdminService adminService;

    //员工入职
    @RequestMapping(value = "startWork",produces="text/html;charset=UTF-8")
    public @ResponseBody
    String startWork(@RequestBody Admin admin){
        String msg="";
        List<Admin> alist = adminService.findById(admin.getA_id());
        if (alist.size()!=0){
            for (Admin a:alist){
                admin.setId(a.getId());
            }
            adminService.updateAdmin(admin);
            msg="员工入职成功！";
        }else {
            msg="员工入职失败！";
        }
        return msg;
//        admin.setA_password("123456");
//        adminService.saveAdmin(admin);
    }

    @RequestMapping(value = "/findAllStaff")
    public @ResponseBody List findAllStaff(){
        List<Admin> admins = adminService.findAllStaff();
        return admins;
    }

    //职位管理
    @RequestMapping(value = "/position",produces="text/html;charset=UTF-8")
    public @ResponseBody
    String positionManage(@RequestBody Admin admin){
        String msg="";
        List alist = adminService.findById(admin.getA_id());
        if (alist.size()!=0){
            adminService.updateAdminType(admin.getA_id(),admin.getType());
            msg="职位更改成功！";
        }else {
            msg="职位更改失败，你要更改的员工不存在！";
        }
        return msg;
    }

    //信息更改
    @RequestMapping(value = "/infoUpdate",produces="text/html;charset=UTF-8")
    public @ResponseBody
    String adminInfoUpdate(@RequestBody Admin admin){
        String msg="";
        List<Admin> alist = adminService.findById(admin.getA_id());
        if (alist.size()!=0){
            for (Admin a:alist){
                admin.setId(a.getId());
                admin.setType(a.getType());
            }
            adminService.updateAdmin(admin);
            msg="员工信息更改成功！";
        }else {
            msg="员工信息更改失败！您要修改的员工不存在！";
        }
        return msg;
    }

    //查询所有员工
    @RequestMapping(value = "/findAll",method = RequestMethod.POST)
    public @ResponseBody
    List findAll(){
        List<Admin> slist = adminService.findAll();
        List alist=new ArrayList();
        for (Admin admin:slist){
            if (!admin.getType().equals("0")){
                alist.add(admin);
            }
        }
        return alist;
    }

    @RequestMapping("/sendJsp")
    public String senDJsp(){
        return "redirect:/staffManage.jsp";
    }
}

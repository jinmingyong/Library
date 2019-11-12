package com.service.impl;

import com.dao.AdminDao;
import com.entity.Admin;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("adminService")
public class AdminServiceImpl implements AdminService
{
    @Resource
    private AdminDao adminDao;
    @Override
    public List<Admin> findAll()
    {
        List<Admin> list=adminDao.findAll();
        return list;
    }

    @Override
    public void saveAdmin(Admin admin)
    {
        adminDao.saveAdmin(admin);
    }

    @Override
    public void updateAdmin(Admin admin)
    {
        adminDao.updateAdmin(admin);
    }

    @Override
    public void deleteAdmin(Integer id)
    {
        adminDao.deleteAdmin(id);
    }

    @Override
    public List<Admin> findById(Integer id)
    {
        return adminDao.findById(id);
    }

    @Override
    public List<Admin> findLogin(Admin admin)
    {
        return adminDao.findLogin(admin);
    }

    @Override
    public List<Admin> findByPhoneNum(String phoneNum)
    {
        return adminDao.findByPhoneNum(phoneNum);
    }

    @Override
    public void updateByPhoneNum(Admin admin)
    {
        adminDao.updateByPhoneNum(admin);
    }
}

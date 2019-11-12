package com.service;

import com.entity.Admin;

import java.util.List;

public interface AdminService
{

    List<Admin> findAll();

    void saveAdmin(Admin admin);

    void updateAdmin(Admin admin);

    void deleteAdmin(Integer id);

    List<Admin> findById(Integer id);

    List<Admin> findLogin(Admin admin);

    List<Admin> findByPhoneNum(String phoneNum);

    void updateByPhoneNum(Admin admin);
}

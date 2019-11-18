package com.service;

import com.entity.Admin;
import org.apache.ibatis.annotations.Param;

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

    int updateAdminType( Integer a_id, String type);

    List<Admin> findAllStaff();
}

package com.dao;

import com.entity.Admin;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AdminDao
{
    //@Select("select a_id,a_name,a_password,a_email,phoneNum,type from admin")
    List<Admin> findAll();
    //@Insert("insert into admin(a_name,a_password,a_email,phoneNum,type) values(#{a_name},#{a_password},#{a_email},#{phoneNum},#{type})")
    void saveAdmin(Admin admin);
    //@Update("update admin set a_name=#{a_name},a_password=#{a_password},a_email=#{a_email},phoneNum=#{phoneNum},type=#{type} where a_id=#{a_id}")
    void updateAdmin(Admin admin);
    //@Delete("delete from admin where a_id=#{id}")
    void deleteAdmin(Integer id);
    //@Select("select * from admin where a_name=#{name}")
    List<Admin> findById(Integer id);

    List<Admin> findLogin(Admin admin);

    List<Admin> findByPhoneNum(String phoneNum);

    void updateByPhoneNum(Admin admin);

    int updateAdminType(@Param("a_id") Integer a_id, @Param("type") String type);
}

package com.service;

import com.entity.BookInuse;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IBookInuseService {
    /*
    * 查询所有上架的书
    * */
    List<BookInuse> findAll(String bname);

    PageInfo<BookInuse> findAllByPage(Integer pageNo,String bname);
}

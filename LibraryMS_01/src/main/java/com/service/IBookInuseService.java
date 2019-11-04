package com.service;

import com.entity.BookInuse;

import java.util.List;

public interface IBookInuseService {
    /*
    * 查询所有上架的书
    * */
    List<BookInuse> findAll();
}

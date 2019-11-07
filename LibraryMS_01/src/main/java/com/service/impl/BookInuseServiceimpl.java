package com.service.impl;

import com.alibaba.fastjson.JSON;
import com.dao.BookInuseMapper;
import com.entity.BookInuse;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.IBookInuseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class BookInuseServiceimpl implements IBookInuseService {
    @Resource
    private BookInuseMapper bookInuseMapper;
    @Override
    public List<BookInuse> findAll() {
        return bookInuseMapper.findAll();
    }

    @Override
    public PageInfo<BookInuse> findAllByPage(Integer pageNo) {
        PageHelper.startPage(pageNo,2);
        List<BookInuse> list=bookInuseMapper.findAll();
        PageInfo<BookInuse> pageInfo=new PageInfo<BookInuse>(list);
        return pageInfo;
    }
}

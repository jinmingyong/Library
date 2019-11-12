package com.service.impl;
import com.entity.BookBad;
import com.service.IBookBadService;
import com.dao.BookBadMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class BookBadServiceimpl implements IBookBadService {
    @Resource
    private BookBadMapper bookBadMapper;

    public List<BookBad> findAll(){
        return bookBadMapper.findAll();

    }
    public int deleteByPrimaryKey(Integer badId){
        return bookBadMapper.deleteByPrimaryKey(badId);
    }
    public int insertSelective(BookBad record){
        return bookBadMapper.insertSelective(record);
    }

    @Override
    public int insert(BookBad record) {
        return bookBadMapper.insert(record);
    }

    @Override
    public BookBad selectByPrimaryKey(Integer badId) {
        return bookBadMapper.selectByPrimaryKey(badId);
    }

    @Override
    public BookBad selectByIsbn(String isbn) {
        return bookBadMapper.selectByIsbn(isbn);
    }

    @Override
    public int updateByPrimaryKeySelective(BookBad record) {
        return bookBadMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(BookBad record) {
        return bookBadMapper.updateByPrimaryKey(record);
    }
}

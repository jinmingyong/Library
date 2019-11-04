package com.dao;

import com.entity.BookBad;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BookBadMapper {
    int deleteByPrimaryKey(Integer badId);

    int insert(BookBad record);

    int insertSelective(BookBad record);

    BookBad selectByPrimaryKey(Integer badId);

    BookBad selectByIsbn(String isbn);

    List<BookBad> findAll();

    int updateByPrimaryKeySelective(BookBad record);

    int updateByPrimaryKey(BookBad record);
}
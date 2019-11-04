package com.dao;

import com.entity.BookBad;
import com.entity.BookInuse;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BookInuseMapper {
    int deleteByPrimaryKey(Integer inuId);

    int insert(BookInuse record);

    int insertSelective(BookInuse record);

    BookInuse selectByPrimaryKey(Integer inuId);

    BookInuse selectByIsbn(String isbn);

    List<BookInuse> findAll();

    int updateByPrimaryKeySelective(BookInuse record);

    int updateByPrimaryKey(BookInuse record);
}
package com.dao;

import com.entity.ApplyBook;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ApplyBookMapper {
    ApplyBook selectByPrimaryKey(Integer Id);
    List<ApplyBook> findAll();
    ApplyBook selectByIsbn(String Isbn);
    int deleteByPrimaryKey(Integer badId);
    int insert(ApplyBook record);
    int updateByPrimaryKey(ApplyBook record);
    int updateByIsbn(ApplyBook record);

}

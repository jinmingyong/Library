package com.service;

import com.entity.ApplyBook;

import java.util.List;

public interface IApplyBookService {
    public ApplyBook selectByPrimaryKey(Integer Id);
    public List<ApplyBook> findAll();
    public ApplyBook selectByIsbn(String Isbn);
    public int deleteByPrimaryKey(Integer badId);
    public int insert(ApplyBook record);
    public int updateByPrimaryKey(ApplyBook record);
    public int updateByIsbn(ApplyBook record);
}

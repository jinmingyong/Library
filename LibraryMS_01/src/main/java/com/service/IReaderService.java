package com.service;

import com.entity.Reader;

import java.util.List;

public interface IReaderService {
    int deleteByPrimaryKey(Long readId);

    int insert(Reader record);

    int insertSelective(Reader record);

    Reader selectByPrimaryKey(Long readId);

    Reader readerlogin(String username,String pwd);

    List<Reader> selectAllReader();

    int updateByPrimaryKeySelective(Reader record);

    int updateByPrimaryKey(Reader record);
}

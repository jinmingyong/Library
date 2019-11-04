package com.dao;

import com.entity.Reader;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface ReaderMapper  {
    int deleteByPrimaryKey(Long readId);

    int insert(Reader record);

    int insertSelective(Reader record);

    Reader selectByPrimaryKey(Long readId);

    Reader readerlogin(@Param("rname") String username, @Param("rpwd")String pwd);

    List<Reader> selectAllReader();

    int updateByPrimaryKeySelective(Reader record);

    int updateByPrimaryKey(Reader record);
}
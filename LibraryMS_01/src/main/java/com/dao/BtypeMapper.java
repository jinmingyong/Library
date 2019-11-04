package com.dao;

import com.entity.Btype;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface BtypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Btype record);

    int insertSelective(Btype record);

    Btype selectByPrimaryKey(Integer id);

    List<Btype> selectAllBtype();

    int updateByPrimaryKeySelective(Btype record);

    int updateByPrimaryKey(Btype record);
}
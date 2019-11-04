package com.dao;

import com.entity.Borrow;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
@Scope("singleton")
public interface BorrowMapper{
    int deleteByPrimaryKey(Long borId);

    int insert(Borrow record);

    int insertSelective(Borrow record);

    Borrow selectByPrimaryKey(Long borId);

    List<Borrow> selectAllBorrow();

    int updateByPrimaryKeySelective(Borrow record);

    int updateByPrimaryKey(Borrow record);
}
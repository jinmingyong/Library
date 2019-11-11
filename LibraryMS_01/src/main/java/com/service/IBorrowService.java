package com.service;

import com.entity.Borrow;

import java.util.List;

public interface IBorrowService {
    int deleteByPrimaryKey(Long borId);

    int insert(Borrow record);

    int insertSelective(Borrow record);

    Borrow selectByPrimaryKey(Long borId);

    List<Borrow> selectAllBorrow();

    int updateByPrimaryKeySelective(Borrow record);

    int updateByPrimaryKey(Borrow record);

    List<Borrow> moreBorrow();
}

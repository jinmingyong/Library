package com.service.impl;

import com.dao.BorrowMapper;
import com.entity.Borrow;
import com.service.IBorrowService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BorrowServiceimpl implements IBorrowService {
    @Resource
    private BorrowMapper borrowMapper;
    @Override
    public int deleteByPrimaryKey(Long borId) {
        return 0;
    }

    @Override
    public int insert(Borrow record) {
        return 0;
    }

    @Override
    public int insertSelective(Borrow record) {
        return 0;
    }

    @Override
    public Borrow selectByPrimaryKey(Long borId) {
        return null;
    }

    @Override
    public List<Borrow> selectAllBorrow() {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Borrow record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Borrow record) {
        return 0;
    }

    @Override
    public List<Borrow> moreBorrow() {
        return borrowMapper.moreBorrow();
    }
}

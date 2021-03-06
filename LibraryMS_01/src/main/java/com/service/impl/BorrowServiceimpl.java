package com.service.impl;

import com.dao.BookInuseMapper;
import com.dao.BorrowMapper;
import com.entity.BookInuse;
import com.entity.Borrow;
import com.github.pagehelper.PageHelper;
import com.service.IBorrowService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("borrowService")
public class BorrowServiceimpl implements IBorrowService {

    @Resource
    private  BorrowMapper borrowMapper;
    @Resource
    private BookInuseMapper bookInuseMapper;

    @Override
    //删除
    public int deleteByPrimaryKey(Long borId) {
        return borrowMapper.deleteByPrimaryKey(borId);
    }

    @Override
    //插入
    public int insert(Borrow record) {
        BookInuse bookInuse=bookInuseMapper.selectByIsbn(record.getIsbn());
        bookInuse.setAmount(bookInuse.getAmount()-1);
        bookInuseMapper.updateByPrimaryKeySelective(bookInuse);
        return borrowMapper.insert(record);
    }

    @Override
    //动态查询（目前不会弄）
    public int insertSelective(Borrow record) {
        return borrowMapper.insertSelective(record);
    }

    @Override
    public Borrow selectByPrimaryKey(Long borId) {
        return borrowMapper.selectByPrimaryKey(borId);
    }

    @Override
    public List<Borrow> selectAllBorrow() {
        return borrowMapper.selectAllBorrow();
    }

    @Override
    public List<Borrow> selectAllBorrow(Integer pageNum) {
        PageHelper.startPage(pageNum,5);
        return borrowMapper.selectAllBorrow();
    }

    @Override
    public List<Borrow> selectByBorType() {
        return borrowMapper.selectByBorType();
    }

    @Override
    public List<Borrow> selectByBorType(Integer pageNum) {
        PageHelper.startPage(pageNum,5);
        return borrowMapper.selectByBorType();
    }

    @Override
    public int updateByPrimaryKeySelective(Borrow record) {
        return borrowMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Borrow record) {
        return borrowMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Borrow> selectByRid(Long rid) {
        return borrowMapper.selectByRid(rid);
    }

    @Override
    public List<Borrow> selectByRid(Long rid, Integer pageNum) {
        PageHelper.startPage(pageNum,5);
        return borrowMapper.selectByRid(rid);
    }

    @Override
    public List<Borrow> selectCheckTime() {
        return borrowMapper.selectCheckTime();
    }

    @Override
    public List<Borrow> selectCheckTime(Integer pageNum) {
        PageHelper.startPage(pageNum,5);
        return borrowMapper.selectCheckTime();
    }

    @Override
    public List<Borrow> selectByRidWithoutType1(Long rid) {
        return borrowMapper.selectByRidWithoutType1(rid);
    }

    @Override
    public List<Borrow> selectByRidWithoutType1(Long rid, Integer pageNum) {
        PageHelper.startPage(pageNum,5);
        return borrowMapper.selectByRidWithoutType1(rid);
    }

    @Override
    public List<Borrow> selectByRidWithType1(Long rid) {
        return borrowMapper.selectByRidWithType1(rid);
    }

    @Override
    public List<Borrow> selectByRidWithType1(Long rid, Integer pageNum) {
        PageHelper.startPage(pageNum,5);
        return borrowMapper.selectByRidWithType1(rid);
    }

    @Override
    public List<Borrow> moreBorrow() {
        return borrowMapper.moreBorrow();
    }
}

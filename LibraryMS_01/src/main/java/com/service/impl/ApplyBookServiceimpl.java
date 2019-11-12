package com.service.impl;

import com.dao.ApplyBookMapper;
import com.entity.ApplyBook;
import com.service.IApplyBookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("applyBookService")
public class ApplyBookServiceimpl implements IApplyBookService {
    @Resource
    private ApplyBookMapper applyBookMapper;
    @Override
    public ApplyBook selectByPrimaryKey(Integer Id) {
        return applyBookMapper.selectByPrimaryKey(Id);
    }

    @Override
    public List<ApplyBook> findAll() {
        return applyBookMapper.findAll();
    }

    @Override
    public ApplyBook selectByIsbn(String Isbn) {
        return applyBookMapper.selectByIsbn(Isbn);
    }

    @Override
    public int deleteByPrimaryKey(Integer badId) {
        return applyBookMapper.deleteByPrimaryKey(badId);
    }

    @Override
    public int insert(ApplyBook record) {
        return applyBookMapper.insert(record);
    }

    @Override
    public int updateByPrimaryKey(ApplyBook record) {
        return applyBookMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByIsbn(ApplyBook record) {
        return applyBookMapper.updateByIsbn(record);
    }
}

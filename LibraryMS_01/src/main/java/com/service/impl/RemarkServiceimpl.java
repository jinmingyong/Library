package com.service.impl;

import com.dao.RemarkMapper;
import com.entity.Remark;
import com.github.pagehelper.PageHelper;
import com.service.IRemarkService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class RemarkServiceimpl implements IRemarkService {
    @Resource
    private RemarkMapper remarkMapper;
    @Override
    public int deleteByPrimaryKey(Long remId) {
        return remarkMapper.deleteByPrimaryKey(remId);
    }

    @Override
    public int insert(Remark record) {
        return remarkMapper.insert(record);
    }

    @Override
    public int insertSelective(Remark record) {
        return remarkMapper.insertSelective(record);
    }

    @Override
    public Remark selectByPrimaryKey(Long remId) {
        return remarkMapper.selectByPrimaryKey(remId);
    }

    @Override
    public List<Remark> selectAllRemark() {
        return remarkMapper.selectAllRemark();
    }

    @Override
    public List<Remark> selectRemarkBycomId(Long comId) {
        return remarkMapper.selectRemarkBycomId(comId);
    }

    @Override
    public List<Remark> selectRemarkBycomId(Long comId, Integer pageNum) {
        PageHelper.startPage(pageNum,3);
        return remarkMapper.selectRemarkBycomId(comId);
    }

    @Override
    public int updateByPrimaryKeySelective(Remark record) {
        return remarkMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(Remark record) {
        return remarkMapper.updateByPrimaryKeyWithBLOBs(record);
    }

    @Override
    public int updateByPrimaryKey(Remark record) {
        return remarkMapper.updateByPrimaryKey(record);
    }
}

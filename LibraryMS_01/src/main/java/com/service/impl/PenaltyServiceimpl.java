package com.service.impl;

import com.dao.PenaltyMapper;
import com.entity.Penalty;
import com.service.IPenaltyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("PenaltyService")
public class PenaltyServiceimpl implements IPenaltyService {
    @Autowired
    private PenaltyMapper penaltyMapper;

    @Override
    public int deleteByPrimaryKey(Long penId) {
        return penaltyMapper.deleteByPrimaryKey(penId);
    }

    @Override
    public int insert(Penalty record) {
        return penaltyMapper.insert(record);
    }

    @Override
    public int insertSelective(Penalty record) {
        return penaltyMapper.insertSelective(record);
    }

    @Override
    public Penalty selectByPrimaryKey(Long penId) {
        return penaltyMapper.selectByPrimaryKey(penId);
    }

    @Override
    public List<Penalty> selectAllPenalty() {
        return penaltyMapper.selectAllPenalty();
    }

    @Override
    public int updateByPrimaryKeySelective(Penalty record) {
        return penaltyMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Penalty record) {
        return penaltyMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Penalty> selectPenaltyByRid(String rid) {
        return penaltyMapper.selectPenaltyByRid(rid);
    }
}

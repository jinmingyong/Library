package com.service;

import com.entity.Penalty;

import java.util.List;

public interface IPenaltyService  {
    int deleteByPrimaryKey(Long penId);

    int insert(Penalty record);

    int insertSelective(Penalty record);

    Penalty selectByPrimaryKey(Long penId);

    List<Penalty> selectAllPenalty();

    int updateByPrimaryKeySelective(Penalty record);

    int updateByPrimaryKey(Penalty record);

    List<Penalty> selectPenaltyByRid(String rid);
}

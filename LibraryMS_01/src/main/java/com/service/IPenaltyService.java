package com.service;

import com.entity.Penalty;

import java.util.List;

public interface IPenaltyService  {
    int deleteByPrimaryKey(Long penId);

    int insert(Penalty record);

    int insertSelective(Penalty record);

    Penalty selectByPrimaryKey(Long penId);

    List<Penalty> selectAllPenalty();

    List<Penalty> selectAllPenalty(Integer pageNum);

    int updateByPrimaryKeySelective(Penalty record);

    int updateByPrimaryKey(Penalty record);

    List<Penalty> selectPenaltyByRid(String rid);

    List<Penalty> selectPenaltyByRid(String rid,Integer pageNum);
}

package com.dao;

import com.entity.Penalty;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface PenaltyMapper  {
    int deleteByPrimaryKey(Long penId);

    int insert(Penalty record);

    int insertSelective(Penalty record);

    Penalty selectByPrimaryKey(Long penId);

    List<Penalty> selectAllPenalty();

    int updateByPrimaryKeySelective(Penalty record);

    int updateByPrimaryKey(Penalty record);
}
package com.service;

import com.entity.Remark;

import java.util.List;

public interface IRemarkService {
    int deleteByPrimaryKey(Long remId);

    int insert(Remark record);

    int insertSelective(Remark record);

    Remark selectByPrimaryKey(Long remId);

    List<Remark> selectAllRemark();

    List<Remark> selectRemarkBycomId(Long comId);

    List<Remark> selectRemarkBycomId(Long comId,Integer pageNum);

    int updateByPrimaryKeySelective(Remark record);

    int updateByPrimaryKeyWithBLOBs(Remark record);

    int updateByPrimaryKey(Remark record);
}

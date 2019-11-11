package com.dao;

import com.entity.Remark;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RemarkMapper {
    int deleteByPrimaryKey(Long remId);

    int insert(Remark record);

    int insertSelective(Remark record);

    Remark selectByPrimaryKey(Long remId);

    List<Remark> selectAllRemark();

    List<Remark> selectRemarkBycomId(Long comId);

    List<Remark> selectRemarkBycomIdreply(@Param("comid")Long comid, @Param("fatherremid")Long fatherremid);

    int updateByPrimaryKeySelective(Remark record);

    int updateByPrimaryKeyWithBLOBs(Remark record);

    int updateByPrimaryKey(Remark record);
}
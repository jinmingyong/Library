package com.dao;

import com.entity.Borrow;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface BorrowMapper{
    int deleteByPrimaryKey(Long borId);

    int insert(Borrow record);

    int insertSelective(Borrow record);

    Borrow selectByPrimaryKey(Long borId);

    List<Borrow> selectAllBorrow();

    /**
     * 查询type不是1（归还）的信息
     * @return
     */
    List<Borrow> selectByBorType();

    /**
     *根据id修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Borrow record);

    /**
     * 修改
     * @param record
     * @return
     */
    int updateByPrimaryKey(Borrow record);

    List<Borrow> selectByRid(Long rid);

    List<Borrow> selectCheckTime();

    /**
     * 查询单个学生未还的信息
     * @param rid
     * @return
     */
    List<Borrow> selectByRidWithoutType1(@Param("rid") Long rid);

    /**
     * 查询单个学生已还的信息
     */
    List<Borrow> selectByRidWithType1(@Param("rid") Long rid);

    List<Borrow> moreBorrow();
}
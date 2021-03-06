package com.service;

import com.entity.Borrow;

import java.util.List;

public interface IBorrowService {
    int deleteByPrimaryKey(Long borId);

    int insert(Borrow record);

    int insertSelective(Borrow record);

    Borrow selectByPrimaryKey(Long borId);

    List<Borrow> selectAllBorrow();

    List<Borrow> selectAllBorrow(Integer pageNum);

    /**
     * 查询type不是1（归还）的信息
     * @return
     */
    List<Borrow> selectByBorType();


    List<Borrow> selectByBorType(Integer pageNum);

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

    List<Borrow> selectByRid(Long rid,Integer pageNum);

    /**
     * 根据应还时间和bortype来判断是否需要罚款
     * @return
     */
    List<Borrow> selectCheckTime();

    List<Borrow> selectCheckTime(Integer pageNum);

    /**
     * 查询单个学生未还的信息
     * @param rid
     * @return
     */
    List<Borrow> selectByRidWithoutType1(Long rid);

    List<Borrow> selectByRidWithoutType1(Long rid,Integer pageNum);

    /**
     * 查询单个学生已还的信息
     */
    List<Borrow> selectByRidWithType1(Long rid);

    List<Borrow> selectByRidWithType1(Long rid,Integer pageNum);

    List<Borrow> moreBorrow();

}

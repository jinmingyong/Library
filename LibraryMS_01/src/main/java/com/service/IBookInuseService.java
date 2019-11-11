package com.service;

import com.entity.BookInuse;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IBookInuseService {
    /**
     * 根据主键删除
     * @param inuId
     * @return
     */
    int deleteByPrimaryKey(Integer inuId);

    /**
     * 插入
     * @param record
     * @return
     */
    int insert(BookInuse record);

    /**
     * 动态插入
     * @param record
     * @return
     */
    int insertSelective(BookInuse record);

    /**
     * 根据主键查询
     * @param inuId
     * @return
     */
    BookInuse selectByPrimaryKey(Integer inuId);

    /**
     * 根据ISBN查询
     * @param isbn
     * @return
     */
    BookInuse selectByIsbn(String isbn);

    /**
     * 全部查询
     * @return
     */
    List<BookInuse> findAll();

    /**
     * 根据主键动态修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(BookInuse record);

    /**
     * 根据主键修改
     * @param record
     * @return
     */
    int updateByPrimaryKey(BookInuse record);
    /**
     * 根据数量查询
     */
    List<BookInuse> selectByAccount(Integer account);

    int updateInuseShelf(String isbn, Integer account);

    int deleteInuseShelf(Integer id);

    int insertInuseShelf(String isbn, Integer account);

    List<BookInuse> findAll(String bname);

    PageInfo<BookInuse> findAllByPage(Integer pageNo, String bname);

}

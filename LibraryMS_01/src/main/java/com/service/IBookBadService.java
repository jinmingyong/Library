package com.service;

import java.util.List;
import com.entity.BookBad;

public interface IBookBadService {
    /*
     * 查询所有损坏书
     * */
    public List<BookBad> findAll();
    /*
     * 根据主键删除一条损坏图书数据(销毁图书)
     * */
    public int deleteByPrimaryKey(Integer badId);
    /*
     * 报废的图书放入报废室（报废库）
     * */
    public int insert(BookBad record);
    public int insertSelective(BookBad record);
    /*
     * 通过编号来查找损坏的书籍
     * */
    public BookBad selectByPrimaryKey(Integer badId);
    /*
     * 通过isbn来查找损坏的书籍
     * */
    public BookBad selectByIsbn(String isbn);
    /*
     * 通过查询结果来更新
     * */
    public int updateByPrimaryKeySelective(BookBad record);
    /*
     * 直接更新
     * */
    public int updateByPrimaryKey(BookBad record);
}

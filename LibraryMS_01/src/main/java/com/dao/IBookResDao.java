package com.dao;

import com.entity.BookRes;
import org.apache.ibatis.annotations.Insert;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository("bookResDao")
public interface IBookResDao  {
    //添加
    int addBookRes(BookRes bookRes);
    //批量添加
    int addBookResList(List<BookRes> bookResList);
    //更新
    int updateBookRes(BookRes bookRes);
    //批量更新
    int updateBookResList(List<BookRes> bookResList);

    int updateByPrimaryKeySelective(BookRes bookRes);
    //删除
    int deleBookRes (Integer id);
    //批量删除
    int deleBookResList(List<Integer> ids);
    //查询全部
    List<BookRes> findAllBookRes();
    //id查询
    BookRes findBookResById(Integer id);
    //模糊查询
    List<BookRes> findBookResByName(String bname);

    BookRes findBookResByIsbn(String isbn);
}

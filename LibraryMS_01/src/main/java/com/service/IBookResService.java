package com.service;

import com.entity.BookRes;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IBookResService {
    //图书进货
    int addBookRes(BookRes bookRes);
    //批量图书进货
    int addBookResList(List<BookRes> bookRess);
    //修改
    int updateBookRes(BookRes bookRes);
    //批量修改
/*    int updateBookResList(List<BookRes> bookRess);*/
    //删除
    int deleteBookRes(Integer id);
    //批量删除
    int deleteBookResList(List<Integer> ids);
    //模糊查询
    List<BookRes> findBookResByName(String bname);
/*    //类型查询
    List<BookRes> findBookResByType(String btybe);*/
    //id查询
    BookRes findBookResById(Integer id);
    //查询所有
    List<BookRes> findAll();
    //分页
    List<BookRes> findAllByPage(Integer pageNo);
    /*
    * 图书上架
    * */
    int bookshelf(Integer bid,int num);

    /*
    * 图书损坏
    * */
    int bookdamage(Integer bid,int num);


}

package com.service;

import com.entity.BookBooking;
import com.entity.Borrow;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: MrLiu
 * Date: 2019/11/7
 */
public interface IBookBookingService {
    //添加
    void insert(BookBooking bookBooking);
    //批量添加
    int insertList(List<BookBooking> bookBookingList);
    //删除
    public void delete(Integer[] id);

    //按id查询
    BookBooking findBookBookingbyid(Integer id);
    //按读者编号查询
    List<BookBooking> findBookBookingbyrid(Integer rid);
    //按图书编号查询
    List<BookBooking> findBookBookingbybid(Integer bid);
    //查询所有
    List<BookBooking> findAllBookBooking();
    //分页查询
    List<BookBooking> findAllBookBookingByPage(Integer pageNo);
    //查询图书预约数量
    int BookingNum(Integer bid);

    String getIsbn(Integer bid);

    int insertSelective(Borrow record);
}

package com.dao;

import com.entity.BookBooking;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


/**
 * Created by IntelliJ IDEA.
 * User: MrLiu
 * Date: 2019/11/7
 */
@Repository("bookBookingMapper")
public interface BookBookingMapper {
    //添加
    void insert(BookBooking bookBooking);
    //批量添加
    int insertList(List<BookBooking> bookBookingList);
    //删除
    public void delete(Integer[] id);

    //按读者编号查询
    List<BookBooking> findBookBookingbyrid(Integer rid);
    //按图书编号查询
    List<BookBooking> findBookBookingbybid(Integer bid);
    //查询所有
    List<BookBooking> findAllBookBooking();
    //查询图书预约数量
    int BookingNum(Integer bid);
}

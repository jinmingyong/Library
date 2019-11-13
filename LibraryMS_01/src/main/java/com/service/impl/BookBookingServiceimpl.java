package com.service.impl;


import com.dao.BookBookingMapper;
import com.entity.BookBooking;
import com.entity.Borrow;
import com.github.pagehelper.PageHelper;
import com.service.IBookBookingService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;


/**
 * Created by IntelliJ IDEA.
 * User: MrLiu
 * Date: 2019/11/7
 */
@Service("bookBookingService")
public class BookBookingServiceimpl implements IBookBookingService {
    @Resource(name = "bookBookingMapper")
    private BookBookingMapper bookBookingMapper;






    @Override
    public void insert(BookBooking bookBooking) {
        bookBookingMapper.insert(bookBooking);
    }

    @Override
    public int insertList(List<BookBooking> bookBookingList) {
        return bookBookingMapper.insertList(bookBookingList);
    }

    @Override
    public void delete(Integer[] id) {
        bookBookingMapper.delete(id);
    }

    @Override
    public BookBooking findBookBookingbyid(Integer id) {
        return bookBookingMapper.findBookBookingbyid(id);
    }


    @Override
    public List<BookBooking> findBookBookingbyrid(Integer rid) {
        return bookBookingMapper.findBookBookingbyrid(rid);
    }

    @Override
    public List<BookBooking> findBookBookingbybid(Integer bid) {
        return bookBookingMapper.findBookBookingbybid(bid);
    }

    @Override
    public List<BookBooking> findAllBookBooking() {
        return bookBookingMapper.findAllBookBooking();
    }

    @Override
    public List<BookBooking> findAllBookBookingByPage(Integer pageNo) {
        PageHelper.startPage(pageNo,5);
        return bookBookingMapper.findAllBookBooking();

    }

    @Override
    public int BookingNum(Integer bid) {
      return   bookBookingMapper.findBookBookingbybid(bid).size();

    }

    @Override
    public String getIsbn(Integer bid) {
        return bookBookingMapper.getIsbn(bid);
    }

    public int insertSelective(Borrow record) {
        return bookBookingMapper.insertSelective(record);
    }
}

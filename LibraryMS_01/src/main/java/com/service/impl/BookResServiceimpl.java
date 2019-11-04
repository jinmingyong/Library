package com.service.impl;

import com.dao.BookBadMapper;
import com.dao.BookInuseMapper;
import com.dao.IBookResDao;
import com.entity.BookBad;
import com.entity.BookInuse;
import com.entity.BookRes;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.IBookResService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("bookResService")
public class BookResServiceimpl implements IBookResService {
    @Resource(name = "bookResDao")
    private IBookResDao bookResDao;
    @Resource
    private BookBadMapper bookBadMapper;
    @Resource
    private BookInuseMapper bookInuseMapper;


    @Override
    public int addBookRes(BookRes bookRes) {
        return bookResDao.addBookRes(bookRes);
    }

    @Override
    public int addBookResList(List<BookRes> bookRess) {
        return bookResDao.addBookResList(bookRess);
    }

    @Override
    public int updateBookRes(BookRes bookRes) {
        return bookResDao.updateByPrimaryKeySelective(bookRes);
    }

    @Override
    public int deleteBookRes(Integer id) {
        return bookResDao.deleBookRes(id);
    }

    @Override
    public int deleteBookResList(List<Integer> ids) {
        return bookResDao.deleBookResList(ids);
    }

    @Override
    public List<BookRes> findBookResByName(String bname) {
        return bookResDao.findBookResByName(bname);
    }

/*    @Override
    public List<BookRes> findBookResByType(String btybe) {
        return bookResDao.f;
    }*/

    @Override
    public BookRes findBookResById(Integer id) {
        return bookResDao.findBookResById(id);
    }

    @Override
    public List<BookRes> findAll() {
        return bookResDao.findAllBookRes();
    }

    @Override
    public List<BookRes> findAllByPage(Integer pageNo) {
        PageHelper.startPage(pageNo,5);
        List<BookRes> list=bookResDao.findAllBookRes();
        return list;
    }

    @Override
    public int bookshelf(Integer bid, int num) {
        BookRes bookRes=bookResDao.findBookResById(bid);
        String isbn=bookRes.getIsbn();
        BookInuse bookInuse=bookInuseMapper.selectByIsbn(isbn);
        if (bookInuse==null){
            BookInuse bI=new BookInuse();
            bI.setAmount(num);
            bI.setIsbn(isbn);
            bookInuseMapper.insertSelective(bI);
        }
        bookRes.setAmount(bookRes.getAmount()-num);
        bookInuse.setAmount(bookInuse.getAmount()+num);

        bookResDao.updateBookRes(bookRes);
        bookInuseMapper.updateByPrimaryKeySelective(bookInuse);
        return 1;
    }

    @Override
    public int bookdamage(Integer bid, int num) {
        BookRes bookRes=bookResDao.findBookResById(bid);
        String isbn=bookRes.getIsbn();
        BookBad bookBad=bookBadMapper.selectByIsbn(isbn);
        if (bookBad==null){
            BookBad bb=new BookBad();
            bb.setBadnum(num);
            bb.setIsbn(isbn);
            bookBadMapper.insertSelective(bb);
        }
        bookRes.setAmount(bookRes.getAmount()-num);
        bookBad.setBadnum(bookBad.getBadnum()+num);

        bookResDao.updateBookRes(bookRes);
        bookBadMapper.updateByPrimaryKeySelective(bookBad);
        return 1;
    }


}

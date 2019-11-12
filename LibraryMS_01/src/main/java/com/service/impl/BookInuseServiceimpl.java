package com.service.impl;

import com.dao.BookInuseMapper;
import com.entity.BookInuse;
import com.entity.BookRes;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.IBookInuseService;
import com.service.IBookResService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service("iBookInuseService")
public class BookInuseServiceimpl implements IBookInuseService {
    @Autowired
    private BookInuseMapper bookInuseMapper;
    @Autowired
    private IBookResService iBookResService;
    @Override
    public int deleteByPrimaryKey(Integer inuId) {
        return bookInuseMapper.deleteByPrimaryKey(inuId);
    }

    @Override
    public int insert(BookInuse record) {
        return bookInuseMapper.insert(record);
    }

    @Override
    public int insertSelective(BookInuse record) {
        return bookInuseMapper.insertSelective(record);
    }

    @Override
    public BookInuse selectByPrimaryKey(Integer inuId) {
        return bookInuseMapper.selectByPrimaryKey(inuId);
    }

    @Override
    public BookInuse selectByIsbn(String isbn) {
        return bookInuseMapper.selectByIsbn(isbn);
    }

    @Override
    public List<BookInuse> findAll() {
        return bookInuseMapper.findAll();
    }

    @Override
    public int updateByPrimaryKeySelective(BookInuse record) {
        return bookInuseMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(BookInuse record) {
        return bookInuseMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<BookInuse> selectByAccount(Integer account) {
        return bookInuseMapper.selectByAccount(account);
    }

    @Override
    public int updateInuseShelf(String isbn, Integer account) {
        BookInuse bookInuse=selectByIsbn(isbn);
        System.out.println("bookInuse:"+bookInuse);
        BookRes bookRes=iBookResService.findBookResByisbn(isbn);
        System.out.println("bookRes:"+bookInuse);
        System.out.println("数量:"+(bookInuse.getAmount()+account));
        if (bookInuse!=null){
            bookInuse.setAmount((bookInuse.getAmount()+account));
            updateByPrimaryKey(bookInuse);
            if (bookRes.getAmount()>account){
                bookRes.setAmount(bookRes.getAmount()-account);
                int i=iBookResService.updateBookRes(bookRes);
                return i;
            }else {
                int i=0;
                return i;
            }
        }else {
            int i=0;
            return i;
        }
    }

    @Override
    public int deleteInuseShelf(Integer id) {
        BookInuse bookInuse=selectByPrimaryKey(id);
        BookRes bookRes=iBookResService.findBookResByisbn(bookInuse.getIsbn());
        bookRes.setAmount((bookRes.getAmount()+bookInuse.getAmount()));
        iBookResService.updateBookRes(bookRes);
        int i=deleteByPrimaryKey(id);
        return i;
    }

    @Override
    public int insertInuseShelf(String isbn, Integer account) {
        BookInuse bookInuse1=selectByIsbn(isbn);
        BookInuse bookInuse=new BookInuse();
        if (bookInuse1==null) {
            BookRes bookRes = iBookResService.findBookResByisbn(isbn);
            if (bookRes != null) {
                if (bookRes.getAmount()>account){
                    bookInuse.setIsbn(isbn);
                    bookInuse.setAmount(account);
                    bookInuse.setInusetime(new Date());
                    int i = insert(bookInuse);
                    bookRes.setAmount((bookRes.getAmount() - account));
                    int ii = iBookResService.updateBookRes(bookRes);
                    return ii;
                }else{
                    return 0;
                }
            } else {
                return 0;
            }
        }else {
            return 0;
        }
    }

    @Override
    public List<BookInuse> findAll(String bname) {
        return bookInuseMapper.findAll(bname);
    }

    @Override
    public PageInfo<BookInuse> findAllByPage(Integer pageNo, String bname) {
        PageHelper.startPage(pageNo,6);
        List<BookInuse> list=bookInuseMapper.findAll("%"+bname+"%");
        PageInfo<BookInuse> pageInfo=new PageInfo<BookInuse>(list);
        return pageInfo;
    }
}

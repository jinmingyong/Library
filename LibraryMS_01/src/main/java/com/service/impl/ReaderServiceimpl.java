package com.service.impl;

import com.dao.ReaderMapper;
import com.entity.Reader;
import com.service.IReaderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("readerService")
public class ReaderServiceimpl implements IReaderService {
    @Resource
    private ReaderMapper readerMapper;

    @Override
    public int deleteByPrimaryKey(Long readId) {
        return 0;
    }

    @Override
    public int insert(Reader record) {
        return 0;
    }

    @Override
    public int insertSelective(Reader record) {
        return 0;
    }

    @Override
    public Reader selectByPrimaryKey(Long readId) {
        return readerMapper.selectByPrimaryKey(readId);
    }

    @Override
    public Reader readerlogin(String username, String pwd) {
        return readerMapper.readerlogin(username,pwd);
    }

    @Override
    public List<Reader> selectAllReader() {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Reader record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Reader record) {
        return 0;
    }

    //吴原荣
    @Override
    public List<Reader> findReaderAll()
    {
        List<Reader> list=readerMapper.findReaderAll();
        return list;
    }

    @Override
    public void saveReader(Reader student)
    {
        readerMapper.saveReader(student);
    }

    @Override
    public void updateReader(Reader student)
    {
        readerMapper.updateReader(student);
    }

    @Override
    public void deleteReader(Integer id)
    {
        readerMapper.deleteReader(id);
    }

    @Override
    public List<Reader> findByName(String name)
    {
        List<Reader> list=readerMapper.findByName(name);
        return list;
    }

    @Override
    public List<Reader> findLogin(Reader user)
    {
        return readerMapper.findLogin(user);
    }

    @Override
    public void updateReaderPassword(Reader user)
    {
        readerMapper.updateReaderPassword(user);
    }

    @Override
    public List<Reader> findByPhoneNum(String phoneNum)
    {
        return readerMapper.findByPhoneNum(phoneNum);
    }
}

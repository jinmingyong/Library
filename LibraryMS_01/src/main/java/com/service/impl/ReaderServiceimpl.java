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
}

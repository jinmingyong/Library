package com.dao;

import com.entity.Chat;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface ChatMapper  {
    int deleteByPrimaryKey(Long chatId);

    int insert(Chat record);

    int insertSelective(Chat record);

    Chat selectByPrimaryKey(Long chatId);

    List<Chat> selectAllChat();

    int updateByPrimaryKeySelective(Chat record);

    int updateByPrimaryKeyWithBLOBs(Chat record);

    int updateByPrimaryKey(Chat record);
}
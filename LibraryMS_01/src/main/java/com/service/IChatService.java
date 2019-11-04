package com.service;

import com.entity.Chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface IChatService {
    int deleteByPrimaryKey(Long chatId);

    int insert(Chat record);

    int insertSelective(Chat record);

    Chat selectByPrimaryKey(Long chatId);

    List<Chat> selectAllChat();

    int updateByPrimaryKeySelective(Chat record);

    int updateByPrimaryKeyWithBLOBs(Chat record);

    int updateByPrimaryKey(Chat record);
}

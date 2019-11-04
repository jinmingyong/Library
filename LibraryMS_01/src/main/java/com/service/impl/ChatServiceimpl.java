package com.service.impl;

import com.dao.ChatMapper;
import com.dao.ReaderMapper;
import com.entity.Chat;
import com.entity.Reader;
import com.service.IChatService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("chatService")
public class ChatServiceimpl implements IChatService {
    @Resource
    private ChatMapper chatMapper;
    @Resource
    private ReaderMapper readerMapper;
    @Override
    public int deleteByPrimaryKey(Long chatId) {
        return chatMapper.deleteByPrimaryKey(chatId);
    }

    @Override
    public int insert(Chat record) {
        return chatMapper.insert(record);
    }

    @Override
    public int insertSelective(Chat record) {
        return chatMapper.insertSelective(record);
    }

    @Override
    public Chat selectByPrimaryKey(Long chatId) {
        return chatMapper.selectByPrimaryKey(chatId);
    }

    @Override
    public List<Chat> selectAllChat() {
        return chatMapper.selectAllChat();
    }

    @Override
    public int updateByPrimaryKeySelective(Chat record) {
        return chatMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(Chat record) {
        return chatMapper.updateByPrimaryKeyWithBLOBs(record);
    }

    @Override
    public int updateByPrimaryKey(Chat record) {
        return chatMapper.updateByPrimaryKey(record);
    }
}

package com.service.impl;

import com.dao.CommentMapper;
import com.entity.Comment;
import com.service.ICommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("commentService")
public class CommentServiceimpl implements ICommentService {
    @Resource
    CommentMapper commentMapper;
    @Override
    public int deleteByPrimaryKey(Long comId) {
        return commentMapper.deleteByPrimaryKey(comId);
    }

    @Override
    public int insert(Comment record) {
        return commentMapper.insert(record);
    }

    @Override
    public int insertSelective(Comment record) {
        return 0;
    }

    @Override
    public Comment selectByPrimaryKey(Long comId) {
        return null;
    }

    @Override
    public List<Comment> selectAllComment() {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Comment record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(Comment record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Comment record) {
        return 0;
    }
}

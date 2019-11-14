package com.service.impl;

import com.dao.CommentMapper;
import com.entity.Comment;
import com.github.pagehelper.PageHelper;
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
        return commentMapper.insertSelective(record);
    }

    @Override
    public Comment selectByPrimaryKey(Long comId) {
        return commentMapper.selectByPrimaryKey(comId);
    }

    @Override
    public List<Comment> selectAllComment() {
        return commentMapper.selectAllComment();
    }

    @Override
    public List<Comment> selectCommentByIsbn(String isbn) {
        return commentMapper.selectCommentByIsbn(isbn);
    }

    @Override
    public List<Comment> selectCommentByTitle(String title,String isbn ,Integer pageNum) {
        PageHelper.startPage(pageNum,5);
        return commentMapper.selectCommentByTitle("%"+title+"%",isbn);
    }

    @Override
    public List<Comment> selectCommentByIsbn(String isbn, Integer pageNum) {
        PageHelper.startPage(pageNum,5);
        return commentMapper.selectCommentByIsbn(isbn);
    }

    @Override
    public int updateByPrimaryKeySelective(Comment record) {
        return commentMapper.updateByPrimaryKeySelective(record);
    }



    @Override
    public int updateByPrimaryKey(Comment record) {
        return commentMapper.updateByPrimaryKey(record);
    }
}

package com.service;

import com.entity.Comment;

import java.util.List;

public interface ICommentService {
    int deleteByPrimaryKey(Long comId);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Long comId);

    List<Comment> selectAllComment();

    List<Comment> selectCommentByIsbn(String isbn);

    List<Comment> selectCommentByIsbn(String isbn,Integer pageNum);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}

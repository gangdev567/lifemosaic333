package com.itwill.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.project.domain.Comment;
import com.itwill.project.dto.comment.CommentRegisterDto;
import com.itwill.project.dto.comment.CommentUpdateDto;
import com.itwill.project.repository.CommentDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class CommentService {
    
    private final CommentDao commentDao;

    public Long commentCheck(Long post_id) {
        
        Long result = commentDao.commentCheck(post_id);
        
        return result;
    }

    public List<Comment> getAllComment(Long post_id, Long commentEnd, Long commentStart) {
        
        List<Comment> comments = commentDao.getAllComment(post_id, commentEnd, commentStart);
        
        return comments;
    }

    public int create(CommentRegisterDto dto) {
        
        int result = commentDao.insert(dto.toEntiy());
        
        return result;
    }

    public int update(CommentUpdateDto dto) {
        
        int result = commentDao.update(dto.toEntity());
        
        return result;
    }
}

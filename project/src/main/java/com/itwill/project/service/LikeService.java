package com.itwill.project.service;

import org.springframework.stereotype.Service;

import com.itwill.project.dto.like.PostLikeDto;
import com.itwill.project.repository.LikeDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class LikeService {
    
    private final LikeDao likeDao;

    public int postLikeIncrease(Long post_id) {
        
        int result = likeDao.postLikeIncrease(post_id);
        
        return result;
    }

    public PostLikeDto likeCount(Long post_id) {
        
        PostLikeDto dto = likeDao.likeCount(post_id);
        
        return dto;
    }
}

package com.itwill.project.repository;

import com.itwill.project.dto.like.PostLikeDto;

public interface LikeDao {

    int postLikeIncrease(Long post_id);

    PostLikeDto likeCount(Long post_id);

}

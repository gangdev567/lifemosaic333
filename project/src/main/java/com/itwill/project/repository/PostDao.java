package com.itwill.project.repository;

import java.util.List;

import com.itwill.project.domain.Post;

public interface PostDao {
    
    List<Post> selectOrderByDesc();
    
    Long postCount();
    
    Post selectById(long id);
    
    int insert(Post post);
    
    int update(Post post);
    
    int delete(long id);
    
}

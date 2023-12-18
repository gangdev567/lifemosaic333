package com.itwill.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.project.domain.Post;

public interface PostDao {
    
    List<Post> selectOrderByDesc(@Param("pageEnd") Long pageEnd,@Param("pageStart") Long pageStart);
    
    Long postCount();
    
    Post selectById(long id);
    
    int insert(Post post);
    
    int update(Post post);
    
    int delete(long id);
    
}
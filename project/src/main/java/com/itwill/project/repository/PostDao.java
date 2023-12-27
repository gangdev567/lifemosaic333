package com.itwill.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.project.domain.Post;
import com.itwill.project.domain.PostDetail;

public interface PostDao {
    

    List<Post> selectOrderByDesc(@Param("pageEnd") Long pageEnd,@Param("pageStart") Long pageStart);
    
    List<Post> selectBySubCategoryIdOrderByDesc (@Param("subCategoryId") Long subCategoryId, @Param("pageEnd") Long pageEnd,@Param("pageStart") Long pageStart);
    
    Long postCount();
    
    Long postCountBySubCategoryId(@Param("subCategoryId") Long subCategoryId);
    
    PostDetail selectById(Long post_id);
    
    int insert(Post post);
    
    int update(Post post);
    
    int delete(Long id);

    int viewCountIncrease(Long post_id);

<<<<<<< HEAD
    
=======
    HashTag selectHashTag(String tagname);
    
    int insertHashTag(String tagname);
    
    int insertsPostHashTag(HashTag tag);
>>>>>>> parent of 3d2f9e9 (포스트 삭제 수정할 것)
}

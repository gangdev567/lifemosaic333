package com.itwill.project.dto.post;

import com.itwill.project.domain.Post;

import lombok.Data;

@Data
public class PostCreateDto {
    
    private String title;
    private String content;
    private String user_id;
    private Long sub_category_id;
    
    public Post toEntity() {
        
        return Post.builder()
                .title(title)
                .content(content)
                .user_id(user_id)
                .sub_category_id(sub_category_id)
                .build();
    }
}

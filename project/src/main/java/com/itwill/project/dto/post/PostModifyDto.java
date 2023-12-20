package com.itwill.project.dto.post;

import com.itwill.project.domain.Post;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PostModifyDto {
    
    private String title;
    private String content;
    private Long post_id;
    private Long sub_category_id;
    
    public Post ToPost() {
        return Post.builder()
                .title(title)
                .content(content)
                .post_id(post_id)
                .build();
    }
}

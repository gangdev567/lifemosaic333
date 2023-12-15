package com.itwill.project.domain;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Post {

    private String user_id;
    private Long post_id;
    private String title;
    private String content;
    private LocalDateTime created_time;
    private LocalDateTime modified_time;
    private Long sub_category_id;
    private String image_path;
    private Long view_count;
    private String nickname;

}

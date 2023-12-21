package com.itwill.project.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.project.dto.like.PostLikeDto;
import com.itwill.project.service.LikeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/like")
public class LikeRestController {
    
    private final LikeService likeService;
    
    @GetMapping("/get/{post_id}")
    public ResponseEntity<PostLikeDto> postLikeCount(@PathVariable Long post_id) {
        log.debug("getLikeCount(post_id = {})", post_id);
        PostLikeDto dto = likeService.likeCount(post_id);
        return ResponseEntity.ok(dto);
    }
    
    @PostMapping("/increase")
    public ResponseEntity<Integer> postLike(@RequestBody PostLikeDto dto) {
        log.debug("postLikeDto = {}", dto);
        
        int result = likeService.postLikeIncrease(dto.getPost_id());
        
        
        return ResponseEntity.ok(result);  
    }
}

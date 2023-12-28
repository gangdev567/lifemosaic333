package com.itwill.project.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.itwill.project.domain.Comment;
import com.itwill.project.domain.Criteria;
import com.itwill.project.dto.comment.CommentRegisterDto;
import com.itwill.project.dto.comment.CommentUpdateDto;
import com.itwill.project.dto.post.PageMakerDto;
import com.itwill.project.service.CommentService;
import com.itwill.project.service.LikeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/comment")
public class CommentRestController {

    private final CommentService commentService;
    
    @GetMapping("/check")
    public ResponseEntity<Long> commentCheck(@RequestParam("post_id") Long post_id) {
        log.debug("commentCheck(post_id = {})", post_id);
        
        Long result = commentService.commentCheck(post_id);
        
        return ResponseEntity.ok(result);
    }
    
    @GetMapping("/get")
    public ResponseEntity<Map<String, Object>> getAllComment(Criteria cri, @RequestParam("post_id") Long post_id, @RequestParam(name = "pageNum", defaultValue = "1") Long pageNum) {
        log.debug("getAllComment(post_id = {})", post_id);
        
        Long commentEnd = pageNum * 10;
        Long commentStart = ((pageNum-1)*10)+1;
        Long total = commentService.commentCheck(post_id);
        
        List<Comment> comments = commentService.getAllComment(post_id, commentEnd, commentStart);
        
        cri.setAmount(10);
        cri.setPageNum(pageNum);
        
        PageMakerDto pageMake = new PageMakerDto(cri, total);
        
        Map<String, Object> response = new HashMap<>();
        response.put("comments", comments);
        response.put("pageMaker", pageMake);
        
        return ResponseEntity.ok()
                .header("Content-Type", "application/json")
                .body(response);
    }
    
    @PostMapping
    public ResponseEntity<Integer> registerComment(@RequestBody CommentRegisterDto dto) {
        log.debug("CommentRegisterDto = {}", dto);
        int result = commentService.create(dto);
        
        return ResponseEntity.ok(result);
    }
    
    @PutMapping("/update")
    public ResponseEntity<Integer> updateComment(@RequestBody CommentUpdateDto dto) {
        log.debug("CommentUpdateDto = {}", dto);
        int result = commentService.update(dto);
        
        return ResponseEntity.ok(result);
    }
}

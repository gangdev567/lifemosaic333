package com.itwill.project.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.project.dto.post.PostListItemDto;
import com.itwill.project.service.PostService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/post")
public class PostController {

    private final PostService postService;
    
    @GetMapping("/totallist")
    public void totalList(Model model) {
        log.debug("totallist()");
        
        List<PostListItemDto> list = postService.read();
        
        model.addAttribute("posts", list);
        
    }
}

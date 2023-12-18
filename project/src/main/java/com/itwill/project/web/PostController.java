package com.itwill.project.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.project.domain.Criteria;
import com.itwill.project.dto.post.PageMakerDto;
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
    public void totalList(Model model, Criteria cri, @RequestParam(value = "pageNo", defaultValue = "1") Long pageNum) {
        log.debug("totallist()");
        
        Long pageEnd = pageNum * 10;
        Long pageStart = ((pageNum-1)*10)+1;
        
        List<PostListItemDto> list = postService.read(pageEnd, pageStart);  
        
        model.addAttribute("posts", list);
        
        Long total = postService.getTotal();
        
        cri.setAmount(10);
        cri.setPageNum(pageNum);
        
        PageMakerDto pageMake = new PageMakerDto(cri, total);
        
        model.addAttribute("pageMaker", pageMake);
    }
    
}

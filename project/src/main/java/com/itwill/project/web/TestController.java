package com.itwill.project.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwill.project.domain.TopWriter;
import com.itwill.project.service.WriterService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class TestController {

	private final WriterService writerService;
    
    @GetMapping("/")
    public String home(Model model) {
        log.debug("ApiTest()");
        
        List<TopWriter> list = writerService.readTopWriter();
        log.debug("list: {}", list);
        
        model.addAttribute("writer", list);
        
        return "Home"; // 뷰(jsp)의 경로(이름)를 리턴.
    }
}

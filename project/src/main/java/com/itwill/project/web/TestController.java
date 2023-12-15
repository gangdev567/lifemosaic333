package com.itwill.project.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwill.project.SettingService.SettingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TestController {

    
    @GetMapping("/")
    public String home() {
        log.debug("ApiTest()");
        
        return "Home"; // 뷰(jsp)의 경로(이름)를 리턴.
    }
}

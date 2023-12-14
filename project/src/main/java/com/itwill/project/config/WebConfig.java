package com.itwill.project.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
        .allowedOrigins("http://localhost:8081/") // 허용할 도메인
        .allowedMethods("GET") // 허용할 HTTP 메서드
        .allowCredentials(true) // 쿠키 허용 여부
        .maxAge(3600); // preflight 요청을 캐시할 시간
}
    }


package com.itwill.project.web;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.project.domain.User;
import com.itwill.project.dto.user.UserRegisterDto;
import com.itwill.project.dto.user.UserSignInDto;
import com.itwill.project.service.MailSendService;
import com.itwill.project.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

// 디스패쳐 서블릿에서 호출하는 컨트롤러 메서드들을 가지고 있는 클래스.
@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/user")
public class UserController {
    
    private final UserService userService;
    private final MailSendService mailService;
    
    @GetMapping("/signup")
    public void signup() {
        log.debug("GET - signup()");
    }
    
    @PostMapping("/signup")
    public String signup(@ModelAttribute UserRegisterDto dto) {
        log.debug("POST - signup(dto={})", dto);
        
        // 회원가입 서비스 수행.
        int result = userService.create(dto);
        
        return "redirect:/user/signin"; // 로그인(signin) 페이지로 이동(redirect)
    }
    
    @GetMapping("/signin")
    public void signin() {
        log.debug("GET - signIn()");
        
    }
    
    @PostMapping("/signin")
    public String signin(@ModelAttribute UserSignInDto dto, HttpSession session,
    		@RequestParam(name ="target", defaultValue = "") String target) throws UnsupportedEncodingException {
    	log.debug("POST - signin(dto={} session={}, target={}", dto, session, target);
    	
    	// 서비스 메서드를 호출해서 아이디와 비밀번호가 일치하는 사용자가 있는지 확인
    	User user = userService.read(dto);
    	if (user != null) { // 아이디와 비밀번호 모두 일치하는 사용자가 있는 경우 -> 로그인 성공
    		 // 세션에 로그인 사용자 정보를 저장
    		session.setAttribute("signedInUser", user.getUser_id());
    		
    		// 연수가 코드 추가함 - 로그인 시 유저 프로필 경로 저장함.
    		session.setAttribute("userProfileUrl", user.getProfile_url());
    		
  
    		log.debug("signedInUser: {}", session.getAttribute("signedInUser"));
    		// 타겟 페이지로 이동
    		return (target.equals("")) ? "redirect:/" : "redirect:" + target;
    	} else { // 아이디와 비밀번호가 일치하는 사용자가 없는 경우 -> 로그인 실패
    		// 로그인 페이지로 이동
    		return "redirect:/user/signin?result=f&target="
    				+ URLEncoder.encode(target, "UTF-8"); //result=f 정보를 가지고 로그인 페이지로 이동
    	}
    }
    
    @GetMapping("/signout")
    public String signout(HttpSession session) {
    	log.debug("signout(session={})", session);
    	// 세션에 저장된 "signedInUser" 정보를 삭제.
    	session.removeAttribute("signedInUser");
    	
    	// 연수 추가 - 세션에 저장된 프로필 이미지도 삭제함.
    	session.removeAttribute("userProfileUrl");
    	
    	// 세션을 만료시킴.
    	session.invalidate();
    	
    	// 로그아웃 이후 로그인 페이지로 이동
    	return "redirect:/user/signin";
    }
    
    @GetMapping("/checkid")
    @ResponseBody
    public ResponseEntity<String> checkId(@RequestParam(name = "user_id") String user_id) {
        log.debug("checkId(user_id={})", user_id);
        
        boolean result = userService.checkUserid(user_id);
        if (result) {
            return ResponseEntity.ok("Y");
        } else {
            return ResponseEntity.ok("N");
        }
    }
    
    @GetMapping("/checknickname")
    @ResponseBody
    public ResponseEntity<String> checknickname(@RequestParam(name = "nickname") String nickname) {
        log.debug("checknickname(nickname={})", nickname);
        
        boolean result = userService.checkNickname(nickname);
        if (result) {
            return ResponseEntity.ok("Y");
        } else {
            return ResponseEntity.ok("N");
        }
    }
    
	// 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(@RequestParam(name = "email") String email) {
		log.debug("이메일 인증 요청이 들어옴!");
		log.debug("이메일 인증 이메일 : {}", email);
		return mailService.joinEmail(email);
	}
    
}
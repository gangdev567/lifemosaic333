package com.itwill.project.web;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.project.domain.SettingUser;
import com.itwill.project.helper.FileHelper;
import com.itwill.project.service.SettingService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/setting")// SettingController의 컨트롤러 메서드의 매핑 URL(주소)는 "/setting"로 시작.
@RequiredArgsConstructor
public class SettingController {
	
	private final SettingService settingService;
	
	@GetMapping("/userProfile")
	public void userProfile(Model model) {
		log.debug("SettingService={}",settingService);
		log.debug("SettingController: userProfile() 호출");
		String user_id = "seonhee123";
		SettingUser user = settingService.read(user_id);
		
		model.addAttribute("user",user);
	
	}
	
	@GetMapping("/checkNickname")
	@ResponseBody
	public ResponseEntity<String> checkNickname(@RequestParam(name="nickname") String nickname){
		log.debug("checkNickname={}",nickname);
		
		//서비스 메서드를 호출해서 닉네임 중복확인을 체크한다.
		boolean result = settingService.checkNickname(nickname);
		
		if(result) {
			return ResponseEntity.ok("YYY");
		}else {
			return ResponseEntity.ok("NNN");
		}
	}
	@PostMapping("/registerProfileImg")
	public String create(@ModelAttribute SettingUser user, @RequestParam MultipartFile file, HttpServletRequest request) {
	    String fileUrl = FileHelper.upload("/uploads", file, request);
	    user.setProfile_url(fileUrl);
	    
	    return "redirect:/userProfile";
	}
	
}

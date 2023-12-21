package com.itwill.project.web;

import java.awt.PageAttributes.MediaType;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.http.HttpHeaders;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.project.domain.SettingUser;
import com.itwill.project.dto.setting.FileUtil;
import com.itwill.project.dto.setting.SettingNicknameDto;
import com.itwill.project.service.SettingService;

import jakarta.servlet.http.HttpSession;
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
	
	@PostMapping("/updateImg")
	public String updateImg(@RequestParam("profile") MultipartFile file, HttpSession session, String user_id)
	        throws Exception {
	    log.debug("updateImg(!!!!!!!!!!!!!!!!!!!!)");
	    FileUtil fileUtil = new FileUtil();
	    log.debug(file.toString());
        String profile_url = fileUtil.updateImg(file);
        log.debug("profile_url={}",profile_url);

     settingService.updateImg(user_id, profile_url);
     
    
	    return "redirect:/setting/userProfile";
	}
	@PostMapping("/updateNickname")
	public String updateNickname(SettingNicknameDto dto, String nickname) {
		log.debug("updateNickname=(dto={})",dto);
		settingService.updateNickname(dto);
		
		return "redirect:/setting/userProfile";
	}
	 @GetMapping("/settingImg")
	    @ResponseBody
	    public ResponseEntity<Resource> getSettingImage(@RequestParam("fileName") String fileName) throws IOException {
	        // 파일 경로
	        String filePath = "C:\\uploads\\" + fileName;
	        
	        // 파일을 읽어오기 위한 Resource 객체 생성
	        Resource resource = new UrlResource(Paths.get(filePath).toUri());
	        
	        if (resource.exists()) {
	            // 파일이 존재하면 해당 파일을 반환
	            return ResponseEntity.ok()
	                .header(org.springframework.http.HttpHeaders.CONTENT_TYPE, org.springframework.http.MediaType.IMAGE_PNG_VALUE)
	                .body(resource);
	        } else {
	            // 파일이 존재하지 않으면 404 에러 반환
	            return ResponseEntity.notFound().build();
	        }
	    }
	 @GetMapping("/settingBasicImg")
	 public String settingBasicImg( String user_id) {
		 log.debug("@@@@@@@@@@@@@@   SettingController(settingBasicImg(user_id={}))",user_id);
		 
		 settingService.updateBasicImg(user_id);
		 
		 return "redirect:/setting/userProfile";
	 }
  
	
}

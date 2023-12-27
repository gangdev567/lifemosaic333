package com.itwill.project.web;

import java.awt.PageAttributes.MediaType;
import java.io.Console;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.http.HttpHeaders;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.project.domain.MyCommentListItem;
import com.itwill.project.domain.MyCommentListItemByPaging;
import com.itwill.project.domain.SettingUser;
import com.itwill.project.domain.User;
import com.itwill.project.dto.setting.ArticlePage;
import com.itwill.project.dto.setting.FileUtil;
import com.itwill.project.dto.setting.PasswordChangeDto;
import com.itwill.project.service.ChangePasswordServiceImpl;
import com.itwill.project.dto.setting.SettingNicknameDto;
import com.itwill.project.dto.setting.SettingPageDto;
import com.itwill.project.dto.user.UserSignInDto;
import com.itwill.project.repository.UserDao;
import com.itwill.project.service.SettingService;
import com.itwill.project.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/setting")// SettingController의 컨트롤러 메서드의 매핑 URL(주소)는 "/setting"로 시작.
@RequiredArgsConstructor
public class SettingController {
	
	private final SettingService settingService;
	private final ChangePasswordServiceImpl changePasswordService;
	private final UserDao userDao;
	
	@GetMapping("/userProfile")
	public void userProfile(Model model, HttpSession session) {
		log.debug("SettingService={}",settingService);
		log.debug("SettingController: userProfile() 호출");
		String user_id = (String) session.getAttribute("signedInUser");
		SettingUser user = settingService.read(user_id);
		
		model.addAttribute("user",user);
	
	}
	
	@GetMapping("/userManagement")
    public String userManagement() {
        log.debug("SettingController: userManagement() 호출");
        // "userManagement" 뷰로 리디렉션
        return "setting/userManagement"; // 여기서 "userManagement"는 해당 뷰의 이름입니다.
    }
	
	@PostMapping("/verifyPassword")
	@ResponseBody
	public ResponseEntity<?> verifyCurrentPassword(HttpSession session, @RequestBody Map<String, String> payload) {
	    String currentPassword = payload.get("currentPassword");
	    String user_id = (String) session.getAttribute("signedInUser"); // 세션에서 사용자 ID 가져오기
	    // 비밀번호 검증 로직
	    boolean isPasswordCorrect = changePasswordService.verifyCurrentPassword(user_id, currentPassword);
	    if (isPasswordCorrect) {
	        return ResponseEntity.ok().build();
	    } else {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("비밀번호가 일치하지 않습니다.");
	    }
	}
	
	@PostMapping("/changePassword")
	@ResponseBody
	public ResponseEntity<?> changePassword(HttpSession session, @RequestBody Map<String, String> payload) {
	    String currentPassword = payload.get("currentPassword");
	    String newPassword = payload.get("newPassword");
	    String user_id = (String) session.getAttribute("signedInUser"); // 세션에서 사용자 ID 가져오기

	    // 현재 비밀번호가 맞는지 검증
	    boolean isPasswordCorrect = changePasswordService.verifyCurrentPassword(user_id, currentPassword);
	    if (!isPasswordCorrect) {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("현재 비밀번호가 올바르지 않습니다.");
	    }

	    // 새 비밀번호로 변경
	    PasswordChangeDto passwordChangeDto = new PasswordChangeDto();
	    passwordChangeDto.setUser_id(user_id);
	    passwordChangeDto.setCurrentPassword(currentPassword);
	    passwordChangeDto.setNewPassword(newPassword);

	    boolean isChanged = changePasswordService.changePassword(passwordChangeDto);
	    if (isChanged) {
	        return ResponseEntity.ok().body("비밀번호가 변경되었습니다.");
	    } else {
	        return ResponseEntity.badRequest().body("비밀번호 변경에 실패하였습니다.");
	    }
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
	public String updateImg(@RequestParam("profile") MultipartFile file, String user_id, HttpSession session)
	        throws Exception {
	    log.debug("updateImg(!!!!!!!!!!!!!!!!!!!!)");
	    FileUtil fileUtil = new FileUtil();
	    log.debug(file.toString());
        String profile_url = fileUtil.updateImg(file);
        log.debug("profile_url={}",profile_url);

     settingService.updateImg(user_id, profile_url);
     
     
		// 연수가 코드 추가함 - 이미지 변경 시, 기존 세션 정보에 저장된 이미지 경로를 새로운 경로로 덮어쓰기 함
		// 1. user_id로 모든 유저 정보 가져옴
		User user = userDao.selectByUserid(user_id);
		// 2. 가져온 유저 정보 중, 프로필 경로를 세션에 저장
		session.setAttribute("userProfileUrl", user.getProfile_url());
		
		
	    return "redirect:/setting/userProfile";
	}
	@PostMapping("/updateNickname")
	public ResponseEntity<Integer> updateNickname(@RequestBody SettingNicknameDto dto) {
		log.debug("updateNickname=(dto={})",dto);
		int result = settingService.updateNickname(dto);
		 
		return ResponseEntity.ok(result);
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
	 public String settingBasicImg( String user_id,  HttpSession session) {
		 log.debug("@@@@@@@@@@@@@@   SettingController(settingBasicImg(user_id={}))",user_id);
		 
		 settingService.updateBasicImg(user_id);
		 
		// 연수가 코드 추가함 - 이미지 변경 시, 기존 세션 정보에 저장된 이미지 경로를 새로운 경로로 덮어쓰기 함
			// 1. user_id로 모든 유저 정보 가져옴
			User user = userDao.selectByUserid(user_id);
			// 2. 가져온 유저 정보 중, 프로필 경로를 세션에 저장
			session.setAttribute("userProfileUrl", user.getProfile_url());
		 
		 return "redirect:/setting/userProfile";
	 }
	 
	 /*
	  * <내가 쓴 댓글> 페이지 
	  * -> user_id의 값을 받아 댓글 목록을 보여줌 
	  */
	 @GetMapping("/userMyComment")
	 public void showMyComment(Model model, @RequestParam(defaultValue = "1")int currentPage,HttpSession session) {
		 String user_id = (String) session.getAttribute("signedInUser");
			SettingUser user = settingService.read(user_id);
			//일단 게시물 전체를 가져옴.
			List<MyCommentListItem> myCommentList = settingService.selectMyComment(user_id);
			
			if(myCommentList != null) {
			//전체 게시물 수
			log.debug("댓글 개수 = {}",myCommentList.size());
			int total = myCommentList.size();
			
			// size : 한 화면에 보여질 게시물 수(일단 3개로 해보장,,)
			 int size =3;
			 
			//전체 페이지 수
			int totalPages = (int) (Math.ceil((total * 1.0)/size));
			
			log.debug("@@@@@@@@@@@@@totalPages={}",totalPages);
			
			//가져올 테이블 데이터의 시작 번호 
			int startNum = (currentPage - 1) * 3 +1;
			log.debug("게시물 시작 번호 : {}", startNum);
			//가져올 테이블 데이터의 시작 번호 
			int endNum = (currentPage -1) * 3 +3;
			log.debug("게시물 끝 번호 : {}", endNum);
			
			SettingPageDto dto = SettingPageDto.builder().user_id(user_id).startNum(startNum).endNum(endNum).build();
					
			List<MyCommentListItemByPaging> list = settingService.selectMyCommentByPaging(dto);
			
			
			//전체 페이지 수를 모델 객체에 추가해서 거기서 페이징 버튼 구현,,
			model.addAttribute("pagesCount",totalPages);
			
			//현재 페이지에는 active 스타일을 넣기 위한 currentPage 객체 추가
			model.addAttribute("currentPage",currentPage);
			
			//
			model.addAttribute("comment",list);
			}	
			
			model.addAttribute("commentLength", myCommentList.size());
			
			model.addAttribute("user",user);
	 }
  
	
}

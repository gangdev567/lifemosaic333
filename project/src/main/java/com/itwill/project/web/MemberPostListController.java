package com.itwill.project.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.project.dto.member.MemberPagePageDto;
import com.itwill.project.dto.setting.SettingPageDto;
import com.itwill.project.service.MemberService;
import com.itwill.project.service.SettingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("member")
@RequiredArgsConstructor
public class MemberPostListController {
	private final MemberService memberService;
	
	//닉네임을 가져와서 그 유저가 쓴 게시글들을 보여준다(페이지 기능)
	@GetMapping("/memberPostList")
	public void showMemberPostList(Model model,@RequestParam(defaultValue = "1") int currentPage,@RequestParam String nickname) {
		
		//1.전체 게시물 개수를 가져온다(페이지 수 계산)
		int total=memberService.selectTotalPages(nickname);
		
		//2.회원의 프로필 이미지를 가져오기 위한 profile_url 가져오기
		String profile_url = memberService.selectMemberProfileUrl(nickname);
		
		//모델에 추가
		model.addAttribute("member_profile_url", profile_url);
		
		// 게시물이 1개 이상이면
		if(total != 0) {
			//한 페이지에 보여줄 게시물 수(일단 3개로,,)
			 int size = 10;
			 
			 //전체 페이지 수 계산..
			 int totalPages = (int) (Math.ceil((total * 1.0)/size));
			 
			 log.debug("@@@@@@@@@@ 총 페이지 수={}",totalPages);
			 
			//가져올 테이블 데이터의 시작 번호 
			 int startNum = (currentPage - 1) * size +1;
			log.debug("게시물 시작 번호 : {}", startNum);
					
			//가져올 테이블 데이터의 시작 번호 
			int endNum = (currentPage -1) * size +size;
			log.debug("게시물 끝 번호 : {}", endNum);
			
			MemberPagePageDto dto = MemberPagePageDto.builder().nickname(nickname).startNum(startNum).endNum(endNum).build();
			
			//3.페이지에 따른 회원의 post 정보들을 가져오기..
			
			//4.게시물들에 있는 해시태그값들 가져오기(for문을 통해서 있는 리스트에만 해시태그값을 넣어준다..
			
			
		}
		//전체 게시물 수 
		model.addAttribute("postCount", total);
		
		
	}
}

package com.itwill.project.service;

import org.springframework.stereotype.Service;

import com.itwill.project.repository.MemberDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberService {
	private final MemberDao memberDao;
	
	//페이징할 전체 게시글수 가져오기
	public int selectTotalPages(String nickname) {
		int result = memberDao.selectTotalPages(nickname);
		log.debug("@@@@@@@@@@@게시글 수={}",result);
		return result;
	}
	// 회원의 프로필 이미지 가져오기
	public String selectMemberProfileUrl(String nickname) {
		
		return memberDao.selectMemberProfileUrl(nickname);
	}
}

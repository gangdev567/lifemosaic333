package com.itwill.project.repository;

public interface MemberDao {
	//전체 게시물 가져오기
	int selectTotalPages(String nickname);
	
	//회원의 프로필 정보 가져오기
	String selectMemberProfileUrl(String nickname);
}

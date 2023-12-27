package com.itwill.project.dto.setting;

import java.util.List;

import com.itwill.project.domain.MyCommentListItem;

import lombok.Data;

//페이징 처리를 위한 클래스
// 게시글 데이터와 페이징 관련 정보를 담고 있음.
/*
 * 일단 보류,,
 * 
 * */
@Data

public class ArticlePage {
	
	//페이징 관련 멤버 변수
	
	//전체 글의 행의 수(게시글 수)
	private int total;
	
	//현재 페이지 번호
	private int currentPage;
	
	//전체 페이지 개수
	private int totalPages;
	
	//시작 페이지 번호
	private int startPage;
	
	// 종료 페이지 번호 
	private int endPage;
	
	//페이징의 개수
	private int pagingCount;
	
	//게시글 데이터
	
	private List<MyCommentListItem> list;
	
	// size : 한 화면에 보여질 게시물 수(일단 3개로 해보장,,)
	private int size =3;
	
	//생성자
	public ArticlePage(int total, int currentPage, int size, int pagingCount, List<MyCommentListItem> list) {
		this.total = total;
		this.currentPage = currentPage;
		this.list = list;
		this.pagingCount = pagingCount;
		
		//전체 페이지 개수(페이지의 끝 번호) 구하기(전체 글의 수/ 한 화면에 보여질 행의 수)
		totalPages = (int) (Math.ceil((total * 1.0)/size));
		
		//startPage : '이전 [1] [2] [3] [4] [5] 다음' 일 때 1을 의미
		//
		
	}

}

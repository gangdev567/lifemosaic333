package com.itwill.project.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.project.domain.Search;
import com.itwill.project.domain.SearchListItem;
import com.itwill.project.service.SearchService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/post")
public class SearchController {
	
	private final SearchService searchService;
	
	@GetMapping("/searchlist")
	public void search(Search dto, Model model ) {
		log.debug("dto : {}" , dto);
		
		List<SearchListItem> list = searchService.selectSearchByKeyword(dto);
		log.debug("searchList : {} " , list);
		
		model.addAttribute("searchKeyword", dto);
		model.addAttribute("searchList" , list);
	}
}

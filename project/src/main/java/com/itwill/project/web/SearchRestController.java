package com.itwill.project.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.project.domain.Search;
import com.itwill.project.domain.SearchListItem;
import com.itwill.project.domain.SearchOrderList;
import com.itwill.project.service.SearchService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/sort")
public class SearchRestController {
	
	private final SearchService searchService;
	
	@PostMapping("/category/{subcategory}")
	public ResponseEntity<List<SearchListItem>> sortBySubCategory(@PathVariable long subcategory, @RequestBody SearchOrderList dto){
		
		log.debug("sort By list : {} ", subcategory);
		log.debug("dto: {} " , dto);
		
		List<SearchListItem> list = searchService.orderBySearchItem(dto);
		
		log.debug("result list : {} ", list);
		
		return ResponseEntity.ok(list);
	}

}

package com.itwill.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.project.domain.SearchListItem;
import com.itwill.project.domain.SearchOrderList;
import com.itwill.project.repository.SearchDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class SearchService {
	private final SearchDao searchDao;
	
	public List<SearchListItem> selectSearchByKeyword(SearchOrderList dto) {
		List<SearchListItem> list = searchDao.searchKeywordCategory(dto);
		log.debug("service searchList : {} " ,  list);
		
		return list;
	}
	

}

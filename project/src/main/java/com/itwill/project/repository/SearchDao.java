package com.itwill.project.repository;

import java.util.List;

import com.itwill.project.domain.Search;
import com.itwill.project.domain.SearchListItem;
import com.itwill.project.domain.SearchOrderList;

public interface SearchDao {
	List<SearchListItem> searchKeywordCategory(Search dto);

	List<SearchListItem> selectSearchItme(SearchOrderList dto);
}

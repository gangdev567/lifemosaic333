package com.itwill.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.project.domain.BestTopic;
import com.itwill.project.repository.BestTopicDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BestTopicService {
	private final BestTopicDao bestTopicDao;
	
	public List<BestTopic> readAllBestTopic() {
		List<BestTopic> list = bestTopicDao.selectAllBestTopic();
		
		return list;
	}
	
	
	public List<BestTopic> readCategoryBestTopic(Long id){
		List<BestTopic> list = bestTopicDao.selectCategoryBestTopic(id);
		
		return list;
	}
}

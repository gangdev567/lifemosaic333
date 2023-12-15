package com.itwill.project.service;

import org.springframework.stereotype.Service;

import com.itwill.project.domain.SettingUser;
import com.itwill.project.repository.SettingDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor

public class SettingService {
	private final SettingDao settingDao;
	
	
	public SettingUser read(String user_id) {
		SettingUser user = settingDao.selectBySettingUser(user_id);
		log.debug("SettingService : user={}",user);
		return user;
	}
}

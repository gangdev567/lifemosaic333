package com.itwill.project.service;

import org.springframework.stereotype.Service;

import com.itwill.project.domain.SettingUser;
import com.itwill.project.dto.setting.SettingUserDto;
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
	
	public boolean checkNickname(String nickname) {
		log.debug("checkNickname(nickname={})",nickname);
		
		SettingUser user = settingDao.selectNickname(nickname);
		
		log.debug("User={}",user);
		
		if(user == null) {
			return false;
		}else {
			return true;
		}
	}
	
	public void updateImg(String user_id,String profile_url) {
		log.debug("updateImg=(user_id={}, profile_url={})",user_id, profile_url );
		
		int result =settingDao.updateProfileUrl(SettingUserDto.builder().user_id(user_id).profile_url(profile_url).build());
		
		log.debug("SettingService(updateImg result={}",result);
	}
}

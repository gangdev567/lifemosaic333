
package com.itwill.project.repository;
import com.itwill.project.domain.SettingUser;
import com.itwill.project.dto.setting.SettingUserDto;

public interface SettingDao {
	SettingUser selectBySettingUser(String user_id);
	
	SettingUser selectNickname(String nickname);
	
	int  updateProfileUrl(SettingUserDto dto);
}

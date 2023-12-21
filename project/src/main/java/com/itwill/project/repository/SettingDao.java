
package com.itwill.project.repository;
import com.itwill.project.domain.SettingUser;
import com.itwill.project.dto.setting.SettingNicknameDto;
import com.itwill.project.dto.setting.SettingProfileImgDto;

public interface SettingDao {
	SettingUser selectBySettingUser(String user_id);
	
	SettingUser selectNickname(String nickname);
	
	int  updateProfileUrl(SettingProfileImgDto dto);
	
	int updateNickname(SettingNicknameDto dto);
	
	int updateBasicProfileImg(String user_id);
}

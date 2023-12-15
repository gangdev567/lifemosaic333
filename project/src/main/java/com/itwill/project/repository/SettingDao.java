package com.itwill.project.repository;

import com.itwill.project.domain.SettingUser;

public interface SettingDao {
	SettingUser selectBySettingUser(String user_id);
}

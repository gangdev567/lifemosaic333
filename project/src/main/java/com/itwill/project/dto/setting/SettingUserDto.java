package com.itwill.project.dto.setting;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SettingUserDto {
	
	private String user_id;
	private String profile_url;

}

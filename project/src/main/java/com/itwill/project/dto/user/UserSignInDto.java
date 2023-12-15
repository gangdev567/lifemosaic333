package com.itwill.project.dto.user;

import com.itwill.project.domain.User;

import lombok.Data;

@Data
public class UserSignInDto {
	private String userid;
	private String nickname;
	private String password;
	
	public User toEntity() {
		return User.builder()
				.userid(userid)
				.nickname(nickname)
				.password(password)
				.build();
	}
}

package com.itwill.project.service;

import org.springframework.stereotype.Service;

import com.itwill.project.domain.User;
import com.itwill.project.dto.user.UserRegisterDto;
import com.itwill.project.dto.user.UserSignInDto;
import com.itwill.project.repository.UserDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {
    
    private final UserDao userDao;
    
    public boolean checkUserid(String userid) {
        log.debug("checkUserid(userid={})", userid);
        
        User user = userDao.selectByUserid(userid);
        if (user == null) { // USERS 테이블에 userid가 없는 경우 -> 회원가입에서 사용가능한 아이디 
            return true;
        } else { // USERS 테이블에 userid가 이미 있는 경우 -> 회원가입에서 사용 불가능한 아이디
            return false;
        }
    }
    
    public boolean checkNickname(String nickname) {
    	log.debug("checkNickname(nickname={})", nickname);
    	
    	User user = userDao.selectByNickname(nickname);
    	if (user == null) {
    		return true;
    	} else {
    		return false;
    	}
    }
    public int create(UserRegisterDto dto) {
        log.debug("create(dto={})", dto);
        
        int result = userDao.insert(dto.toEntity());
        log.debug("회원가입 결과 = {}", result);
        
        return result;
    }
    
    public User read(UserSignInDto dto) {
    	log.debug("read(dto={})", dto);
    	
    	// 리포지토리 메서드를 호출해서, 아이디와 비밀번호가 일치하는 사용자가 있는지 검색
    	User user = userDao.selectByUseridAndPassword(dto);
    	log.debug("로그인 사용자 = {}", user);
    	
    	return user;
    }
}
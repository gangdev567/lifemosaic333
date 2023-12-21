package com.itwill.project.service;

import com.itwill.project.dto.setting.PasswordChangeDto;
import com.itwill.project.repository.UserManagementDao;
import com.itwill.project.web.UserController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChangePasswordServiceImpl implements ChangePasswordService {

    private final UserManagementDao userManagementDao;

    @Autowired
    public ChangePasswordServiceImpl(UserManagementDao userManagementDao) {
        this.userManagementDao = userManagementDao;
    }

    @Override
    @Transactional
    public boolean changePassword(PasswordChangeDto passwordChangeDto) {
        try {
            String currentPassword = userManagementDao.getPasswordByUserId(passwordChangeDto.getUser_id());
            if (!currentPassword.equals(passwordChangeDto.getCurrentPassword())) {
                return false;
            }

            int updateCount = userManagementDao.updatePasswordByUserId(passwordChangeDto.getUser_id(), passwordChangeDto.getNewPassword());
            return updateCount > 0;
        } catch (Exception e) {
            log.error("비밀번호 변경 중 오류 발생", e);
            // 예외를 처리하거나, 필요에 따라 rethrow 할 수 있습니다.
            throw new RuntimeException("비밀번호 변경 중 오류 발생", e);
        }
    }
    
    public boolean verifyCurrentPassword(String user_id, String currentPassword) {
        // 사용자의 현재 비밀번호를 가져와서 입력된 비밀번호와 비교
    	log.debug("Verifying password for user_id: {}", user_id); // user_id 값 확인
        String actualCurrentPassword = userManagementDao.getPasswordByUserId(user_id);
        return actualCurrentPassword.equals(currentPassword);
    }
}
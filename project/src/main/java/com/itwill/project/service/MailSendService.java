package com.itwill.project.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Component
public class MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;

	// 임시 비밀번호 이메일 전송
	public void sendTempPasswordEmail(String email, String tempPassword) {
		String setFrom = "dlvlfdn567@gmail.com"; // 발신자 이메일 주소
		String toMail = email;
		String title = "임시 비밀번호 발송"; // 이메일 제목
		String content =
			"귀하의 임시 비밀번호는 " + tempPassword + " 입니다.<br>" +
				"로그인 후 비밀번호를 변경해주세요."; // 이메일 내용

		mailSend(setFrom, toMail, title, content);
	}

	// 이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	// 이메일 인증 메서드 (예: 임시 비밀번호 또는 인증번호 발송)
	public String joinEmail(String email) {
		String tempPassword = generateRandomPassword(8);
		sendTempPasswordEmail(email, tempPassword);
		return tempPassword;
	}

	// 임시 비밀번호 생성
	private String generateRandomPassword(int length) {
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		Random random = new Random();
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < length; i++) {
			int randomIndex = random.nextInt(chars.length());
			sb.append(chars.charAt(randomIndex));
		}

		return sb.toString();
	}
}
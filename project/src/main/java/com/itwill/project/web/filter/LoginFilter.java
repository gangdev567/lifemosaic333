package com.itwill.project.web.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;


public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
		throws IOException, ServletException {

		// 모든 요청을 필터링 없이 통과시킵니다.
		chain.doFilter(request, response);
	}

	private boolean isFileInUploadsDirectory(String path) {
		// 절대 경로를 사용하여 파일의 존재 여부를 확인합니다.
		File file = new File("C:\\uploads", path);
		return file.exists() && !file.isDirectory(); // 파일이 존재하고 디렉토리가 아니어야 합니다.
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// 필터 초기화 로직
	}

	@Override
	public void destroy() {
		// 필터 소멸 로직
	}
}
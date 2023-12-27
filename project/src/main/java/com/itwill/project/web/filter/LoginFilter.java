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

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);

		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

		// 파일이 uploads 디렉토리에 있거나, /setting/settingImg 경로에 대한 접근이면 필터링을 하지 않습니다.
		if (isFileInUploadsDirectory(path) || path.startsWith("/setting/settingImg")) {
			chain.doFilter(request, response);
		} else if (path.equals("/") ||
			path.startsWith("/user/signup") ||
			path.startsWith("/user/signin") ||
			path.startsWith("/img/") || // 이미지 폴더
			path.startsWith("/css/") || // CSS 폴더
			path.startsWith("/js/")) {  // JavaScript 폴더
			chain.doFilter(request, response); // 필터링을 하지 않습니다.
		} else {
			boolean loggedIn = session != null && session.getAttribute("signedInUser") != null;
			if (loggedIn) {
				chain.doFilter(request, response);
			} else {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/user/signin"); // 로그인 페이지로 리디렉션
			}
		}
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
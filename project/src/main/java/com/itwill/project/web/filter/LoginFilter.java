package com.itwill.project.web.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
		throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);

		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

		// 정적 리소스 경로를 추가합니다.
		if (path.equals("/") ||
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

	// init과 destroy 메소드는 필요에 따라 구현합니다.
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// 필터 초기화 로직
	}

	@Override
	public void destroy() {
		// 필터 소멸 로직
	}
}
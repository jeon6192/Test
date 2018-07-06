package com.naver.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor_pre extends HandlerInterceptorAdapter {
	/*
		요청 URL이 다음과 같은 경우 요청을 처리하기 전에 아래의 메서드를 수행함
		<mapping path="/*.nhn" />
		false를 리턴하면 컨트롤러를 실행하지 않음
		true를 리턴하면 컨트롤러 실행
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		try {
			if (request.getSession().getAttribute("id") == null) {
				System.out.println("preHandle() : " + request.getRequestURI() + "요청 중");
				response.sendRedirect("member_login.nhn");
				return false;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
	
}

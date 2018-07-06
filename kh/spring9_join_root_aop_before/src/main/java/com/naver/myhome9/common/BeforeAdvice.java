package com.naver.myhome9.common;

import org.aspectj.lang.JoinPoint;

/*
	JoinPoint 인터페이스의 메서드
	Signature getSignature() : 호출되는 메서드에 대한 정보를 구함
	Object getTarget() : 클라이언트가 호출한 비즈니스 메서드를 포함하는 비지니스 객체를 구함
	Object[] getArgs() : 클라이언트가 메서드를 호출할 때 넘겨준 인자 목록을 리턴
	
	공통으로 처리할 로직을 LogAdvice 클래스에 beforeLog()메서드로 구현
	Advice : 횡단 관심에 해당하는 공통 기능을 의미하며 독립된 클래스의 메서드로 작성
 */
public class BeforeAdvice {
	public void beforeLog(JoinPoint proceeding) {
		System.out.println("------> BeforeAdvice : 비즈니스 로직 수행 전 동작");
		System.out.println("------> " + proceeding.getTarget().getClass().getName() 
				+ "의 " + proceeding.getSignature().getName() + " 호출합니다.");
	}

}

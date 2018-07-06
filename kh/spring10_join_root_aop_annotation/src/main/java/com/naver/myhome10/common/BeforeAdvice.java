package com.naver.myhome10.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

/*
	Advice 클래스는 스프링 설정파일에서 <bean>으로 등록하거나 @Service annotation을 사용
*/

@Service
@Aspect		// @Aspect가 설정된 클래스에는 Pointcut과 Advice를 결합하는 설정이 있어야 함
public class BeforeAdvice {
	/*
		Pointcut 설정
		하나의 Advice 클래스 안에 여러개의 포인트컷을 설정할 수 있음
		여러 개의 포인트컷을 식별하기 위해 참조메서드를 이용
		이 메서드는 몸체가 비어있는 메서드로 단순히 포인트컷을 식별하기 위한 이름으로만 사용
	 */
	/*@Pointcut("execution(* com.naver.myhome10..*Impl.get*(..))")
	public void getPointcut() {}*/
	
	
	/*
		@Before : 비지니스 메서드 실행 전에 동작
		@Before("getPointcut()") : getPoincut() 참조 메서드로 지정한 메서드가 실행전에 
		Advice의 메서드 beforeLog()가 먼저 호출됨
	 */
	/*@Before("getPointcut()")
	public void beforeLog(JoinPoint proceeding) {
		System.out.println("------> BeforeAdvice : 비즈니스 로직 수행 전 동작");
		System.out.println("------> " + proceeding.getTarget().getClass().getName() 
				+ "의 " + proceeding.getSignature().getName() + " 호출합니다.");
	}*/
	

}

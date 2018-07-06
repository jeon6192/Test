package com.naver.myhome10.common;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect
public class AroundAdvice {
	@Pointcut("execution(* com.naver.myhome10..*Impl.*(..))")
	public void aroundPointcut() {}
	
	@Around("aroundPointcut()")
	public Object aroundLog(ProceedingJoinPoint proceeding) throws Throwable {
		System.out.println("========>Around Advice의 before : 비즈니스 메서드 수행 전 입니다.");
		StopWatch sw = new StopWatch();
		sw.start();
		// 이 코드의 이전과 이후에 공통 기능을 위한 코드를 위치 시키면 됩니다.
		// 대상 객체의 메서드 public void setInsert(BoardVO b)를 호출합니다.
		Object result = proceeding.proceed();

		sw.stop();

		System.out.println("========>Around Advice의 after : 비즈니스 메서드 수행 후 입니다.");

		// org.aspectj.lang.Signature 인터페이스는 호출되는 메서드와 관련된 정보를 제공합니다.
		// String getName() : 메서드 이름을 구합니다.
		// String toLongString() : 메서드를 완전하게 표현한 문장을 구합니다.(메서드의 리턴타입, 파라미터 타입 ..)
		// String toShortString(): 메서드를 간략하게 표현한 문장을 구합니다.(기본 구현은 메서드의 이름)
		// Object[] getArgs() : 클라이언트가 메서드를 호출할때 넘겨준 인자 목록을 Object 배열로 리턴합니다.

		Signature sig = proceeding.getSignature();
		System.out.printf("======> %s.%s(%s) \n", proceeding.getTarget().getClass().getSimpleName(), sig.getName(),
				Arrays.toString(proceeding.getArgs()));
		System.out.println("======> " + proceeding.getSignature().getName() + "()메소드 수행 시간 : " + sw.getTotalTimeMillis()
				+ "(ms)초");
		System.out.println("======> " + proceeding.getTarget().getClass().getName());
		return result;

	}
}

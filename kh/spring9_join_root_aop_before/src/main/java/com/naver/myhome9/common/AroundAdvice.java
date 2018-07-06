package com.naver.myhome9.common;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.springframework.util.StopWatch;

public class AroundAdvice {
	/*
	 * PreceddingJoinPoint 인터페이스는 JointPoint를 상속했기 때문에 JoinPoint가 가진 모든 메서드를 지원합니다.
	 * AroundAdvice에서만 ProceedingJointPoint를 매개변수로 사용하는데 이곳에서 proceed()메서드가 필요하기
	 * 때문입니다. AroundAdvice인 경우 비즈니스 메서드 실행 전과 후에 실행되는 데 비즈니스 메서드를 호출하기 위해서는
	 * ProceedingJoinPoint의 proceed()메서드가 필요합니다. 즉, 클라이언트의 요청을 가로챈 어드바이스는 클라이언트가 호출한
	 * 비즈니스 메서드(ServiceImpl의 get 으로 시작하는 메서드)를 호출하기 위해 ProceedingJoinPoint객체를 매개변수로
	 * 받아 Proceed()메서드를 통해서 비즈니스 메서드를 호출할 수 있습니다.
	 */
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

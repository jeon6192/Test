package com.naver.myhome10.common;

import org.aspectj.lang.JoinPoint;

public class AfterAdvice {
	public void afterLog(JoinPoint proceeding) {
		System.out.println("=====>"
				+ proceeding.getTarget().getClass().getName()
				+"��"+proceeding.getSignature().getName()+"ȣ���մϴ�.");
		System.out.println("=====>AfterAdvice : ����Ͻ� ���� ���� �� ���� �Դϴ�.");
	}
}

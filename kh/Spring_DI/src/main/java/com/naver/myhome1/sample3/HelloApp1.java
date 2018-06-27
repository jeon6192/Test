package com.naver.myhome1.sample3;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloApp1 {
	public static void main(String[] args) {
		/*
		 	Spring 컨테이너 구동
		 	
		*/
		
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/naver/myhome1/sample3/applicationContext.xml");
		
		MessageBean msgBean = (MessageBean) ctx.getBean("m");
		msgBean.sayHello("Spring");
		
		ctx.close();
	}
}

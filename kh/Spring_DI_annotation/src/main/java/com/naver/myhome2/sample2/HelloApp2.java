package com.naver.myhome2.sample2;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloApp2 {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/naver/myhome2/sample2/applicationContext.xml");
		
		MessageBean msgBean = (MessageBean) ctx.getBean("m3");
		msgBean.sayHello();
		
		ctx.close();
	}
}

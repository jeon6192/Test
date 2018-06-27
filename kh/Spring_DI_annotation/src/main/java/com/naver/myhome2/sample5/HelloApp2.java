package com.naver.myhome2.sample5;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloApp2 {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/naver/myhome2/sample5/applicationContext.xml");
		
		MessageMultiple2 msgBean = (MessageMultiple2) ctx.getBean("messageMultiple2");
		
		msgBean.print();
		
		ctx.close();
	}
}

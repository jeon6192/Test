package com.naver.myhome2.sample3;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloApp2 {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/naver/myhome2/sample3/applicationContext.xml");
		
		MessageMultiple2 msgBean = (MessageMultiple2) ctx.getBean("m3");
		msgBean.print();
		
		ctx.close();
	}
}

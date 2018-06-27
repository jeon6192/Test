package com.naver.myhome2.sample4;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloApp2 {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/naver/myhome2/sample4/applicationContext.xml");
		
		MessageBeanImpl msgBean = (MessageBeanImpl) ctx.getBean("m3");
		msgBean.setGreeting("안녕하세요 ");
		
		FileOutputter out = (FileOutputter) ctx.getBean("fileOutputter");
		out.setFilePath("out2.txt");
		
		msgBean.sayHello();
		
		ctx.close();
	}
}

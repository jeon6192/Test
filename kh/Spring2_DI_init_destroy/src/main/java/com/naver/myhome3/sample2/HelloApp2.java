package com.naver.myhome3.sample2;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloApp2 {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/naver/myhome3/sample2/applicationContext.xml");
		
		MessageBeanImpl msgBean = (MessageBeanImpl) ctx.getBean("messageBeanImpl", MessageBean.class);
		msgBean.setGreeting("안녕하세요 ");
		
		FileOutputter outputter = (FileOutputter) ctx.getBean("fileOutputter");
		outputter.setFilePath("out.txt");
		
		System.out.println("\n ----- main에서 sayHello 호출 -----");
		msgBean.sayHello();
		
		ctx.close();
	}
}

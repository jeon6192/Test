package com.naver.myhome1.sample5;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.naver.myhome1.sample5.MessageBean;

public class HelloApp2 {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/naver/myhome1/sample5/applicationContext.xml");
		
		MessageBean msgBean = (MessageBean) ctx.getBean("m3");
		msgBean.sayHello();
		
		ctx.close();
	}
}

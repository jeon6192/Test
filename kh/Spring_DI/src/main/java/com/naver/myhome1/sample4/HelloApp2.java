package com.naver.myhome1.sample4;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.naver.myhome1.sample4.MessageBean;

public class HelloApp2 {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/naver/myhome1/sample4/applicationContext.xml");
		
		MessageBean msgBean = (MessageBean) ctx.getBean("m2");
		msgBean.sayHello();
		
		ctx.close();
		
	}

}

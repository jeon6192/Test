package com.naver.myhome1.sample7;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloApp2 {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("com/naver/myhome1/sample7/applicationContext.xml");
		
		
		CollectionBean collectionBean = (CollectionBean) ctx.getBean("collectionBean");
		
		for(String addr : collectionBean.getAddressList()) {
			System.out.println(addr);
		}
		
		ctx.close();
	}
}

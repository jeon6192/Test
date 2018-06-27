package com.naver.myhome2.sample4;

public class MessageBeanEn implements MessageBean{
	
	public MessageBeanEn() {
		System.out.println("MessageBeanEn 생성자");
	}
	@Override
	public void sayHello() {
		System.out.println("Hello! ");
		
	}
}

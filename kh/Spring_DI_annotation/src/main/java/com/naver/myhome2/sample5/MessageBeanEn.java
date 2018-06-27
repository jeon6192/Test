package com.naver.myhome2.sample5;

import org.springframework.stereotype.Component;

@Component
public class MessageBeanEn implements MessageBean{
	
	public MessageBeanEn() {
		System.out.println("이곳은 MessageBeanEn 생성자");
	}
	@Override
	public void sayHello() {
		System.out.println("Hello! Spring");
		
	}
}

package com.naver.myhome2.sample5;

import org.springframework.stereotype.Component;

@Component
public class MessageBeanKo implements MessageBean{
	
	public MessageBeanKo() {
		System.out.println("이곳은 MessageBeanKo 생성자");
	}

	@Override
	public void sayHello() {
		System.out.println("안녕하세요! Spring");
	}
	
}

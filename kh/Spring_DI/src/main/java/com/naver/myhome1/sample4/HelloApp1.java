package com.naver.myhome1.sample4;

public class HelloApp1 {
	public static void main(String[] args) {
		MessageBeanImpl msgImpl = new MessageBeanImpl("스프링");
		
		msgImpl.setGreeting("안녕~");
		
		msgImpl.sayHello();
	}
}

package com.naver.myhome1.sample4;

public class MessageBeanImpl implements MessageBean{
	private String name;
	private String greeting;
	
	public MessageBeanImpl(String name) {
		this.name = name;
	}

	@Override
	public void sayHello() {
		System.out.println(greeting + name);
	}

	public String getGreeting() {
		return greeting;
	}

	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}
	
	
}

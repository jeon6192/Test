package com.naver.myhome2.sample5;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component
public class MessageMultiple2 {
	@Resource(name="messageBeanEn")
	private MessageBean messageBean;
	
	public MessageMultiple2() {
		System.out.println("MessageMultiple 생성자");
	}
	
	public void print() {
		messageBean.sayHello();
	}
	
}

package com.naver.myhome2.sample3;

import org.springframework.beans.factory.annotation.Autowired;

public class MessageMultiple2 {
	private MessageBean messageBean;
	
	public MessageMultiple2() {
		System.out.println("MessageMultiple 생성자");
	}
	
	public void print() {
		messageBean.sayHello("Spring");
	}
	
}

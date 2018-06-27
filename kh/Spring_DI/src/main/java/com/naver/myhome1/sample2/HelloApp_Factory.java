package com.naver.myhome1.sample2;

import com.naver.myhome1.sample2.MessageBean;

public class HelloApp_Factory {
	public static void main(String[] args) {
		BeanFactory factory = new BeanFactory();
		MessageBean bean = (MessageBean) factory.getBean("MessageBeanEn");
		bean.sayHello("spring");
	}

}

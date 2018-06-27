package com.naver.myhome3.sample1;

public class HelloApp1 {
	public static void main(String[] args) {
		MessageBeanImpl msgBean = new MessageBeanImpl("Spring");
		FileOutputter outputter = new FileOutputter();
		
		outputter.setFilePath("out.txt");
		msgBean.setGreeting("안녕하세요!");
		msgBean.setOutputter(outputter);
		
		msgBean.sayHello();
	}
}

package com.naver.myhome3.sample2;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component
public class MessageBeanImpl implements MessageBean{
	private String name;
	private String greeting;
	private Outputter outputter;
	
	@PostConstruct
	public void initMethod() {
		System.out.println("MessageBeanImpl의 initMethod() 실행");
	}
	
	public MessageBeanImpl() {
		name = "홍길동";
		System.out.println("1. MessageBeanImpl 생성자 입니다.");
	}

	@Override
	public void sayHello() {
		String message = greeting + name + "!";
		System.out.println("6. MessageBeanImpl의 sayHello() 호출 : " + message);
		try {
			outputter.output(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	public void setGreeting(String greeting) {
		this.greeting = greeting;
		System.out.println("4. MessageBeanImpl의 setGreeting()에서 값 저장");
	}

	@Resource(name="fileOutputter")
	public void setOutputter(Outputter outputter) {
		this.outputter = outputter;
		System.out.println("5. MessageBeanImpl의 setOutputter()");
	}
	
	
}

package com.naver.myhome2.sample4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("m3")
public class MessageBeanImpl implements MessageBean{
	private String name;
	private String greeting;
	private Outputter outputter;
	
	public MessageBeanImpl() {
		name = "홍길동";
		System.out.println("2. MessageBeanImpl 생성자 입니다.");
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

	@Autowired
	public void setOutputter(Outputter outputter) {
		this.outputter = outputter;
		System.out.println("3. MessageBeanImpl의 setOutputter()");
	}
	
}

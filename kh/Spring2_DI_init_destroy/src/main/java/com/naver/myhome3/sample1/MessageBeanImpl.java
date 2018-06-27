package com.naver.myhome3.sample1;

public class MessageBeanImpl implements MessageBean{
	private String name;
	private String greeting;
	private Outputter outputter;
	
	public void initMethod() {
		System.out.println("MessageBeanImpl의 initMethod() 실행");
	}
	
	public MessageBeanImpl(String name) {
		this.name = name;
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

	public String getGreeting() {
		return greeting;
	}

	public void setGreeting(String greeting) {
		this.greeting = greeting;
		System.out.println("4. MessageBeanImpl의 setGreeting()에서 값 저장");
	}

	public Outputter getOutputter() {
		return outputter;
	}

	public void setOutputter(Outputter outputter) {
		this.outputter = outputter;
		System.out.println("5. MessageBeanImpl의 setOutputter()");
	}
	
	
	
	
}

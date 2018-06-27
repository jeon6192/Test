package com.naver.myhome1.sample1;

public class HelloApp {
	public static void main(String[] args) {
		MessageEn msgEn;
		MessageKo msgKo;
		
		msgEn = (name) -> {
			System.out.println("Hello! " + name);
		};
		
		msgKo = (name) -> {
			System.out.println("안녕! " + name);
		};
		
		msgEn.method("Spring");
		msgKo.method("스프링");
		
	}
}

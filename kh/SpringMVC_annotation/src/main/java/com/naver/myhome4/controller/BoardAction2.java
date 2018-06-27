package com.naver.myhome4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.myhome4.model.BbsBean;

@Controller
public class BoardAction2 {
	@RequestMapping(value="/login_ok2.do", method=RequestMethod.POST)
	public String board_write(BbsBean bbs) throws Exception{
		/*
			command 객체란?
			- 스프링은 요청 파라미터의 값을 command 객체에 담아주는 기능을 제공함
			- HTTP 요청 파라미터 값을 전달 받을 때 사용되는 객체
			- command 객체로 사용될 클래스에 제한은 없으면 자바빈 규칙에 맞춰 알맞은
			setter 메서드만 제공하면됨
			- command 객체에는 파라미터로 넘어온 값들을 저장할 setter 메서드가 존재하면됨
			  파라미터 이름과 property의 이름이 같으면 됨
			  ex) <input type=text name=id>에서 입력한 값을 저장하기 위해
			  setId() 메서드가 존재하면 됨 
		 */
		return "list2";
	}

}

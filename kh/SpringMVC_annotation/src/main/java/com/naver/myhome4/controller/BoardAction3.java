package com.naver.myhome4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.myhome4.model.BbsBean;

@Controller
public class BoardAction3 {
	@RequestMapping(value="/login_ok3.do", method=RequestMethod.POST)
	public String board_write(@ModelAttribute("hoho")BbsBean bbs) throws Exception{
		return "list3";
	}

}

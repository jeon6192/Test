package com.naver.board.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.naver.board.dao.MemberDAOImpl;
import com.naver.board.dao.MemberService;
import com.naver.board.model.MemberBean;

@Controller
public class MemberAction {
	@Autowired
	private MemberService memberService;
	
	private String saveFolder = "D:\\spring_workspace2\\Spring7_mvc_member\\src\\main\\webapp\\resources\\upload";
	
	@RequestMapping(value = "/login.net")
	public String login() {
		return "member/loginForm";
	}

	
	@RequestMapping(value = "/join.net")
	public String join() {
		return "member/joinForm";
	}
	
		
}
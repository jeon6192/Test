package com.naver.board.action;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.naver.board.dao.MemberService;

@Controller
public class MemberAction {
	@Autowired
	private MemberService memberService;
	
	private String saveFolder = "C:\\Users\\user1\\git\\Test3\\kh\\Spring7_mvc_member";
	
	@RequestMapping(value = "/member_login.nhn")
	public String login() {
		return "member/member_login";
	}

	
	@RequestMapping(value = "/member_join.nhn")
	public String join() {
		return "member/member_join";
	}
	
		
	@RequestMapping(value = "/checkMemberId.nhn")
	public void checkMemberId(@RequestParam("join_id") String id, 
			HttpServletResponse response) throws Exception {
		int result = memberService.checkMemberId(id);
		
		if (result == 0) {
			response.getWriter().print(0);
		} else {
			response.getWriter().print(1);
		}
		
	}
	
}
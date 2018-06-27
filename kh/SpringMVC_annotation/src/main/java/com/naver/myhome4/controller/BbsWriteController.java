package com.naver.myhome4.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.naver.myhome4.model.BbsBean;

/*
	Controller 종류
	 1. Controller(interface)
	 2. AbstractController
	 3. AbstractCommandController
	 4. MultiActionController
	 	위의 interface/class를 상속하여 Controller 작성
 */
public class BbsWriteController extends AbstractController {
	private BbsBean bbsBean;

	public void setBbsBean(BbsBean bbsBean) {
		this.bbsBean = bbsBean;
	}

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		
		bbsBean.setId(id);
		bbsBean.setPass(pass);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("list");
		mav.addObject("bbsBean", bbsBean);
		
		return mav;
	}

}

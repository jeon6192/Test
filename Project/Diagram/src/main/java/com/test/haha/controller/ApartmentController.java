package com.test.haha.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.haha.bean.ApartListBean;
import com.test.haha.bean.AptComplexBean;
import com.test.haha.service.ApartmentService;

@Controller
public class ApartmentController {
	
	@Autowired
	private ApartmentService apartmentService;
	
	
	@RequestMapping("/main.com")
	public ModelAndView mainPage() {
		return new ModelAndView("template");
	}
	
	@RequestMapping(value = "/apart/insertform.com")
	public ModelAndView insertform_apart() {
		
		return new ModelAndView("template", "viewName", "apart/insert_aptcomplex");
	}
	
	@RequestMapping(value = "/apart/insert.com")
	public ModelAndView insert_apart(AptComplexBean aptComplexBean, 
			ApartListBean apartListBean) throws Exception {
		Map<String, Object> apartMap = new HashMap<String, Object>();
		
		apartMap.put("aptComplexBean", aptComplexBean);
		apartMap.put("apartListBean", apartListBean);
		
		apartmentService.insert_apart(apartMap);
		
		
		//return new ModelAndView("template", "viewName", "apart/list");
		return new ModelAndView("redirect:/apart/list.com");
	}
	
	@RequestMapping(value = "/apart/detail.com")
	public ModelAndView detail_apart(@RequestParam("complex_id") int complex_id, 
			@RequestParam(value = "page", defaultValue = "1") int page) throws Exception {
		
		return new ModelAndView("template", "viewName", "apart/detail");
	}
	
}

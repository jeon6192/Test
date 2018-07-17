package com.naver.house.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.house.bean.ApartListBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.service.ApartmentService;

@Controller
public class ApartmentController {
	public final static String PHARM_URL = "http://openapi.hira.or.kr/openapi/service/pharmacyInfoService/getParmacyBasisList";
    public final static String KEY = "TVCsVr8g3adcmCcALi9bYrk2cLFJEr3fCn16ZYY0FYOtOs6n5lC%2BmB2sN2%2FjORFcTZNOwiHJtGRb39KL2Doqmw%3D%3D";
	
	@Autowired
	private ApartmentService apartmentService;
	
	
	@RequestMapping("/main.com")
	public ModelAndView mainPage() {
		return new ModelAndView("template");
	}
	
	@RequestMapping(value = "/apart/insertform.com")
	public ModelAndView insertform_apart() {
		
		return new ModelAndView("template", "viewName", "apart/insert_aptcomplex.jsp");
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

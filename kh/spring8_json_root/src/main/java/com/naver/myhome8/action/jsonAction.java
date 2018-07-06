package com.naver.myhome8.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome8.dao.jsonService;
import com.naver.myhome8.model.BoardVO;

@Controller
public class jsonAction {

	@Autowired
	private jsonService service;
	
	@RequestMapping(value="/start2")
	public String json_ex(){	
		return "start2";
	}
	
	/*
	 * @ResponseBody와 jackson을 이용하여 JSON 사용하기
	 * @ResponseBody란 ? 메서드에 @ResponseBody Annotation이 되어 있으면 return 되는 값은 View를 통해서 출력되는 것이 아니라
	 * Http Response Body에 직접 쓰여지게 됩니다.
	 * */
	@RequestMapping(value="/jsontest3")
	@ResponseBody
	public Object json_show_all() throws Exception {		
		List<BoardVO> list = service.selectall();		
		return list;
		
	}

	@RequestMapping(value="/jsontest2",method=RequestMethod.GET)
	@ResponseBody
	public Object json_show_add(
			BoardVO bv) throws Exception{
		service.setInsert(bv);
		System.out.println(bv.getId());
		return service.get_whereid(bv.getId());
	}
}

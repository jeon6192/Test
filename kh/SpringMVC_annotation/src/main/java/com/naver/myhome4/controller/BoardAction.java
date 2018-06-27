package com.naver.myhome4.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome4.model.BbsBean;


/*
	@Controller Annotation을 사용한 컨트롤러 클래스를 이용해서 특정 요청URL을 처리함
	@Component를 상속한 @Controller는 @Controller가 붙은 클래스의 객체를 메모리에 생성하는
	기능을 제공
	단순히 객체를 생성하는것에 그치지 않고 DispatcherServlet이 인식하는 Controller객체로 만듬
	
	만약 @controller를 사용하지 않으면 handleRequestInternal()메서드를 반드시
	재정의하여 작성해야 함
	이렇게 구현한 Controller는 스프링 프레임워크가 지향하는 
	POJO(Plain Old Java Object)스타일의 클래스가 아님
	따라서 Controller를 POJO 스타일의 클래스로 구현하려면
	"extends AbstractController"를 제거하고 클래스 위에 @Controller를 선언함
	스프링 컨테이너는 @controller가 선언된 객체를 자동으로 Controller 객체로 인식
 */

@Controller
public class BoardAction {
	/*
		@RequestMapping Annotaition을 사용해서 메서드에 처리할 요청 경로를 지정함
		@RequestMapping 뒤에는 반드시 메서드가 나와야하고 자동 호출 됨
		이름은 다른 메서드들과 중복되지 않게만 작성합니다
		get방식의 전송의 경우 생략가능
		post방식과 get방식을 모두 적용할 경우에는
		method={RequestMethod.POST, RequestMethod.GET} 라고 작성
	 */
	
	@RequestMapping(value="/login_ok.do", method=RequestMethod.POST)
	public ModelAndView board_write(HttpServletRequest request, HttpServletResponse response)
		throws Exception{
		ModelAndView mav = new ModelAndView();
		BbsBean bbsBean = new BbsBean();
		
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		
		bbsBean.setId(id);
		bbsBean.setPass(pass);
		
		mav.setViewName("list");
		mav.addObject("bbsBean", bbsBean);
		
		return mav;
	}

}

package com.naver.board.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.board.dao.MemberService;
import com.naver.board.model.MemberBean;
import com.naver.board.model.ZipcodeBean;
import com.naver.board.model.ZipcodeBean2;

@Controller
public class MemberAction {
	@Autowired
	private MemberService memberService;
	
	private String saveFolder = "C:\\Users\\user1\\git\\Test\\kh\\Spring7_mvc_member\\src\\main\\webapp\\resources\\upload";
	
	@RequestMapping(value = "/member_login.nhn")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("template");
		mav.addObject("viewName", "member/member_login");
		return mav;
	}

	
	@RequestMapping(value = "/member_join.nhn")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView("template");
		mav.addObject("viewName", "member/member_join");
		return mav;
	}
	
	
	@RequestMapping(value = "/member_logout.nhn")
	public void member_logout(HttpServletResponse response, HttpSession session) throws Exception{
		session.invalidate();
		response.getWriter().print("<script>location.href='./member_login.nhn';</script>");
	}
	
	
	@RequestMapping(value = "/member_join_ok.nhn", method=RequestMethod.POST)
	public ModelAndView member_join_ok(MemberBean memberBean, 
			HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/member_login.nhn");
		String join_tel = memberBean.getJoin_tel1() + "-" + memberBean.getJoin_tel2() + "-" + memberBean.getJoin_tel3();
		String join_phone = memberBean.getJoin_phone1() + "-" + memberBean.getJoin_phone2() + "-" + memberBean.getJoin_phone3();
		String join_email = memberBean.getJoin_mailid() + "@" + memberBean.getJoin_maildomain();
		
		memberBean.setJoin_tel(join_tel);
		memberBean.setJoin_phone(join_phone);
		memberBean.setJoin_email(join_email);
		
		MultipartFile upFile = memberBean.getJoin_profile();
		
		if(!upFile.isEmpty()) {
			String fileName = upFile.getOriginalFilename();
			
			memberBean.setJoin_original(fileName);
			
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH) + 1;
			int date = c.get(Calendar.DATE);
			String homeDir = saveFolder + "/" + year + "-" + month + "-" + date;
			
			File path1 = new File(homeDir);
			
			if(!(path1.exists())) {
				System.out.println("폴더 생성");
				path1.mkdirs();
			}
			
			Random r = new Random();
			int random = r.nextInt(100000000);
			
			int index = fileName.lastIndexOf(".");
			String fileExtension = fileName.substring(index + 1);
			
			System.out.println("fileExtension : " + fileExtension);
			
			// 새로운 파일명 지정
			String reFileName = "member" + year + month + date + random + "." + fileExtension;
			
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + reFileName;
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장
			upFile.transferTo(new File(saveFolder + fileDBName));
			// 바뀐파일명으로 저장
			memberBean.setJoin_file(fileDBName);
		}
		
		this.memberService.insertMember(memberBean);
		response.getWriter().print("<script>alert('가입 성공');</script>");
		
		return mav;
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
	
	@RequestMapping(value="/zipcode_find.nhn")
	public String zipcode_find() {
		return "member/zipcode_find";
		//member 폴더의 zipcode_find.jsp 뷰 페이지 실행
	}
	
	@RequestMapping(value = "/zipcode_find_ok.nhn", method=RequestMethod.POST)
	public ModelAndView zipcode_find_ok(@RequestParam String dong) throws Exception{
		
		List<ZipcodeBean2> zipcodeList = new ArrayList<ZipcodeBean2>();
		List<ZipcodeBean> zipcodeList2 = new ArrayList<ZipcodeBean>();
		
		zipcodeList = this.memberService.findZipcode("%" + dong + "%");
		
		
		for(int i = 0; i < zipcodeList.size(); i++) {
			ZipcodeBean2 zipcode_addr = zipcodeList.get(i);
			
			String zipcode = zipcode_addr.getZipcode();
			String sido = zipcode_addr.getSido();
			String gugun = zipcode_addr.getSigungu();
			String doro = zipcode_addr.getDoro();
			String addr = sido + " " + gugun + " " + doro;
			
			ZipcodeBean zip = new ZipcodeBean();
			zip.setZipcode(zipcode);
			zip.setAddr(addr);
			
			zipcodeList2.add(zip);
		}
		
		ModelAndView mav = new ModelAndView("member/zipcode_find");
		mav.addObject("zipcodeList", zipcodeList2);
		mav.addObject("dong", dong);
		
		return mav;
	}
	
	@RequestMapping(value="/login.nhn")
	public void login(MemberBean memberBean, HttpServletResponse response) throws Exception {
		MemberBean memberBeanDB = memberService.userCheck(memberBean.getJoin_id());
		PrintWriter out = response.getWriter();
		
		if (memberBeanDB == null) {
			out.print(-1); // ID 없을때
			return;
		}
		
		String inputPass  = memberBean.getJoin_pwd();
		String pass = memberBeanDB.getJoin_pwd();
		
		if (inputPass.equals(pass)) {
			out.print(1);
		} else {
			out.print(0);
		}
	}
	
	@RequestMapping(value = "/member_login_ok.nhn", method = {RequestMethod.POST, RequestMethod.GET})
	public void member_login_ok(HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String join_name = memberService.userCheck(id).getJoin_name();
		String join_file = memberService.userCheck(id).getJoin_file();
		
		
		session.setAttribute("id", id);
		session.setAttribute("join_name", join_name);
		session.setAttribute("join_file", join_file);
		response.getWriter().print("<script>location.href='./member_login.nhn';</script>");
	}
	
	
	
	@RequestMapping(value = "/pwd_find.nhn")
	public String pwd_find() {
		return "member/pwd_find";
	}
	
	
	@RequestMapping(value = "/pwd_find_ok.nhn", method=RequestMethod.POST)
	public ModelAndView pwd_find_ok(MemberBean memberBean) throws Exception{
		ModelAndView mav = new ModelAndView("member/pwd_find");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("join_name", memberBean.getJoin_name());
		map.put("join_id", memberBean.getJoin_id());
		
		String join_pwd = " ";
		
		MemberBean memberBeanDB = memberService.findpwd(map);
		
		if(memberBeanDB != null) {
			join_pwd = memberBeanDB.getJoin_pwd();
		}
		mav.addObject("join_pwd", join_pwd);
		
		return mav;
	}
}
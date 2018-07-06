package com.naver.board.action;

import java.io.File;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
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
	
	//private String saveFolder = "C:\\Users\\user1\\git\\Test\\kh\\Spring7_mvc_member\\src\\main\\webapp\\resources\\upload";
	private String saveFolder = "C:/Program Files/Apache Software Foundation/Tomcat 8.5/webapps/myhome7/resources/upload";
	
	@RequestMapping(value = "/member_login.nhn")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("template");
		mav.addObject("viewName", "member/member_login");
		return mav;
	}
	
	@RequestMapping(value = "/member_loginbox.nhn")
	public ModelAndView loginBox(HttpServletRequest request, 
			HttpServletResponse response, 
			@CookieValue(value = "rememId", required = false) Cookie readCookie) throws Exception{
		ModelAndView mav = new ModelAndView("member/login");
		
		if(readCookie != null) {
			mav.addObject("saveid", readCookie.getValue());
		}
		
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
	public ModelAndView member_join_ok(MemberBean memberBean) throws Exception{
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
			System.out.println(path1.getPath());
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
		
		boolean idChk = request.getParameter("rememId") != null;
		String id = request.getParameter("join_id");
		String join_name = memberService.userCheck(id).getJoin_name();
		String join_file = memberService.userCheck(id).getJoin_file();
		
		Cookie cookie = null;
		if(idChk != false) {
			cookie = new Cookie("rememId", id);
			cookie.setMaxAge(120);
			response.addCookie(cookie);
		}
		
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
	
	
	@RequestMapping(value = "/member_update.nhn")
	public ModelAndView member_modify(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		
		ModelAndView mav = new ModelAndView("template");
		mav.addObject("viewName", "member/member_modify");
		
		String id = session.getAttribute("id").toString();
		MemberBean memberBean = memberService.userCheck(id);
		
		String join_tel = memberBean.getJoin_tel();
		
		StringTokenizer st01 = new StringTokenizer(join_tel, "-");
		String join_tel1 = st01.nextToken();
		String join_tel2 = st01.nextToken();
		String join_tel3 = st01.nextToken();
		
		String join_phone = memberBean.getJoin_phone();
		
		StringTokenizer st02 = new StringTokenizer(join_phone, "-");
		String join_phone1 = st02.nextToken();
		String join_phone2 = st02.nextToken();
		String join_phone3 = st02.nextToken();
		
		String join_email = memberBean.getJoin_email();
		
		StringTokenizer st03 = new StringTokenizer(join_email, "@");
		String join_mailid = st03.nextToken();
		String join_maildomain = st03.nextToken();
		
		memberBean.setJoin_tel1(join_tel1);
		memberBean.setJoin_tel3(join_tel2);
		memberBean.setJoin_tel2(join_tel3);
		memberBean.setJoin_phone1(join_phone1);
		memberBean.setJoin_phone2(join_phone2);
		memberBean.setJoin_phone3(join_phone3);
		memberBean.setJoin_mailid(join_mailid);
		memberBean.setJoin_maildomain(join_maildomain);
		
		mav.addObject("memberBean", memberBean);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/member_update_ok.nhn")
	public ModelAndView board_update_ok(MemberBean memberBean, 
			HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/member_login.nhn");
		String join_tel = memberBean.getJoin_tel1() + "-" + memberBean.getJoin_tel2() + "-" + memberBean.getJoin_tel3();
		String join_phone = memberBean.getJoin_phone1() + "-" + memberBean.getJoin_phone2() + "-" + memberBean.getJoin_phone3();
		String join_email = memberBean.getJoin_mailid() + "@" + memberBean.getJoin_maildomain();
		String id = memberBean.getJoin_id();
		
		memberBean.setJoin_tel(join_tel);
		memberBean.setJoin_phone(join_phone);
		memberBean.setJoin_email(join_email);
		
		
		MultipartFile uploadFile = memberBean.getJoin_profile();
		MemberBean memberBeanDB = memberService.userCheck(id);
		String chk = request.getParameter("profile");
		System.out.println("chk : "+chk);
		
		if(!uploadFile.isEmpty()) {
			File delFile = new File(saveFolder + memberBeanDB.getJoin_file());
			if(delFile.exists()) {
				delFile.delete();
			}
			
			String fileName = uploadFile.getOriginalFilename();
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
			System.out.println("fileDBName : "+fileDBName);
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장
			uploadFile.transferTo(new File(saveFolder + fileDBName));
			// 바뀐파일명으로 저장
			memberBean.setJoin_file(fileDBName);
		} else if(uploadFile.isEmpty() && memberBeanDB.getJoin_file() != null && !chk.equals("")) {
			memberBean.setJoin_file(memberBeanDB.getJoin_file());
			memberBean.setJoin_original(memberBeanDB.getJoin_original());
		}
				
		memberService.updateMember(memberBean);
		request.getSession().setAttribute("join_name", memberBean.getJoin_name());
		request.getSession().setAttribute("join_file", memberBean.getJoin_file());
		
		return mav;
	}
	
	@RequestMapping(value = "/member_del.nhn")
	public ModelAndView member_del(HttpSession session, 
			HttpServletResponse response) throws Exception {
		String id = session.getAttribute("id").toString();
		MemberBean memberBean = memberService.userCheck(id);
		ModelAndView mav = new ModelAndView("member/member_del");
		
		mav.addObject("d_id", id);
		mav.addObject("d_name", memberBean.getJoin_name());
		
		return mav;
	}
	
	
	@RequestMapping(value = "/member_del_ok.nhn", method = {RequestMethod.POST, RequestMethod.GET})
	public void member_del_ok(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		
		String id = session.getAttribute("id").toString();
		String pass = request.getParameter("pwd").trim();
		String del_cont = request.getParameter("del_cont").trim();
		
		MemberBean memberBean = memberService.userCheck(id);
		
		if(!memberBean.getJoin_pwd().equals(pass)) {
			response.getWriter().println("<script> alert('비번이 다름'); history.back(); </script>");
		} else {
			String fileName = memberBean.getJoin_file();
			
			if(fileName != null) {
				File delFile = new File(saveFolder + fileName);
				delFile.delete();
			}
			MemberBean delMemberBean = new MemberBean();
			
			delMemberBean.setJoin_id(id);
			delMemberBean.setJoin_delcont(del_cont);
			memberService.deleteMember(delMemberBean);
			session.invalidate();
			response.getWriter().println("<script> alert('탈퇴성공'); window.close(); </script>");
		}
	}
	
	
	
	
}
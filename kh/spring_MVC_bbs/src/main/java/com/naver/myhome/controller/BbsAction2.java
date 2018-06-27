package com.naver.myhome.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.dao.BbsService;
import com.naver.myhome.model.BbsBean;

@Controller
public class BbsAction2 {
	
	@Autowired
	private BbsService bbsService;
	
	private String saveFolder = "D:\\spring_workspace\\spring_MVC_bbs\\src\\main\\webapp\\resources\\upload";
	
	@RequestMapping(value="/header")
	public String header() {
		return "header";
	}
	
	/* 자료실 입력폼 */
	@RequestMapping(value="/bbs_write.nhn")
	public String bbs_write() {
		return "board/bbs_write";	//bbs폴더의 bbs_write.jsp 뷰 페이지가 실행
	}
	
	@RequestMapping(value="/bbs_write_ok.nhn", method=RequestMethod.POST)
	public ModelAndView bbs_write_ok(BbsBean bbsBean) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/bbs_list.nhn");
		MultipartFile uploadFile = bbsBean.getUploadfile();
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			
			bbsBean.setBbs_original(fileName);
			
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
			String reFileName = "bbs" + year + month + date + random + "." + fileExtension;
			
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + reFileName;
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장
			uploadFile.transferTo(new File(saveFolder + fileDBName));
			// 바뀐파일명으로 저장
			bbsBean.setBbs_file(fileDBName);
		}
		
		this.bbsService.insertBbs(bbsBean);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/bbs_list.nhn")
	public ModelAndView bbs_list(@RequestParam(value="page", defaultValue="1") int page, 
			@RequestParam(value="item", defaultValue="0") int item, 
			@RequestParam(value="keyword", defaultValue="") String keyword) throws Exception{
		ModelAndView mav = new ModelAndView("board/bbs_list");
		int listCount = 0;
		List<BbsBean> bbsBeanList = new ArrayList<BbsBean>();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Integer> pageMap = new HashMap<String, Integer>();
		
		if(item == 0) {
			
			listCount = bbsService.getListCount();
			bbsBeanList = bbsService.getBbsList(page);
		} else {
			
			
			searchMap.put("item", item);
			searchMap.put("keyword", keyword);
			searchMap.put("page", page);
			
			listCount = bbsService.getListCount3(searchMap);
			bbsBeanList = bbsService.getBbsList3(searchMap);
			System.out.println("수 : "+listCount);
		}
		
		
		int maxPage = (listCount + 10 - 1) / 10;
		int startPage = ((page - 1) / 10) * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		pageMap.put("listCount", listCount);
		pageMap.put("maxPage", maxPage);
		pageMap.put("startPage", startPage);
		pageMap.put("endPage", endPage);
		pageMap.put("page", page);
		
		mav.addObject("searchMap", searchMap);
		mav.addObject("bbsBeanList", bbsBeanList);
		mav.addObject("pageMap", pageMap);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/bbs_detail.nhn")
	public ModelAndView board_detail(@RequestParam("num") Integer num, 
			@RequestParam(value="page", defaultValue="1") Integer page) throws Exception{
		BbsBean bbsBean = bbsService.getBbsCont(num);
		bbsService.bbsHit(num);
		
		ModelAndView mav = new ModelAndView("board/bbs_view");
		mav.addObject("bbsBean", bbsBean);
		mav.addObject("page", page);
		
		return mav;
	}
	
	@RequestMapping(value = "/bbs_delete.nhn")
	public ModelAndView board_delete(@RequestParam(value="num") int num, 
			@RequestParam("page") int page) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/bbs_list.nhn?page="+page);
		BbsBean bbsBean = bbsService.getBbsCont(num);
		String fileName = bbsBean.getBbs_file();
		
		if(fileName != null) {
			File file = new File(saveFolder + fileName);
			file.delete();
		}
		
		bbsService.deleteBbs(num);
		
		return mav;
	}
	
	@RequestMapping(value = "/bbs_update.nhn")
	public ModelAndView board_update(@RequestParam(value="num") int num, 
			@RequestParam("page") int page) throws Exception{
		ModelAndView mav = new ModelAndView("board/bbs_modifyForm");
		BbsBean bbsBean = bbsService.getBbsCont(num);
		mav.addObject("bbsBean", bbsBean);
		mav.addObject("page", page);
		
		return mav;
	}
	
	@RequestMapping(value = "/bbs_update_ok.nhn")
	public ModelAndView board_update_ok(BbsBean bbsBean, @RequestParam("page") int page) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/bbs_detail.nhn?num=" + bbsBean.getBbs_num() + "&page=" + page);
		
		MultipartFile uploadFile = bbsBean.getUploadfile();
		BbsBean bbsCont = bbsService.getBbsCont(bbsBean.getBbs_num());
		
		if(!uploadFile.isEmpty()) {
			File delFile = new File(saveFolder + bbsCont.getBbs_file());
			if(delFile.exists()) {
				delFile.delete();
			}
			
			String fileName = uploadFile.getOriginalFilename();
			bbsBean.setBbs_original(fileName);
			
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
			String reFileName = "bbs" + year + month + date + random + "." + fileExtension;
			
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + reFileName;
			System.out.println("fileDBName : "+fileDBName);
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장
			uploadFile.transferTo(new File(saveFolder + fileDBName));
			// 바뀐파일명으로 저장
			bbsBean.setBbs_file(fileDBName);
		}
				
		bbsService.editBbs(bbsBean);
		
		return mav;
	}
	
	@RequestMapping(value = "/bbs_reply.nhn")
	public ModelAndView board_reply(@RequestParam("num") int num) throws Exception{
		ModelAndView mav = new ModelAndView("board/bbs_reply");
		BbsBean bbsBean = bbsService.getBbsCont(num);
		mav.addObject("bbsBean", bbsBean);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/bbs_reply_ok.nhn", method=RequestMethod.POST)
	public ModelAndView board_reply_ok(BbsBean bbsBean) throws Exception{
		
		MultipartFile uploadFile = bbsBean.getUploadfile();
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			
			bbsBean.setBbs_original(fileName);
			
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
			String reFileName = "bbs" + year + month + date + random + "." + fileExtension;
			
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + reFileName;
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장
			uploadFile.transferTo(new File(saveFolder + fileDBName));
			// 바뀐파일명으로 저장
			bbsBean.setBbs_file(fileDBName);
		}
		System.out.println("답글 "+bbsBean.getBbs_file());
		bbsService.bbsReplyOk(bbsBean);
		
		ModelAndView mav = new ModelAndView("redirect:/bbs_list.nhn");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/download.file", method=RequestMethod.GET)
	public void downloadFile(
			@RequestParam("path") String storedFileName, 
			@RequestParam("original") String originalFileName, 
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(saveFolder + storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8")  
				+ "\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
}

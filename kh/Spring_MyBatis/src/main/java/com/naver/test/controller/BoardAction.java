package com.naver.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.test.model.BoardBean;
import com.naver.test.model.BoardDAOImpl;


@Controller
public class BoardAction {
	@Autowired
	private BoardDAOImpl boardService;
	
	@RequestMapping(value="/board_write.nhn")
	public ModelAndView board_write() throws Exception{
		ModelAndView mav = new ModelAndView("board/board_write");
		return mav;
	}
	
	@RequestMapping(value = "/board_write_ok.nhn", method = RequestMethod.POST)
	public ModelAndView board_write_ok(BoardBean boardBean) throws Exception{
		int result = boardService.board_insert(boardBean);
		if (result == 0) {
			System.out.println("board_insert fail");
		}
		
		ModelAndView mav = new ModelAndView("redirect:/board_list.nhn");
		return mav;
	}
	
	@RequestMapping(value = "/board_list.nhn")
	public ModelAndView board_list(@RequestParam(value="page", required=false) Integer page) throws Exception{
		ModelAndView mav = new ModelAndView("board/board_list");
		
		if(page == null) {
			page = 1;
		}
		int listCount = boardService.getListCount();
		List<BoardBean> boardBeanList = boardService.board_list(page);
		Map<String, Integer> pageMap = new HashMap<String, Integer>();
		
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
		
		mav.addObject("boardBeanList", boardBeanList);
		mav.addObject("pageMap", pageMap);
		
		return mav;
	}
	
	@RequestMapping(value = "/board_detail.nhn")
	public ModelAndView board_detail(@RequestParam("num") Integer num, 
			@RequestParam(value="page", defaultValue="1") Integer page) throws Exception{
		BoardBean boardBean = boardService.board_detail(num);
		boardService.boardHit(num);
		
		ModelAndView mav = new ModelAndView("board/board_view");
		mav.addObject("boardBean", boardBean);
		mav.addObject("page", page);
		
		return mav;
	}
	
	@RequestMapping(value = "/board_delete.nhn")
	public ModelAndView board_delete(@RequestParam(value="num") int num, 
			@RequestParam("page") int page) {
		ModelAndView mav = new ModelAndView("redirect:/board_list.nhn?page="+page);
		int result = boardService.board_delete(num);
		
		if (result == 0) {
			System.out.println("board_delete fail");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/board_update.nhn")
	public ModelAndView board_update(@RequestParam(value="num") int num) throws Exception{
		ModelAndView mav = new ModelAndView("board/board_modifyForm");
		BoardBean boardBean = boardService.board_detail(num);
		mav.addObject("boardBean", boardBean);
		
		return mav;
	}
	
	@RequestMapping(value = "/board_update_ok.nhn")
	public ModelAndView board_update_ok(BoardBean boardBean) throws Exception{
		int result = boardService.board_update(boardBean);
		if (result == 0) {
			System.out.println("board_update fail");
		}
		
		ModelAndView mav = new ModelAndView("redirect:/board_detail.nhn?num=" + boardBean.getBoard_num());
		
		return mav;
	}
	
	@RequestMapping(value = "/board_reply.nhn")
	public ModelAndView board_reply(@RequestParam("num") int num) throws Exception{
		ModelAndView mav = new ModelAndView("board/board_reply");
		BoardBean boardBean = boardService.board_detail(num);
		mav.addObject("boardBean", boardBean);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/board_reply_ok.nhn")
	public ModelAndView board_reply_ok(BoardBean boardBean) throws Exception{
		int result = boardService.board_reply(boardBean);
		if (result == 0) {
			System.out.println("board_reply fail");
		}
		
		ModelAndView mav = new ModelAndView("redirect:/board_list.nhn");
		
		return mav;
	}
}

package com.naver.test.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/*
	@Component 종류
	1. @Controller - 사용자의 요청을 제어하는 Controller 클래스
	2. @Repository - 데이터베이스 연동을 처리하는 DAO 클래스
	3. @Service -  비즈니스 로직을 처리하는 Service 클래스
 */

@Repository
public class BoardDAOImpl {
	@Autowired
	private SqlSession sqlSession;
	
	
	public int board_insert(BoardBean boardBean) throws Exception{
		int result = sqlSession.insert("Board.insert", boardBean);
		
		return result;
	}
	
	public int getListCount() {
		int result = sqlSession.selectOne("Board.getListCount");
		
		return result;
	}
	
	public List<BoardBean> board_list(int page) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + 10 - 1;

		map.put("startrow", startrow);
		map.put("endrow", endrow);
		
		List<BoardBean> boardBeanList = sqlSession.selectList("Board.getList", map);
		
		return boardBeanList;
	}
	
	public void boardHit(int num) {
		sqlSession.update("Board.board_hit", num);
	}
	
	public BoardBean board_detail(int num) {
		BoardBean boardBean = new BoardBean();
		boardBean = sqlSession.selectOne("Board.detail", num);
		
		return boardBean;
	}
	
	public int board_delete(int num) {
		int result = sqlSession.delete("Board.delete", num);
		
		return result;
	}
	
	public int board_update(BoardBean boardBean) {
		int result = sqlSession.update("Board.update", boardBean);
		
		return result;
	}
	
	public int board_reply(BoardBean boardBean) {
		sqlSession.update("Board.replyUpdate", boardBean);
		int result = sqlSession.insert("Board.replyInsert", boardBean);
		
		return result;
	}
}

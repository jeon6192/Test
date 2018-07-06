package com.naver.myhome10.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome10.model.BoardVO;

@Repository
public class DAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public BoardVO get_whereid(int id) throws Exception{
		return sqlsession.selectOne("JSON.select_one",id);
	}
	
	public void setInsert(BoardVO b) throws Exception {
		sqlsession.insert("JSON.insert",b);
	}
	
	public List<BoardVO> selectall() throws Exception {
		return sqlsession.selectList("JSON.select_list");
	}
}

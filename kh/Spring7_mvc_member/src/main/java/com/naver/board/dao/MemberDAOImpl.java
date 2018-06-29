package com.naver.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.board.model.MemberBean;


@Repository
public class MemberDAOImpl {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int checkMemberId(String id) throws Exception {
		int result = sqlSession.selectOne("Test.idcheck", id);
		return result;
	}

}

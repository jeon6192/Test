package com.naver.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.board.model.MemberBean;
import com.naver.board.model.ZipcodeBean2;


@Repository
public class MemberDAOImpl {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int checkMemberId(String id) throws Exception {
		int result = sqlSession.selectOne("Test.idcheck", id);
		return result;
	}
	
	public List<ZipcodeBean2> findZipcode(String dong) throws Exception {
		List<ZipcodeBean2> zipcodeList = sqlSession.selectList("Test.zipcodeList", dong);
		
		return zipcodeList;
	}

	public void insertMember(MemberBean m) throws Exception {
		sqlSession.insert("Test.insert", m);
	}
	
	public MemberBean userCheck(String id) throws Exception {
		MemberBean memberBean = sqlSession.selectOne("Test.userCheck", id);
		return memberBean;
	}
	
	public MemberBean findpwd(Map pm) throws Exception {
		MemberBean memberBean = sqlSession.selectOne("Test.findPwd", pm);
		return memberBean;
	}
	
	public void updateMember(MemberBean member) throws Exception {
		sqlSession.update("Test.update", member);
		
	}
}

package com.naver.myhome.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.model.MemberBean;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	/*
	  	3개의 DAO파일을 작성하였습니다.
	  	만약 BbsDAOImpl_old를 사용하고 싶다면 @Autowired할 클래스 이름만 바꾸어 주고
	  	BbsDAOImpl_old.java 파일은 @Repository를 붙여주면 됩니다.
	  	
	  	이 처럼 DAO 파일이 바뀌어도 이곳에서만 클래스 명만 바꾸어 주면 됩니다.
	  	DAO를 간접 사용하고 있는 BbsAction2.java는 수정할 필요가 없습니다.
	*/
	
	@Autowired
	private MemberDAOImpl memberDAO;

	@Override
	public MemberBean idCheck(String id) throws Exception {
		MemberBean memberBean = memberDAO.idCheck(id);
		return memberBean;
	}

	@Override
	public List<MemberBean> memberList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void memberDelete(String id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void memberUpdate(MemberBean memberBean) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void memberInsert(MemberBean memberBean) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}

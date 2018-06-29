package com.naver.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.board.model.MemberBean;
import com.naver.board.model.ZipcodeBean2;


@Service
public class MemberServiceImple implements MemberService {
	@Autowired
	private MemberDAOImpl dao;

	@Override
	public int checkMemberId(String id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ZipcodeBean2> findZipcode(String dong) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberBean findpwd(Map pm) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertMember(MemberBean m) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberBean userCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteMember(MemberBean delm) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMember(MemberBean member) throws Exception {
		// TODO Auto-generated method stub
		
	}	

	
	

}

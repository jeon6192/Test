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
	public List<ZipcodeBean2> findZipcode(String dong) throws Exception {
		List<ZipcodeBean2> zipcodeList = dao.findZipcode(dong);
		
		return zipcodeList;
	}

	@Override
	public MemberBean findpwd(Map pm) throws Exception {
		MemberBean memberBean = dao.findpwd(pm);
		return memberBean;
	}

	@Override
	public void insertMember(MemberBean m) throws Exception {
		dao.insertMember(m);
		
	}

	@Override
	public MemberBean userCheck(String id) throws Exception {
		MemberBean memberBean = dao.userCheck(id);
		return memberBean;
	}

	@Override
	public void deleteMember(MemberBean delm) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMember(MemberBean member) throws Exception {
		dao.updateMember(member);
		
	}

	@Override
	public int checkMemberId(String id) throws Exception {
		int result = dao.checkMemberId(id);
		return result;
	}	

	
	

}

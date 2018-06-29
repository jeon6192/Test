package com.naver.myhome.dao;

import java.util.List;

import com.naver.myhome.model.MemberBean;

public interface MemberService {
	public MemberBean idCheck(String id) throws Exception;
	
	public List<MemberBean> memberList() throws Exception;
	
	public void memberDelete(String id) throws Exception;
	
	public void memberUpdate(MemberBean memberBean) throws Exception;
	
	public void memberInsert(MemberBean memberBean) throws Exception;
	
	
}

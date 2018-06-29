package com.naver.myhome.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.model.BbsBean;
import com.naver.myhome.model.MemberBean;

/*
	@Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정할 수 있지만 모든 클래스에
	@Component를 할당하면 어떤 클래스가 어떤 역할을 수행하는지 파악하기 어렵습니다.
	스프링 프레임워크에서는 이런 클래스들을 분류하기 위해서 @Component를 상속하여 다음과 같은 세 개의 애노테이션을 제공합니다.
	
	==> 기능은 같지만 역할별로 알기 쉽도록 나눠놓은 것이다.
	
	1. @Controller 	- 사용자의 요청을 제어하는 Controller 클래스
	2. @Repository 	- 데이터 베이스 연동을 처리하는 DAO 클래스
	3. @Service 	- 비즈니스 로직을 처리하는 Service 클래스
*/

@Repository("memberDAO")
public class MemberDAOImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public MemberBean idCheck(String id) throws Exception {
		MemberBean memberBean = sqlSession.selectOne("Members.idcheck", id);
		return memberBean;
	}

	public List<MemberBean> memberList() throws Exception {
		List<MemberBean> memberBeanList = sqlSession.selectList("Members.getList");
		return memberBeanList;
	}

	public void memberDelete(String id) throws Exception {
		sqlSession.delete("Members.delete", id);
	}

	public void memberUpdate(MemberBean memberBean) throws Exception {
		sqlSession.update("Members.update", memberBean);
	}

	public void memberInsert(MemberBean memberBean) throws Exception {
		sqlSession.insert("Members.insert", memberBean);
	}


}

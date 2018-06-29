package com.naver.myhome.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.model.BbsBean;

/*
	@Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정할 수 있지만 모든 클래스에
	@Component를 할당하면 어떤 클래스가 어떤 역할을 수행하는지 파악하기 어렵습니다.
	스프링 프레임워크에서는 이런 클래스들을 분류하기 위해서 @Component를 상속하여 다음과 같은 세 개의 애노테이션을 제공합니다.
	
	==> 기능은 같지만 역할별로 알기 쉽도록 나눠놓은 것이다.
	
	1. @Controller 	- 사용자의 요청을 제어하는 Controller 클래스
	2. @Repository 	- 데이터 베이스 연동을 처리하는 DAO 클래스
	3. @Service 	- 비즈니스 로직을 처리하는 Service 클래스
*/

@Repository("bbsDAO")
public class BbsDAOImpl{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/* 자료실 저장 */
	public void insertBbs(BbsBean bbsBean) throws Exception{
		sqlSession.insert("Bbs.insert", bbsBean);
	}
	
	public int getListCount() {
		int result = sqlSession.selectOne("Bbs.getListCount");
		
		return result;
	}
	
	public List<BbsBean> board_list(int page, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		map.put("startrow", startrow);
		map.put("endrow", endrow);
		
		List<BbsBean> bbsBeanList = sqlSession.selectList("Bbs.getList", map);
		
		return bbsBeanList;
	}
	
	public void boardHit(int num) {
		sqlSession.update("Bbs.bbs_hit", num);
	}
	
	public BbsBean board_detail(int num) {
		BbsBean BbsBean = new BbsBean();
		BbsBean = sqlSession.selectOne("Bbs.detail", num);
		
		return BbsBean;
	}
	
	public int board_delete(int num) {
		int result = sqlSession.delete("Bbs.delete", num);
		
		return result;
	}
	
	public int board_update(BbsBean BbsBean) {
		int result = sqlSession.update("Bbs.update", BbsBean);
		
		return result;
	}
	
	public int board_reply(BbsBean BbsBean) {
		System.out.println("답글 "+BbsBean.getBbs_file());
		sqlSession.update("Bbs.replyUpdate", BbsBean);
		int result = sqlSession.insert("Bbs.replyInsert", BbsBean);
		
		return result;
	}
	
	public int getListCount3(Map<String, Object> m) {
		int result = sqlSession.selectOne("Bbs.getSearchListCount", m);
		
		return result;
	}
	
	public List<BbsBean> board_list3(Map<String, Object> m) {
		int page = Integer.parseInt(m.get("page").toString());
		int limit = Integer.parseInt(m.get("limit").toString());
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		m.put("startrow", startrow);
		m.put("endrow", endrow);
		System.out.println(" ");
		List<BbsBean> bbsBeanList = sqlSession.selectList("Bbs.getSearchList", m);
		
		return bbsBeanList;
	}
}

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

	/* ȸ�� ���� */
	public int insert(MemberBean m) throws Exception {
		return sqlSession.insert("insert", m);
	}

	// Member ����
	public void delete(String id) throws Exception {
		sqlSession.delete("Members.delete", id);
	}

	// Member ����
	public int update(MemberBean m) throws Exception {
		return sqlSession.update("Members.update", m);
	}

	public List<MemberBean> getList() throws Exception {
		return sqlSession.selectList("getList");
	}

	// Member ���� ���ϱ�
	public MemberBean getInfo(String id) throws Exception {
		return sqlSession.selectOne("idcheck", id);
	}

}

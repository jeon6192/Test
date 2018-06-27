package com.naver.myhome.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.model.BbsBean;

@Service("bbsService")
public class BbsServiceImpl implements BbsService{
	
	/*
	  	3개의 DAO파일을 작성하였습니다.
	  	만약 BbsDAOImpl_old를 사용하고 싶다면 @Autowired할 클래스 이름만 바꾸어 주고
	  	BbsDAOImpl_old.java 파일은 @Repository를 붙여주면 됩니다.
	  	
	  	이 처럼 DAO 파일이 바뀌어도 이곳에서만 클래스 명만 바꾸어 주면 됩니다.
	  	DAO를 간접 사용하고 있는 BbsAction2.java는 수정할 필요가 없습니다.
	*/
	
	@Autowired
	private BbsDAOImpl bbsDAO;

	@Override
	public void insertBbs(BbsBean bbsBean) throws Exception {
		bbsDAO.insertBbs(bbsBean);
	}

	@Override
	public int getListCount() throws Exception {
		int result = bbsDAO.getListCount();
		
		return result;
	}

	@Override
	public List<BbsBean> getBbsList(int page) throws Exception {
		List<BbsBean> bbsBeanList = bbsDAO.board_list(page);
		
		return bbsBeanList;
	}

	@Override
	public BbsBean getBbsCont(int num) throws Exception {
		BbsBean bbsBean = bbsDAO.board_detail(num);
		return bbsBean;
	}

	@Override
	public void bbsHit(int num) throws Exception {
		bbsDAO.boardHit(num);
	}

	@Override
	public void editBbs(BbsBean bbsBean) throws Exception {
		bbsDAO.board_update(bbsBean);
	}

	@Override
	public void deleteBbs(int bbs_num) throws Exception {
		bbsDAO.board_delete(bbs_num);
	}

	@Override
	public int getListCount3(Map m) throws Exception {
		int result = bbsDAO.getListCount3(m);
		
		return result;
	}

	@Override
	public List<BbsBean> getBbsList3(Map m) throws Exception {
		List<BbsBean> bbsBeanList = bbsDAO.board_list3(m);
		
		return bbsBeanList;
	}

	@Override
	public void refEdit(BbsBean bbsBean) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void bbsReplyOk(BbsBean bbsBean) throws Exception {
		bbsDAO.board_reply(bbsBean);
		
	}

}

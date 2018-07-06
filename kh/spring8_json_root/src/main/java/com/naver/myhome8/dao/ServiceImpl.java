package com.naver.myhome8.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome8.model.BoardVO;

@Service
public class ServiceImpl implements jsonService {
	
	@Autowired
	private DAO dao;	
	
	@Override
	public BoardVO get_whereid(int id) throws Exception {
		// TODO Auto-generated method stub
		return dao.get_whereid(id);
	}

	@Override
	public void setInsert(BoardVO b) throws Exception {
		dao.setInsert(b);
		
	}

	@Override
	public List<BoardVO> selectall() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectall();
	}

}

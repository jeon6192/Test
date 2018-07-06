package com.naver.myhome9.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome9.model.BoardVO;

@Service
public class ServiceImpl implements jsonService {
	
	@Autowired
	private DAO dao;
	
	//private LogAdvice log;
	
	/*public ServiceImpl() {
		log = new LogAdvice();
	}*/
	
	@Override
	public BoardVO get_whereid(int id) throws Exception {
		//log.beforeLog();
		return dao.get_whereid(id);
	}

	@Override
	public void setInsert(BoardVO b) throws Exception {
		//log.beforeLog();
		dao.setInsert(b);
		
	}

	@Override
	public List<BoardVO> selectall() throws Exception {
		//log.beforeLog();
		return dao.selectall();
	}

}

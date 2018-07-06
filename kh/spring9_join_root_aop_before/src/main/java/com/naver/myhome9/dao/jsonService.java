package com.naver.myhome9.dao;

import java.util.List;

import com.naver.myhome9.model.BoardVO;

public interface jsonService {
	public BoardVO get_whereid(int id) throws Exception;
	public void setInsert(BoardVO b) throws Exception;
	public List<BoardVO> selectall() throws Exception;
}

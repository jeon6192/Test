package com.test.haha.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.haha.bean.ApartmentBean;
import com.test.haha.bean.AptComplexBean;

@Repository
public class ApartmentDAO {
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public void insert_apartment(ApartmentBean apartmentBean) throws Exception {
		
	}
	
	public void insert_aptComplex(AptComplexBean aptComplexBean) throws Exception {
		
	}
	
	public AptComplexBean detail_aptComplex(int complex_id) throws Exception {
		AptComplexBean aptComplexBean = new AptComplexBean();
		
		return aptComplexBean;
	}
	
	public List<ApartmentBean> detail_apart(int complex_id) throws Exception {
		List<ApartmentBean> apartmentBeanList = new ArrayList<ApartmentBean>();
		
		return apartmentBeanList;
	}
	

}

package com.dangducton.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangducton.dao.DanhMucDaoImpl;
import com.dangducton.entity.Danhmucsanpham;

@Service
public class DanhMucServiceImpl implements DanhMucService {
	
	@Autowired
	DanhMucDaoImpl danhMucDaoImpl;
	
	public List<Danhmucsanpham> getAllDanhMucs() {
		return danhMucDaoImpl.getAllDanhMucs();
	}

}

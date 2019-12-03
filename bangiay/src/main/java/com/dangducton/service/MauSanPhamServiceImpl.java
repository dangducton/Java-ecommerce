package com.dangducton.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangducton.dao.MauSanPhamDaoImpl;
import com.dangducton.entity.Mausanpham;

@Service
public class MauSanPhamServiceImpl implements MauSanPhamService {
	
	@Autowired
	MauSanPhamDaoImpl mauSanPhamDaoImpl;
	
	public List<Mausanpham> getAllMauSanPhams() {
			return mauSanPhamDaoImpl.getAllMauSanPhams();
	}

}

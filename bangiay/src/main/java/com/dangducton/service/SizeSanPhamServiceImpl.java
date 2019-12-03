package com.dangducton.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangducton.dao.SizeSanPhamDaoImpl;
import com.dangducton.entity.Sizesanpham;
@Service
public class SizeSanPhamServiceImpl implements SizeSanPhamService {
	
	@Autowired
	SizeSanPhamDaoImpl sizeSanPhamDaoImpl;
	
	public List<Sizesanpham> getAllSizeSanPham() {
		return sizeSanPhamDaoImpl.getAllSizeSanPham();
	}

	public Sizesanpham getIdByTenSize(String tensize) {
		
		return sizeSanPhamDaoImpl.getIdByTenSize(tensize);
	}

	public Sizesanpham getIdByIdSize(Integer idsizesanpham) {
		
		return sizeSanPhamDaoImpl.getIdByIdSize(idsizesanpham);
	}

}

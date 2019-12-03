package com.dangducton.service;

import java.util.List;

import com.dangducton.entity.Sizesanpham;

public interface SizeSanPhamService {
	List<Sizesanpham> getAllSizeSanPham();
	
	public Sizesanpham getIdByTenSize(String tensize);
	
	public Sizesanpham getIdByIdSize(Integer idsizesanpham);
}

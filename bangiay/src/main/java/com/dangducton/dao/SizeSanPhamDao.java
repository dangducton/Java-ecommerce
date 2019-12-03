package com.dangducton.dao;

import java.util.List;

import com.dangducton.entity.Sizesanpham;


public interface SizeSanPhamDao {
	public List<Sizesanpham> getAllSizeSanPham();
	
	public Sizesanpham getIdByTenSize(String tensize);
	
	public Sizesanpham getIdByIdSize(Integer idsizesanpham);
}

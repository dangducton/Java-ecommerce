package com.dangducton.dao;

import java.util.List;

import com.dangducton.entity.Nhapchitietsanpham;

public interface NhapChiTietSanPhamDao {
	public void addNhapChiTietSanPham(Nhapchitietsanpham nhapchitietsanpham);
	
	public List<Nhapchitietsanpham> getAllSizeById(int maSanPham);
	
	public List<Nhapchitietsanpham> getAllNhapChiTietSanPham();
	
	public List<Nhapchitietsanpham> getAllNhapChiTietTheoSanPham(int maSanPham);
	
	public List<Nhapchitietsanpham> getAllNhapChiTietSanPham(Integer offset, Integer maxResults);
	
	public void upDateNhapChiTietSanPham(Nhapchitietsanpham nhapchitietsanpham);
	
	public Nhapchitietsanpham getNhapChiTietSanPhamById(Integer idNhapChiTiet);
	
	public List<Nhapchitietsanpham> kiemTraTonKho(Integer offset, Integer maxResults);
	
	public List<Nhapchitietsanpham> kiemTraTonKho();
	
	public List<Nhapchitietsanpham> SanPhamSapHetLimit10();
	
	public List<Nhapchitietsanpham> tongNhapChiTiet(Integer offset, Integer maxResults);
	
	public List<Nhapchitietsanpham> tongNhapChiTiet();
}

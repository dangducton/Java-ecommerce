package com.dangducton.dao;

import java.io.Serializable;
import java.util.List;

import com.dangducton.entity.Sanpham;

public interface SanPhamDao extends Serializable {
	public void addProduct(Sanpham sanpham);
	
	public void updateProduct(Sanpham sanpham);
	
	public List<Sanpham> getProductDetail(int maDanhMuc);
	
	public List<Sanpham> findAll(Integer offset, Integer maxResults);
    
	public long getTotal();    
	
	public Sanpham getProductById(Integer proId);
	
	public List<Sanpham> getProductDetailSanPham(int maDanhMuc);
	
	public List<Sanpham> sanPhamMoiNhat();
	
	public List<Sanpham> getProductDetailSanPhamTheoDanhMuc(int maDanhMuc,Integer offset, Integer maxResults);
	
	public long getTotalTheoDanhMuc(int maDanhMuc);
	
	public List<Sanpham> getProductDetailTheoDanhMuc(int maDanhMuc);
	
	public List<Sanpham> getProductDetailMauSac(int maMau);
	
	public List<Sanpham> getProductDetailSanPhamTheoMauSac(int maMau,Integer offset, Integer maxResults);
	
	
	public List<Sanpham> timKiemTatCaTheoTen(String tensp, Integer offset, Integer maxResults);
	
	public List<Sanpham> timKiemTatCaTheoTen(String tensp);
		
	
    public List<Sanpham> timKiemGiaTheoTen(Double giaBatDau, Double giaKetThuc,Integer offset, Integer maxResults);
	
	public List<Sanpham> timKiemGiaTheoTen(Double giaBatDau, Double giaKetThuc);
	
	public List<Sanpham> findAll();
	
	
	//public List<Sanpham> timKiemTheoGia(float giaBatDau, float giaKetThuc);
	
	//public List<Sanpham> timKiemTheoGia(float giaBatDau, float giaKetThuc, Integer offset, Integer maxResults);
	
	
}

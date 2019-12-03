package com.dangducton.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangducton.dao.SanPhamDaoImpl;
import com.dangducton.entity.Sanpham;

@Service
public class SanPhamServiceImpl implements SanPhamService {
	
	@Autowired
	SanPhamDaoImpl sanPhamDaoImpl;
	
	public void addProduct(Sanpham sanpham) {
		sanPhamDaoImpl.addProduct(sanpham);
	}
	
	public List<Sanpham> getProductDetail(int maDanhMuc) {
		return sanPhamDaoImpl.getProductDetail(maDanhMuc);
	}
	
	public List<Sanpham> findAll(Integer offset, Integer maxResults) {
		 return sanPhamDaoImpl.findAll(offset, maxResults);
	}
	
	public long getTotal() {
		  return (Long)sanPhamDaoImpl.getTotal();
	}

	public Sanpham getProductById(Integer proId) {
		return sanPhamDaoImpl.getProductById(proId);
	}

	public List<Sanpham> getProductDetailSanPham(int maDanhMuc) {
		return sanPhamDaoImpl.getProductDetailSanPham(maDanhMuc);
	}

	public List<Sanpham> sanPhamMoiNhat() {
		return sanPhamDaoImpl.sanPhamMoiNhat();
	}

	public List<Sanpham> getProductDetailSanPhamTheoDanhMuc(int maDanhMuc, Integer offset, Integer maxResults) {
		
		return sanPhamDaoImpl.getProductDetailSanPhamTheoDanhMuc(maDanhMuc, offset, maxResults);
	}

	public long getTotalTheoDanhMuc(int maDanhMuc) {
		
		return (Long)sanPhamDaoImpl.getTotalTheoDanhMuc(maDanhMuc);
	}

	public List<Sanpham> getProductDetailTheoDanhMuc(int maDanhMuc) {
		
		return sanPhamDaoImpl.getProductDetailTheoDanhMuc(maDanhMuc);
	}

	public List<Sanpham> getProductDetailMauSac(int maMau) {
		return sanPhamDaoImpl.getProductDetailMauSac(maMau);
	}

	public List<Sanpham> getProductDetailSanPhamTheoMauSac(int maMau, Integer offset, Integer maxResults) {
		return sanPhamDaoImpl.getProductDetailSanPhamTheoMauSac(maMau, offset, maxResults);
	}

	//public List<Sanpham> timKiemTatCa(String tensp, int maDM, int maMau) {
	//	return sanPhamDaoImpl.timKiemTatCa(tensp, maDM, maMau);
	//}

	//public List<Sanpham> timKiemTatCa(String tensp, int maDM, int maMau, Integer offset, Integer maxResults) {
	//	return sanPhamDaoImpl.timKiemTatCa(tensp, maDM, maMau, offset, maxResults);
	//}

	public List<Sanpham> timKiemTatCaTheoTen(String tensp, Integer offset, Integer maxResults) {
		return sanPhamDaoImpl.timKiemTatCaTheoTen(tensp, offset, maxResults);
	}

	public List<Sanpham> timKiemTatCaTheoTen(String tensp) {
		return sanPhamDaoImpl.timKiemTatCaTheoTen(tensp);
	}

	public List<Sanpham> timKiemGiaTheoTen(Double giaBatDau, Double giaKetThuc, Integer offset, Integer maxResults) {
		
		return sanPhamDaoImpl.timKiemGiaTheoTen(giaBatDau, giaKetThuc, offset, maxResults);
	}

	public List<Sanpham> timKiemGiaTheoTen(Double giaBatDau, Double giaKetThuc) {
		
		return sanPhamDaoImpl.timKiemGiaTheoTen(giaBatDau, giaKetThuc);
	}

	public void updateProduct(Sanpham sanpham) {
		sanPhamDaoImpl.updateProduct(sanpham);
	}

	public List<Sanpham> findAll() {
		
		return sanPhamDaoImpl.findAll();
	}
	

}

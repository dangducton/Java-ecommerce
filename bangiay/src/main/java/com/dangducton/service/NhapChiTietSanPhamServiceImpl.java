package com.dangducton.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangducton.dao.NhapChiTietSanPhamDaoImpl;
import com.dangducton.entity.Nhapchitietsanpham;

@Service
public class NhapChiTietSanPhamServiceImpl implements NhapChiTietSanPhamService{
	@Autowired
	NhapChiTietSanPhamDaoImpl nhapChiTietSanPhamDaoImpl;
	
	public void addNhapChiTietSanPham(Nhapchitietsanpham nhapchitietsanpham) {
		 nhapChiTietSanPhamDaoImpl.addNhapChiTietSanPham(nhapchitietsanpham);
		
	}

	public List<Nhapchitietsanpham> getAllSizeById(int maSanPham) {
		
		return nhapChiTietSanPhamDaoImpl.getAllSizeById(maSanPham);
	}

	public List<Nhapchitietsanpham> getAllNhapChiTietSanPham() {
		return nhapChiTietSanPhamDaoImpl.getAllNhapChiTietSanPham();
	}

	public List<Nhapchitietsanpham> getAllNhapChiTietTheoSanPham(int maSanPham) {
		return nhapChiTietSanPhamDaoImpl.getAllNhapChiTietTheoSanPham(maSanPham);
	}

	public List<Nhapchitietsanpham> getAllNhapChiTietSanPham(Integer offset, Integer maxResults) {
		return nhapChiTietSanPhamDaoImpl.getAllNhapChiTietSanPham(offset, maxResults);
	}

	public void upDateNhapChiTietSanPham(Nhapchitietsanpham nhapchitietsanpham) {
		nhapChiTietSanPhamDaoImpl.upDateNhapChiTietSanPham(nhapchitietsanpham);
		
	}

	public Nhapchitietsanpham getNhapChiTietSanPhamById(Integer idNhapChiTiet) {
		
		return nhapChiTietSanPhamDaoImpl.getNhapChiTietSanPhamById(idNhapChiTiet);
	}

	public List<Nhapchitietsanpham> kiemTraTonKho(Integer offset, Integer maxResults) {
		return nhapChiTietSanPhamDaoImpl.kiemTraTonKho(offset, maxResults);
	}

	public List<Nhapchitietsanpham> kiemTraTonKho() {
		return nhapChiTietSanPhamDaoImpl.kiemTraTonKho();
	}

	public List<Nhapchitietsanpham> tongNhapChiTiet(Integer offset, Integer maxResults) {
		
		return nhapChiTietSanPhamDaoImpl.tongNhapChiTiet(offset, maxResults);
	}

	public List<Nhapchitietsanpham> tongNhapChiTiet() {
		
		return nhapChiTietSanPhamDaoImpl.tongNhapChiTiet();
	}

	public List<Nhapchitietsanpham> SanPhamSapHetLimit10() {
		
		return nhapChiTietSanPhamDaoImpl.SanPhamSapHetLimit10();
	}
	
	

}

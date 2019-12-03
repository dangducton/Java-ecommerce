package com.dangducton.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangducton.dao.ChitiethoadonDaoImpl;
import com.dangducton.entity.Chitiethoadon;


@Service
public class ChiTietHoaDonServiceImpl implements ChiTietHoaDonService{
	

	@Autowired
	ChitiethoadonDaoImpl chitiethoadonDaoImpl;
	
	public void AddChiTietHoaDon(Chitiethoadon chitiethoadon) {
		chitiethoadonDaoImpl.AddChiTietHoaDon(chitiethoadon);
	}

	public List<Chitiethoadon> getAllChiTietHoaDon() {
		
		return chitiethoadonDaoImpl.getAllChiTietHoaDon();
	}

	public void update(Chitiethoadon chitiethoadon) {
		chitiethoadonDaoImpl.update(chitiethoadon);
	}

	public Chitiethoadon getChiTietHoaDonById(Integer chiTietId) {
		return chitiethoadonDaoImpl.getChiTietHoaDonById(chiTietId);
	}

	public boolean deleteChiTietHoaDon(Integer chitiethoadon) {
		
		return chitiethoadonDaoImpl.deleteChiTietHoaDon(chitiethoadon);
	}

	public List<Chitiethoadon> getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(Integer idNguoidung) {
		
		return chitiethoadonDaoImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(idNguoidung);
	}

	public long getCountAllChiTietHoaDonTheoNguoiDungChuaThanhToan(int idNguoidung) {
		
		return chitiethoadonDaoImpl.getCountAllChiTietHoaDonTheoNguoiDungChuaThanhToan(idNguoidung);
	}

	public void UpdateChiTietHoaDon(Chitiethoadon chitiethoadon) {
		chitiethoadonDaoImpl.update(chitiethoadon);
		
	}

	public Chitiethoadon getChiTietHoaDonByIdHoaDon(Integer idHoaDon) {
		
		return chitiethoadonDaoImpl.getChiTietHoaDonByIdHoaDon(idHoaDon);
	}

	public List<Chitiethoadon> getAllChiTietHoaDonTheoId(Integer idHoaDon) {
		
		return chitiethoadonDaoImpl.getAllChiTietHoaDonTheoId(idHoaDon);
	}

	public List<Chitiethoadon> TongThuNhap() {
		
		return chitiethoadonDaoImpl.TongThuNhap();
	}

	public List<Chitiethoadon> getAllChiTietHoaDonTheoNguoiDung(Integer idNguoidung) {
		
		return chitiethoadonDaoImpl.getAllChiTietHoaDonTheoNguoiDung(idNguoidung);
	}

	public List<Chitiethoadon> getAllChiTietHoaDonTheoNguoiDung(Integer idNguoidung, Integer offset,
			Integer maxResults) {
		
		return chitiethoadonDaoImpl.getAllChiTietHoaDonTheoNguoiDung(idNguoidung, offset, maxResults);
	}

	



}

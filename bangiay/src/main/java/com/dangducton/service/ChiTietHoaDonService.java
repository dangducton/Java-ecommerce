package com.dangducton.service;

import java.util.List;

import com.dangducton.entity.Chitiethoadon;

public interface ChiTietHoaDonService {
	public void AddChiTietHoaDon(Chitiethoadon chitiethoadon);
	
	public List<Chitiethoadon> getAllChiTietHoaDon();
	
	public void update (Chitiethoadon chitiethoadon);
	
	public Chitiethoadon getChiTietHoaDonById(Integer chiTietId);
	
	boolean deleteChiTietHoaDon(Integer idchitiethoadon);
	
	public List<Chitiethoadon> getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(Integer idNguoidung);
	
	public long getCountAllChiTietHoaDonTheoNguoiDungChuaThanhToan(int idNguoidung);
	
	public void UpdateChiTietHoaDon(Chitiethoadon chitiethoadon);
	
	public Chitiethoadon getChiTietHoaDonByIdHoaDon(Integer idHoaDon);
	
	public List<Chitiethoadon> getAllChiTietHoaDonTheoId(Integer idHoaDon);
	
	public List<Chitiethoadon> TongThuNhap();
	
	public List<Chitiethoadon> getAllChiTietHoaDonTheoNguoiDung(Integer idNguoidung);
	
	public List<Chitiethoadon> getAllChiTietHoaDonTheoNguoiDung(Integer idNguoidung,Integer offset, Integer maxResults);
}

package com.dangducton.service;

import java.util.List;

import com.dangducton.entity.Hoadon;

public interface HoaDonService {
	public void AddHoaDon(Hoadon Hoadon);
	
	public Hoadon getHoaDonByID(Integer idHoaDon);
	
	public List<Hoadon> findAllHoaDon(Integer offset, Integer maxResults);
	
	public List<Hoadon> findAllHoaDon();
	
	public void UpDateHoaDon(Hoadon Hoadon);
	
	public List<Hoadon> findAllHoaDonChuaXacDinh();
	
	public List<Hoadon> tongDonHang();
}

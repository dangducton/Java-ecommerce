package com.dangducton.dao;

import java.util.List;

import com.dangducton.entity.Hoadon;

public interface HoaDonDao {
	public void AddHoaDon(Hoadon Hoadon);
	
	public Hoadon getHoaDonByID(Integer idHoaDon);
	
	public List<Hoadon> findAllHoaDon(Integer offset, Integer maxResults);
	
	public List<Hoadon> findAllHoaDon();
	
	public void UpDateHoaDon(Hoadon Hoadon);
	
	public List<Hoadon> findAllHoaDonChuaXacDinh();
	
	public List<Hoadon> tongDonHang();
}

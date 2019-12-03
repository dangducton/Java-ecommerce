package com.dangducton.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangducton.dao.HoaDonDaoImpl;
import com.dangducton.entity.Hoadon;

@Service
public class HoaDonServiceImpl implements HoaDonService{

	@Autowired
	HoaDonDaoImpl hoaDonDaoImpl;
	
	public void AddHoaDon(Hoadon Hoadon) {
		
		hoaDonDaoImpl.AddHoaDon(Hoadon);
		
	}

	public Hoadon getHoaDonByID(Integer idHoaDon) {
		
		return hoaDonDaoImpl.getHoaDonByID(idHoaDon);
	}

	public List<Hoadon> findAllHoaDon(Integer offset, Integer maxResults) {
		
		return hoaDonDaoImpl.findAllHoaDon(offset, maxResults);
	}

	public List<Hoadon> findAllHoaDon() {
		return hoaDonDaoImpl.findAllHoaDon();
	}

	public void UpDateHoaDon(Hoadon Hoadon) {
		hoaDonDaoImpl.UpDateHoaDon(Hoadon);
	}

	public List<Hoadon> findAllHoaDonChuaXacDinh() {
		
		return hoaDonDaoImpl.findAllHoaDonChuaXacDinh();
	}

	public List<Hoadon> tongDonHang() {
		
		return hoaDonDaoImpl.tongDonHang();
	}

}

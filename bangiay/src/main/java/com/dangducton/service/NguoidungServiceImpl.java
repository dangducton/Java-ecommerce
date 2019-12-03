package com.dangducton.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangducton.dao.NguoidungDaoImpl;
import com.dangducton.entity.Nguoidung;

@Service
public class NguoidungServiceImpl implements NguoidungService {
	
	@Autowired
	NguoidungDaoImpl nguoiDungdaoImpl;
	
	public Nguoidung getNguoidungLogin(String tendangnhap, String matkhau) {
		
		return nguoiDungdaoImpl.getNguoidungLogin(tendangnhap, matkhau);
	}

	public Nguoidung getNguoiDungById(Integer iduser) {
		
		return nguoiDungdaoImpl.getNguoiDungById(iduser);
	}

	public void AddNguoiDung(Nguoidung nguoiDung) {
		 nguoiDungdaoImpl.AddNguoiDung(nguoiDung);
	}

	public List<Nguoidung> listNguoiDung() {
		
		return nguoiDungdaoImpl.listNguoiDung();
	}

	public List<Nguoidung> getNguoiDungByTenDangNhap(String tendangnhap) {
		
		return nguoiDungdaoImpl.getNguoiDungByTenDangNhap(tendangnhap);
	}

	public List<Nguoidung> getNguoiDungBySoDienThoai(String dienthoai) {
		
		return nguoiDungdaoImpl.getNguoiDungBySoDienThoai(dienthoai);
	}

	public List<Nguoidung> getNguoiDungByEmail(String email){
		
		return nguoiDungdaoImpl.getNguoiDungByEmail(email);
	}

	public void UpdateNguoiDung(Nguoidung nguoiDung) {
		nguoiDungdaoImpl.UpdateNguoiDung(nguoiDung);
		
	}

	
}

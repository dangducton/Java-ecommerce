package com.dangducton.service;

import java.util.List;

import com.dangducton.entity.Nguoidung;

public interface NguoidungService {
	public Nguoidung getNguoiDungById(Integer iduser);
	
	public Nguoidung getNguoidungLogin(String tendangnhap, String matkhau);
	
	public void AddNguoiDung(Nguoidung nguoiDung);
	
	public List<Nguoidung> listNguoiDung();

    public List<Nguoidung> getNguoiDungByTenDangNhap(String tendangnhap);
	
	public List<Nguoidung> getNguoiDungBySoDienThoai(String dienthoai);
	
	public List<Nguoidung> getNguoiDungByEmail(String email);
	
	public void UpdateNguoiDung(Nguoidung nguoiDung);
}

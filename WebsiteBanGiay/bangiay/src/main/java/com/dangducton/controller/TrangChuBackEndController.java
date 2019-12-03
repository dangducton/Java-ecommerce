package com.dangducton.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dangducton.entity.Chitiethoadon;
import com.dangducton.entity.Hoadon;
import com.dangducton.entity.Userrole;
import com.dangducton.service.ChiTietHoaDonServiceImpl;
import com.dangducton.service.DanhMucServiceImpl;
import com.dangducton.service.HoaDonServiceImpl;
import com.dangducton.service.MauSanPhamServiceImpl;
import com.dangducton.service.NguoidungServiceImpl;
import com.dangducton.service.NhapChiTietSanPhamServiceImpl;
import com.dangducton.service.SanPhamServiceImpl;
import com.dangducton.service.UserroleServiceImpl;

@Controller
public class TrangChuBackEndController {
	@Autowired
	DanhMucServiceImpl danhMucServiceImpl;

	@Autowired
	MauSanPhamServiceImpl mauSanPhamServiceImpl;

	@Autowired
	SanPhamServiceImpl sanPhamServiceImpl;

	@Autowired
	UserroleServiceImpl userRoleServiceImpl;
	
	@Autowired
	NguoidungServiceImpl nguoidungServiceImpl;
	
	@Autowired
	HoaDonServiceImpl hoaDonServiceImpl;
	
	@Autowired
	ChiTietHoaDonServiceImpl chiTietHoaDonServiceImpl;
	
	@Autowired
	NhapChiTietSanPhamServiceImpl nhapChiTietSanPhamServiceImpl;
	
	@RequestMapping("/admin")
	public String TrangChu(Model model, HttpSession session) {
		Integer nguoiDung = (Integer) session.getAttribute("id");
		if (nguoiDung == null) {
			model.addAttribute("title", "Đăng nhập");
			model.addAttribute("yeucaudangnhap", "Xin vui lòng đăng nhập");
			return "fontend/login";
		}
		if (nguoiDung != null) {
			Userrole userRole = userRoleServiceImpl.getUserById(nguoiDung);
			session.setAttribute("idrole", userRole.getIdrode().getId());
			int myName = (Integer) session.getAttribute("idrole");
			
			if (myName == 1) {			
				double tongThuNhap  = 0;
				List<Chitiethoadon> list = chiTietHoaDonServiceImpl.TongThuNhap();
				for(int i = 0; i < list.size(); i ++) {
					tongThuNhap = tongThuNhap + (list.get(i).getSoluong() * (list.get(i).getIdsanpham().getGiakhuyenmai() - list.get(i).getIdsanpham().getGiagoc()));
				}
				
				model.addAttribute("title", "Trang chủ quản lý WebSite");
				model.addAttribute("tongThuNhap", tongThuNhap);
				model.addAttribute("tongDonHang", hoaDonServiceImpl.tongDonHang().size());
				model.addAttribute("tongNguoiDung", nguoidungServiceImpl.listNguoiDung().size());
				model.addAttribute("tongSanPham", sanPhamServiceImpl.findAll().size());
				model.addAttribute("danhSachDonHangMoi", hoaDonServiceImpl.findAllHoaDonChuaXacDinh());
				model.addAttribute("soDonHangMoi", hoaDonServiceImpl.findAllHoaDonChuaXacDinh().size());
				model.addAttribute("sanPhamSapHet", nhapChiTietSanPhamServiceImpl.SanPhamSapHetLimit10());
				model.addAttribute("soSanPhamSapHet", nhapChiTietSanPhamServiceImpl.SanPhamSapHetLimit10().size());
				
				return "admin/home";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
}
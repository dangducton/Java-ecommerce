package com.dangducton.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Nguoidung;
import com.dangducton.entity.Userrole;
import com.dangducton.service.ChiTietHoaDonServiceImpl;
import com.dangducton.service.HoaDonServiceImpl;
import com.dangducton.service.NguoidungServiceImpl;
import com.dangducton.service.NhapChiTietSanPhamServiceImpl;
import com.dangducton.service.SanPhamServiceImpl;
import com.dangducton.service.UserroleServiceImpl;

@Controller
public class LoginFrontEndController {
	@Autowired
	NguoidungServiceImpl nguoiDungServiceImpl;
	
	@Autowired
	SanPhamServiceImpl sanPhamServiceImpl;
	
	@Autowired
	UserroleServiceImpl userRoleServiceImpl;
	
	@Autowired
	ChiTietHoaDonServiceImpl chiTietHoaDonServiceImpl;
	
	@Autowired
	NhapChiTietSanPhamServiceImpl nhapChiTietSanPhamServiceImpl;
	
	@Autowired
	HoaDonServiceImpl hoaDonServiceImpl;
	
	@RequestMapping(value="/pageLogin")
	public String GioHang(Model model) {
		model.addAttribute("title", "Đăng nhập");
		return "fontend/login";
		
	}
	
	@RequestMapping(value="/logout")
	public String Logout(Model model,
		   HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		model.addAttribute("title", "Đăng nhập");
		return "fontend/login";
		
	}
	@RequestMapping(value="/pageDangKy")
	public String PageDangKy(Model model) {
		model.addAttribute("title", "Đăng ký");
		return "fontend/dangky";
		
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String GioHang(HttpServletRequest request,
			@RequestParam(name="tendangnhap") String tenDangNhap,
			@RequestParam(name="matkhau") String matKhau, 
			Model model) {
		int doDaiTenDangNhap = tenDangNhap.length();
		int doDaiMatKhau = matKhau.length();
		Nguoidung nguoidung = nguoiDungServiceImpl.getNguoidungLogin(tenDangNhap, matKhau);
		
		
		if(doDaiMatKhau == 0 && doDaiTenDangNhap == 0) {
			model.addAttribute("falsetendangnhap", "Yêu cầu nhập tên tài khoản");
			model.addAttribute("falsematkhau", "Yêu cầu nhập mật khẩu");
			model.addAttribute("title", "Đăng nhập");
			return "fontend/login";
		}
		if(doDaiTenDangNhap == 0) {
			model.addAttribute("falsetendangnhap", "Yêu cầu nhập tên tài khoản");
			model.addAttribute("title", "Đăng nhập");
			return "fontend/login";
		}
		if(doDaiMatKhau == 0) {
			model.addAttribute("falsematkhau", "Yêu cầu nhập mật khẩu");
			model.addAttribute("title", "Đăng nhập");
			return "fontend/login";
		}
		if(nguoidung == null) {
			model.addAttribute("loginfalse", "Tài khoản và mật khẩu không tồn tại");
			model.addAttribute("title", "Đăng nhập");
			return "fontend/login";
		}if(nguoidung != null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", nguoidung.getIduser());
			
			session.setAttribute("tennguoidung", nguoidung.getTenuser());
			
			session.setAttribute("gioHangSession", chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoidung.getIduser()));
			
			session.setAttribute("soluonggiohang", chiTietHoaDonServiceImpl.getCountAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoidung.getIduser()));
			
			Userrole userRole = userRoleServiceImpl.getUserById(nguoidung.getIduser());
			
			session.setAttribute("idrole", userRole.getIdrode().getId());
			
			session.setAttribute("userRole", userRole);
			
			int myName =(Integer)session.getAttribute("idrole");
			
			if(myName == 1) {
				session.setAttribute("admin", nguoiDungServiceImpl.getNguoidungLogin(tenDangNhap, matKhau));
				session.setAttribute("quanTriWeb", "Quản trị WebSite");
				session.setAttribute("thongTinTaiKhoan", "Thông tin tài khoản");
				session.setAttribute("listSanPhamSapHet", nhapChiTietSanPhamServiceImpl.SanPhamSapHetLimit10());
				session.setAttribute("soSanPhamSapHet", nhapChiTietSanPhamServiceImpl.SanPhamSapHetLimit10().size());
				session.setAttribute("listHoaDonChuaXacDinh", hoaDonServiceImpl.findAllHoaDonChuaXacDinh());
				session.setAttribute("soHoaDonChuaXacDinh", hoaDonServiceImpl.findAllHoaDonChuaXacDinh().size());
			
			}if(myName == 2) {
				session.setAttribute("thongTinTaiKhoan", "Thông tin tài khoản");
			}
			
			model.addAttribute("title", "Giày Nam BôniTôni");
			model.addAttribute("giaysneaker", sanPhamServiceImpl.getProductDetail(1));
			model.addAttribute("giayluoi", sanPhamServiceImpl.getProductDetail(2));
			model.addAttribute("giaytay", sanPhamServiceImpl.getProductDetail(3));
			
			return "fontend/home";
		}else {
			return "fontend/login";
		}
	}
}


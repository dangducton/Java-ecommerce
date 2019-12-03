package com.dangducton.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Hoadon;
import com.dangducton.entity.Userrole;
import com.dangducton.service.ChiTietHoaDonServiceImpl;
import com.dangducton.service.HoaDonServiceImpl;
import com.dangducton.service.NhapChiTietSanPhamServiceImpl;
import com.dangducton.service.UserroleServiceImpl;

@Controller
@RequestMapping(value = "/admin")
public class HoaDonBackEndController {
	@Autowired
	UserroleServiceImpl userRoleServiceImpl;
	
	@Autowired
	HoaDonServiceImpl hoaDonServiceImpl;
	
	@Autowired
	ChiTietHoaDonServiceImpl chiTietHoaDonServiceImpl;
	
	@Autowired
	NhapChiTietSanPhamServiceImpl nhapChiTietSanPhamServiceImpl;
	
		@RequestMapping("/danhSachHoaDon")
		public String KiemTraTonKho(Model model, HttpSession session,Integer offset, Integer maxResult) {
		
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
				model.addAttribute("title", "Danh sách hóa đơn");
				model.addAttribute("listHoaDon", hoaDonServiceImpl.findAllHoaDon(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", hoaDonServiceImpl.findAllHoaDon().size());
				return "admin/danhsachhoadon";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
		@RequestMapping("/updateHoaDon1")
		public String UpdateDonHang1(@RequestParam("idHoaDon") int idHoaDon,Model model, HttpSession session,Integer offset, Integer maxResult) {
		
		Integer nguoiDung = (Integer) session.getAttribute("id");

		if (nguoiDung == null) {
			model.addAttribute("title", "Đăng nhập");
			model.addAttribute("yeucaudangnhap", "Xin vui lòng đăng nhập");
			return "fontend/login";
		}
		if (nguoiDung != null) {
			int myName = (Integer) session.getAttribute("idrole");

			if (myName == 1) {
				
				model.addAttribute("title", "Danh sách hóa đơn");
				Hoadon hd = hoaDonServiceImpl.getHoaDonByID(idHoaDon);
				hd.setStatus(1);
				hoaDonServiceImpl.UpDateHoaDon(hd);
				
				model.addAttribute("listHoaDon", hoaDonServiceImpl.findAllHoaDon(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", hoaDonServiceImpl.findAllHoaDon().size());
				model.addAttribute("status", "Xác nhận đơn hàng thành công");
				
				session.removeAttribute("listSanPhamSapHet");
				session.removeAttribute("soSanPhamSapHet");
				session.removeAttribute("listHoaDonChuaXacDinh");
				session.removeAttribute("soHoaDonChuaXacDinh");
				session.setAttribute("listSanPhamSapHet", nhapChiTietSanPhamServiceImpl.SanPhamSapHetLimit10());
				session.setAttribute("soSanPhamSapHet", nhapChiTietSanPhamServiceImpl.SanPhamSapHetLimit10().size());
				session.setAttribute("listHoaDonChuaXacDinh", hoaDonServiceImpl.findAllHoaDonChuaXacDinh());
				session.setAttribute("soHoaDonChuaXacDinh", hoaDonServiceImpl.findAllHoaDonChuaXacDinh().size());
				
				
				
				return "admin/danhsachhoadon";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
		@RequestMapping("/updateHoaDon2")
		public String UpdateDonHang2(@RequestParam("idHoaDon") int idHoaDon,Model model, HttpSession session,Integer offset, Integer maxResult) {
		
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
				model.addAttribute("title", "Danh sách hóa đơn");
				Hoadon hd = hoaDonServiceImpl.getHoaDonByID(idHoaDon);
				hd.setStatus(2);
				hoaDonServiceImpl.UpDateHoaDon(hd);
				
				model.addAttribute("listHoaDon", hoaDonServiceImpl.findAllHoaDon(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", hoaDonServiceImpl.findAllHoaDon().size());
				model.addAttribute("status", "Xác nhận đơn hàng thành công");
				
				session.removeAttribute("listSanPhamSapHet");
				session.removeAttribute("soSanPhamSapHet");
				session.removeAttribute("listHoaDonChuaXacDinh");
				session.removeAttribute("soHoaDonChuaXacDinh");
				session.setAttribute("listSanPhamSapHet", nhapChiTietSanPhamServiceImpl.SanPhamSapHetLimit10());
				session.setAttribute("soSanPhamSapHet", nhapChiTietSanPhamServiceImpl.SanPhamSapHetLimit10().size());
				session.setAttribute("listHoaDonChuaXacDinh", hoaDonServiceImpl.findAllHoaDonChuaXacDinh());
				session.setAttribute("soHoaDonChuaXacDinh", hoaDonServiceImpl.findAllHoaDonChuaXacDinh().size());
				
				return "admin/danhsachhoadon";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
		
		@RequestMapping("/chiTietHoaDon")
		public String ChiTietHoaDon(@RequestParam("hoaDonId") int hoaDonId, Model model, HttpSession session,Integer offset, Integer maxResult) {
		
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
				model.addAttribute("title", "Chi tiết hóa đơn");
				model.addAttribute("listHoaDon", chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoId(hoaDonId));
				model.addAttribute("hoaDon", hoaDonServiceImpl.getHoaDonByID(hoaDonId));
		
				return "admin/chitiethoadon";
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

package com.dangducton.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Nhapchitietsanpham;
import com.dangducton.entity.Userrole;
import com.dangducton.service.HoaDonServiceImpl;
import com.dangducton.service.NhapChiTietSanPhamServiceImpl;
import com.dangducton.service.SizeSanPhamServiceImpl;
import com.dangducton.service.UserroleServiceImpl;

@Controller
@RequestMapping(value = "/admin")
public class DanhSachNhapChiTietBackEndController {
	@Autowired
	UserroleServiceImpl userRoleServiceImpl;
	
	@Autowired
	NhapChiTietSanPhamServiceImpl nhapChiTietSanPhamServiceImpl;
	
	@Autowired
	SizeSanPhamServiceImpl sizeSanPhamServiceImpl;
	
	@Autowired
	HoaDonServiceImpl hoaDonServiceImpl;
	
	@RequestMapping("/kiemTraTonKho")
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
				model.addAttribute("title", "Kiểm tra tồn kho");
				model.addAttribute("listTonKho", nhapChiTietSanPhamServiceImpl.kiemTraTonKho(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", nhapChiTietSanPhamServiceImpl.kiemTraTonKho().size());
				return "admin/kiemtratonkho";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
	
	
	@RequestMapping("/danhSachNhapChiTiet")
	public String DanhSachNhap(Model model, HttpSession session,Integer offset, Integer maxResult) {
		
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
				model.addAttribute("title", "Danh sách nhập");
				model.addAttribute("listNhap", nhapChiTietSanPhamServiceImpl.getAllNhapChiTietSanPham(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", nhapChiTietSanPhamServiceImpl.getAllNhapChiTietSanPham().size());
				return "admin/danhsachnhapchitiet";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
	
	@RequestMapping("/tongnhapchitiet")
	public String TongNhapChiTiet(Model model, HttpSession session,Integer offset, Integer maxResult) {
		
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
				model.addAttribute("title", "Danh sách nhập");
				model.addAttribute("listNhap", nhapChiTietSanPhamServiceImpl.tongNhapChiTiet(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", nhapChiTietSanPhamServiceImpl.tongNhapChiTiet().size());
				return "admin/tongnhapchitiet";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
	
	@RequestMapping("/updateNhapChiTiet")
	public String updateNhapChiTiet(@RequestParam("nhapId") int nhapId,Model model, HttpSession session,Integer offset, Integer maxResult) {
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
				model.addAttribute("title", "Update nhập chi tiết");
				model.addAttribute("nhapChitiet",  nhapChiTietSanPhamServiceImpl.getNhapChiTietSanPhamById(nhapId));
				model.addAttribute("listSize", sizeSanPhamServiceImpl.getAllSizeSanPham());
				return "admin/updateNhapChiTiet";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
	
	@RequestMapping("/updateNhapChiTietSanPham")
	public String UpdateNhapChiTietSanPham(@RequestParam("idNhap") int nhapId,
			@RequestParam("soluong") int soLuong,
			@RequestParam("size") int size,
			Model model, HttpSession session,
			Integer offset, Integer maxResult) {
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
				Nhapchitietsanpham n = nhapChiTietSanPhamServiceImpl.getNhapChiTietSanPhamById(nhapId);
				n.setIdsize(sizeSanPhamServiceImpl.getIdByIdSize(size));
				n.setSoluong(soLuong);
				nhapChiTietSanPhamServiceImpl.upDateNhapChiTietSanPham(n);
				
				model.addAttribute("title", "Danh sách nhập");
				model.addAttribute("status", "Cập nhật thành công");
				model.addAttribute("listNhap", nhapChiTietSanPhamServiceImpl.getAllNhapChiTietSanPham(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", nhapChiTietSanPhamServiceImpl.getAllNhapChiTietSanPham().size());
				
				session.removeAttribute("listSanPhamSapHet");
				session.removeAttribute("soSanPhamSapHet");
				session.removeAttribute("listHoaDonChuaXacDinh");
				session.removeAttribute("soHoaDonChuaXacDinh");
				session.setAttribute("listSanPhamSapHet", nhapChiTietSanPhamServiceImpl.SanPhamSapHetLimit10());
				session.setAttribute("soSanPhamSapHet", nhapChiTietSanPhamServiceImpl.SanPhamSapHetLimit10().size());
				session.setAttribute("listHoaDonChuaXacDinh", hoaDonServiceImpl.findAllHoaDonChuaXacDinh());
				session.setAttribute("soHoaDonChuaXacDinh", hoaDonServiceImpl.findAllHoaDonChuaXacDinh().size());
				
				
				return "admin/danhsachnhapchitiet";
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

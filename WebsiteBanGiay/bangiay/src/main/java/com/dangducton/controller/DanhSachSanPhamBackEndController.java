package com.dangducton.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Sanpham;
import com.dangducton.entity.Userrole;
import com.dangducton.service.DanhMucServiceImpl;
import com.dangducton.service.MauSanPhamServiceImpl;
import com.dangducton.service.SanPhamServiceImpl;
import com.dangducton.service.SizeSanPhamServiceImpl;
import com.dangducton.service.UserroleServiceImpl;

@Controller
@RequestMapping(value = "/admin")
public class DanhSachSanPhamBackEndController {

	@Autowired
	SanPhamServiceImpl sanPhamServiceImpl;

	@Autowired
	SizeSanPhamServiceImpl sizeSanPhamServiceImpl;

	@Autowired
	MauSanPhamServiceImpl mauSanPhamServiceImpl;

	@Autowired
	DanhMucServiceImpl danhMucServiceImpl;

	@Autowired
	UserroleServiceImpl userRoleServiceImpl;

	@RequestMapping(value = "/danhsachsanpham", method = RequestMethod.GET)
	public String findAll(Model model, Integer offset, Integer maxResult, HttpSession session) {
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
				List<Sanpham> list = sanPhamServiceImpl.findAll(offset, maxResult);
				model.addAttribute("title", "Danh sách sản phẩm");
				model.addAttribute("listDanhMuc", danhMucServiceImpl.getAllDanhMucs());
				model.addAttribute("listMauSanPham", mauSanPhamServiceImpl.getAllMauSanPhams());
				model.addAttribute("listStu", list);
				model.addAttribute("offset", offset);
				model.addAttribute("count", sanPhamServiceImpl.getTotal());
				return "admin/danhsachsanpham";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}
		return "fontend/403";
	}

	@RequestMapping("/sanphammausac")
	public String DanhSachSanPhamMauSac(@RequestParam("mauSacId") int maMauSac, Model model, Integer offset,
			Integer maxResult, HttpSession session) {

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
				List<Sanpham> list = new ArrayList<com.dangducton.entity.Sanpham>();
				long count = 0;
				if (maMauSac == 0) {
					model.addAttribute("title", "Tất cả sản phẩm");
					list = sanPhamServiceImpl.findAll(offset, maxResult);
					count = sanPhamServiceImpl.getTotal();
				} else {
					list = sanPhamServiceImpl.getProductDetailSanPhamTheoMauSac(maMauSac, offset, maxResult);
					if (list != null && list.size() > 0)
						model.addAttribute("mauSac", list.get(0).getIdmausanpham().getTenmau());
					count = sanPhamServiceImpl.getProductDetailMauSac(maMauSac).size();
				}
				model.addAttribute("count", count);
				model.addAttribute("title", "Danh sách sản phẩm theo màu sắc");
				model.addAttribute("listDanhMuc", danhMucServiceImpl.getAllDanhMucs());
				model.addAttribute("listMauSanPham", mauSanPhamServiceImpl.getAllMauSanPhams());
				model.addAttribute("listStu", list);
				model.addAttribute("offset", offset);
				model.addAttribute("maMauSac", maMauSac);
				return "admin/sanphamtheomausac";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "fontend/403";
	}

	@RequestMapping(value = "/sanphamdanhmuc", method = RequestMethod.GET)
	public String theoDanhMuc(@RequestParam("danhMucId") int maDanhMuc, Model model, Integer offset, Integer maxResult,
			HttpSession session) {
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
				List<Sanpham> list = new ArrayList<com.dangducton.entity.Sanpham>();
				long count = 0;

				if (maDanhMuc == 0) {
					model.addAttribute("title", "Tất cả sản phẩm");
					list = sanPhamServiceImpl.findAll(offset, maxResult);
					count = sanPhamServiceImpl.getTotal();
				} else {
					list = sanPhamServiceImpl.getProductDetailSanPhamTheoDanhMuc(maDanhMuc, offset, maxResult);
					if (list != null && list.size() > 0)
						model.addAttribute("danhMuc",list.get(0).getIddanhmuc().getTendanhmuc());
					count = sanPhamServiceImpl.getProductDetailTheoDanhMuc(maDanhMuc).size();
				}
				model.addAttribute("count", count);
				model.addAttribute("title", "Danh sách sản phẩm theo danh mục");
				model.addAttribute("listDanhMuc", danhMucServiceImpl.getAllDanhMucs());
				model.addAttribute("listMauSanPham", mauSanPhamServiceImpl.getAllMauSanPhams());
				model.addAttribute("listStu", list);
				model.addAttribute("offset", offset);
				model.addAttribute("maDanhMuc", maDanhMuc);
				return "admin/sanphamtheodanhmuc";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}
		return "fontend/403";
	}

	@RequestMapping(value = "/nhapchitietsanpham", method = RequestMethod.GET)
	public String nhapChiTiet(@RequestParam("proId") Integer proId, Model model, HttpSession session) {
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
				model.addAttribute("title", "Nhập chi tiết");
				model.addAttribute("listSize", sizeSanPhamServiceImpl.getAllSizeSanPham());
				model.addAttribute("product", sanPhamServiceImpl.getProductById(proId));
				return "admin/nhapchitiet";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}
		return "fontend/403";

	}

}

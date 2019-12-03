package com.dangducton.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.dangducton.entity.Nhapchitietsanpham;
import com.dangducton.entity.Sanpham;
import com.dangducton.entity.Sizesanpham;
import com.dangducton.entity.Userrole;
import com.dangducton.service.HoaDonServiceImpl;
import com.dangducton.service.NhapChiTietSanPhamServiceImpl;
import com.dangducton.service.SanPhamServiceImpl;
import com.dangducton.service.SizeSanPhamServiceImpl;
import com.dangducton.service.UserroleServiceImpl;

@Controller
@RequestMapping(value="/admin")
public class NhapChiTietSanPhamBackEndController {
	
	@Autowired
	NhapChiTietSanPhamServiceImpl nhapChiTietSanPhamServiceImpl;
	
	@Autowired
	SanPhamServiceImpl sanPhamServiceImpl;
	
	@Autowired
	UserroleServiceImpl userRoleServiceImpl;
	
	@Autowired
	SizeSanPhamServiceImpl sizeSanPhamServiceImpl;
	
	@Autowired
	HoaDonServiceImpl hoaDonServiceImpl;
	
	@RequestMapping(value="/nhapchitietsanpham", method = RequestMethod.POST)
	public String findAll(HttpServletRequest request,
			@RequestParam(name="idsanpham") int idsanpham,
			@RequestParam(name="size") int idsize,
			@RequestParam(name="soluong") int soluong, Model model, Integer offset, Integer maxResult,HttpSession session) {
			
		Sanpham sp = new Sanpham();
		sp.setIdsanpham(idsanpham);
		Sizesanpham ssp = new Sizesanpham();
		ssp.setIdsizesanpham(idsize);
		
		Nhapchitietsanpham nctsp = new 	Nhapchitietsanpham();
		nctsp.setIdsanpham(sp);
		nctsp.setIdsize(ssp);
		nctsp.setSoluong(soluong);
		nhapChiTietSanPhamServiceImpl.addNhapChiTietSanPham(nctsp);
		
		
		List<Sanpham> list = sanPhamServiceImpl.findAll(offset, maxResult);
		model.addAttribute("title", "Danh sách sản phẩm");
		model.addAttribute("listStu", list);
        model.addAttribute("offset", offset);
        model.addAttribute("count", sanPhamServiceImpl.getTotal());	
        
		session.removeAttribute("listSanPhamSapHet");
		session.removeAttribute("soSanPhamSapHet");
		session.removeAttribute("listHoaDonChuaXacDinh");
		session.removeAttribute("soHoaDonChuaXacDinh");
		session.setAttribute("listSanPhamSapHet", nhapChiTietSanPhamServiceImpl.SanPhamSapHetLimit10());
		session.setAttribute("soSanPhamSapHet", nhapChiTietSanPhamServiceImpl.SanPhamSapHetLimit10().size());
		session.setAttribute("listHoaDonChuaXacDinh", hoaDonServiceImpl.findAllHoaDonChuaXacDinh());
		session.setAttribute("soHoaDonChuaXacDinh", hoaDonServiceImpl.findAllHoaDonChuaXacDinh().size());
		
        return "admin/danhsachsanpham";
		
	}
	
	@RequestMapping(value="/nhapThemSanPham")
	public String NhapThemSanPham(@RequestParam("idSanpham") Integer proId,@RequestParam("tenSize") String tenSize, Model model, HttpSession session) {
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
				model.addAttribute("size", sizeSanPhamServiceImpl.getIdByTenSize(tenSize));
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

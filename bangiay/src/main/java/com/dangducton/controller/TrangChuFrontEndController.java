package com.dangducton.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.dangducton.service.ChiTietHoaDonServiceImpl;
import com.dangducton.service.CommentServiceImpl;
import com.dangducton.service.DanhMucServiceImpl;
import com.dangducton.service.MauSanPhamServiceImpl;
import com.dangducton.service.NhapChiTietSanPhamServiceImpl;
import com.dangducton.service.SanPhamServiceImpl;
import com.dangducton.service.SizeSanPhamServiceImpl;

@Controller
public class TrangChuFrontEndController {
	@Autowired
	SanPhamServiceImpl sanPhamServiceImpl;
			
	@RequestMapping("/")
	public String TrangChu(Model model) {
		model.addAttribute("title", "Giày Nam BôniTôni");
		model.addAttribute("giaysneaker", sanPhamServiceImpl.getProductDetail(1));
		model.addAttribute("giayluoi", sanPhamServiceImpl.getProductDetail(2));
		model.addAttribute("giaytay", sanPhamServiceImpl.getProductDetail(3));
		
		return "fontend/home";
	}
	
			
	@RequestMapping("/403")
	public String Page403(Model model) {
		model.addAttribute("title", "Không tìm thấy trang yêu cầu");
		return "fontend/403";
		
	}
		
}

			

package com.dangducton.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Sanpham;
import com.dangducton.service.DanhMucServiceImpl;
import com.dangducton.service.MauSanPhamServiceImpl;
import com.dangducton.service.SanPhamServiceImpl;

@Controller
public class TimKiemFrontEndController {
	@Autowired
	SanPhamServiceImpl sanPhamServiceImpl;
	
	@Autowired
	DanhMucServiceImpl danhMucServiceImpl;
	
	@Autowired
	MauSanPhamServiceImpl mauSanPhamServiceImpl;
	
	@RequestMapping("/timKiemTatCa")
	public String TimKiemTatCa(HttpServletRequest request, Model model, Integer offset, Integer maxResult) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String sanpham = request.getParameter("noiDungTimKiem");

		List<Sanpham> listSP = sanPhamServiceImpl.timKiemTatCaTheoTen(sanpham, offset, maxResult);
		model.addAttribute("listProduct", listSP);
        model.addAttribute("offset", offset);
        model.addAttribute("count", sanPhamServiceImpl.timKiemTatCaTheoTen(sanpham).size());
        model.addAttribute("productdetaildanhmuc",sanPhamServiceImpl.sanPhamMoiNhat());
        model.addAttribute("anonymousName", 4);
        model.addAttribute("danhmuc",danhMucServiceImpl.getAllDanhMucs());
        model.addAttribute("mausac",mauSanPhamServiceImpl.getAllMauSanPhams());
        model.addAttribute("title", "Có "+ sanPhamServiceImpl.timKiemTatCaTheoTen(sanpham).size() +" sản phẩm");
        model.addAttribute("noidungtimkiem", sanpham);
		
		return "fontend/danhsachsanpham";
	}

	
	@RequestMapping("/timKiemSanPhamTheoGia")
	public String TimKiemTheoGia(HttpServletRequest request, @RequestParam(name="giaBatDau") Double giaBatDau, @RequestParam(name="giaKetThuc") Double giaKetThuc, Model model, Integer offset, Integer maxResult) {

		List<Sanpham> listSP = sanPhamServiceImpl.timKiemGiaTheoTen(giaBatDau, giaKetThuc, offset, maxResult);
		model.addAttribute("listProduct", listSP);
        model.addAttribute("offset", offset);
        model.addAttribute("count", sanPhamServiceImpl.timKiemGiaTheoTen(giaBatDau, giaKetThuc).size());
        model.addAttribute("productdetaildanhmuc",sanPhamServiceImpl.sanPhamMoiNhat());
        model.addAttribute("anonymousName", 5);
        model.addAttribute("danhmuc",danhMucServiceImpl.getAllDanhMucs());
        model.addAttribute("mausac",mauSanPhamServiceImpl.getAllMauSanPhams());
        model.addAttribute("title", "Có " +sanPhamServiceImpl.timKiemGiaTheoTen(giaBatDau, giaKetThuc).size() +" sản phẩm");
        model.addAttribute("giaBatDau", giaBatDau);
        model.addAttribute("giaKetThuc", giaKetThuc);
		
		return "fontend/danhsachsanpham";
	}
}

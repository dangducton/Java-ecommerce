package com.dangducton.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Sanpham;
import com.dangducton.service.ChiTietHoaDonServiceImpl;
import com.dangducton.service.CommentServiceImpl;
import com.dangducton.service.DanhMucServiceImpl;
import com.dangducton.service.MauSanPhamServiceImpl;
import com.dangducton.service.NhapChiTietSanPhamServiceImpl;
import com.dangducton.service.SanPhamServiceImpl;
import com.dangducton.service.SizeSanPhamServiceImpl;

@Controller
public class DanhSachSanPhamFrontEnd {
	@Autowired
	SanPhamServiceImpl sanPhamServiceImpl;
	
	@Autowired
	CommentServiceImpl commentServiceImpl;
	
	@Autowired
	DanhMucServiceImpl danhMucServiceImpl;
	
	@Autowired
	MauSanPhamServiceImpl mauSanPhamServiceImpl;
	
	@Autowired
	SizeSanPhamServiceImpl sizeSanPhamServiceImpl;
	
	@Autowired
	NhapChiTietSanPhamServiceImpl nhapChiTietSanPhamServiceImpl;
	
	@Autowired
	ChiTietHoaDonServiceImpl chiTietHoaDonServiceImpl;
	
	@RequestMapping("/danhsachsanpham")
	public String DanhSachSanPham(Model model,Integer offset, Integer maxResult) {
		List<Sanpham> list = sanPhamServiceImpl.findAll(offset, maxResult);
		model.addAttribute("title", "Danh sách sản phẩm");
		model.addAttribute("listProduct", list);
        model.addAttribute("offset", offset);
        model.addAttribute("anonymousName", 1);
        model.addAttribute("count", sanPhamServiceImpl.getTotal());
        model.addAttribute("productdetaildanhmuc",sanPhamServiceImpl.sanPhamMoiNhat());
        model.addAttribute("danhmuc",danhMucServiceImpl.getAllDanhMucs());
        model.addAttribute("mausac",mauSanPhamServiceImpl.getAllMauSanPhams());
        
        return "fontend/danhsachsanpham";
		
		
	}
	
	@RequestMapping("/sanphamdanhmuc")
	public String DanhSachSanPhamDanhMuc(@RequestParam("danhMucId") int maDM,Model model,Integer offset, Integer maxResult) {
		
		List<Sanpham> list = new ArrayList<com.dangducton.entity.Sanpham>();
		long count = 0;
		
		if (maDM == 0) {
			model.addAttribute("title", "Tất cả sản phẩm");
			list = sanPhamServiceImpl.findAll(offset, maxResult);
			count = sanPhamServiceImpl.getTotal();
		} else {
			list = sanPhamServiceImpl.getProductDetailSanPhamTheoDanhMuc(maDM, offset, maxResult);
			if(list!=null && list.size()>0)
				model.addAttribute("title", list.get(0).getIddanhmuc().getTendanhmuc());
			count = sanPhamServiceImpl.getProductDetailTheoDanhMuc(maDM).size();
		}
		model.addAttribute("madanhmuc", maDM);
		model.addAttribute("listProduct", list);
        model.addAttribute("offset", offset);
        model.addAttribute("count", count);
        model.addAttribute("anonymousName", 2);
        model.addAttribute("productdetaildanhmuc",sanPhamServiceImpl.sanPhamMoiNhat());
        model.addAttribute("danhmuc",danhMucServiceImpl.getAllDanhMucs());
        model.addAttribute("mausac",mauSanPhamServiceImpl.getAllMauSanPhams());
        model.addAttribute("danhMucId", maDM);
        
        return "fontend/danhsachsanpham";
	
	}
	@RequestMapping("/sanphammausac")
	public String DanhSachSanPhamMauSac(@RequestParam("mauSacId") int maMauSac,Model model,Integer offset, Integer maxResult) {
		
		List<Sanpham> list = new ArrayList<com.dangducton.entity.Sanpham>();
		long count = 0;
		
		if (maMauSac == 0) {
			model.addAttribute("title", "Tất cả sản phẩm");
			list = sanPhamServiceImpl.findAll(offset, maxResult);
			count = sanPhamServiceImpl.getTotal();
		} else {
			list = sanPhamServiceImpl.getProductDetailSanPhamTheoMauSac(maMauSac, offset, maxResult);
			if(list!=null && list.size()>0)
				model.addAttribute("title", "Giày Màu "+list.get(0).getIdmausanpham().getTenmau());
			count = sanPhamServiceImpl.getProductDetailMauSac(maMauSac).size();
		}
		model.addAttribute("mamausac", maMauSac);
		model.addAttribute("listProduct", list);
        model.addAttribute("offset", offset);
        model.addAttribute("count", count);
        model.addAttribute("anonymousName", 3);
        model.addAttribute("productdetaildanhmuc",sanPhamServiceImpl.sanPhamMoiNhat());
        model.addAttribute("danhmuc",danhMucServiceImpl.getAllDanhMucs());
        model.addAttribute("mausac",mauSanPhamServiceImpl.getAllMauSanPhams());
        model.addAttribute("mauSacId", maMauSac);
        
        return "fontend/danhsachsanpham";
		
	}
}

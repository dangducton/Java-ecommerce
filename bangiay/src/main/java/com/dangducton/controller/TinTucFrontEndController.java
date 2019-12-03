package com.dangducton.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Sanpham;
import com.dangducton.entity.Tintuc;
import com.dangducton.service.DanhMucServiceImpl;
import com.dangducton.service.MauSanPhamServiceImpl;
import com.dangducton.service.SanPhamServiceImpl;
import com.dangducton.service.TinTucServiceImpl;

@Controller
public class TinTucFrontEndController {
	@Autowired
	SanPhamServiceImpl sanPhamServiceImpl;
	
	@Autowired
	DanhMucServiceImpl danhMucServiceImpl;
	
	@Autowired
	MauSanPhamServiceImpl mauSanPhamServiceImpl;
	
	@Autowired
	TinTucServiceImpl tinTucServiceImpl;
	
	
	@RequestMapping("/danhsachtintuc")
	public String DanhSachSanPham(Model model,Integer offset, Integer maxResult) {
		List<Tintuc> list = tinTucServiceImpl.findTinTucFrontEnd(offset, maxResult);
		model.addAttribute("title", "Danh sách tin tức");
		model.addAttribute("listTinTuc", list);
        model.addAttribute("offset", offset);
        model.addAttribute("count", tinTucServiceImpl.findTinTucFrontEnd().size());
        model.addAttribute("productdetaildanhmuc",sanPhamServiceImpl.sanPhamMoiNhat());
        model.addAttribute("danhmuc",danhMucServiceImpl.getAllDanhMucs());
        model.addAttribute("mausac",mauSanPhamServiceImpl.getAllMauSanPhams());
        
        return "fontend/danhsachtintuc";
	}
	
	
	@RequestMapping("/tintuc")
	public String TinTuc(Model model,@RequestParam("tinTucId") int idTinTuc) {
		model.addAttribute("title", "Danh sách sản phẩm");
	    model.addAttribute("productdetaildanhmuc",sanPhamServiceImpl.sanPhamMoiNhat());
	    model.addAttribute("danhmuc",danhMucServiceImpl.getAllDanhMucs());
	    model.addAttribute("mausac",mauSanPhamServiceImpl.getAllMauSanPhams());
		model.addAttribute("tintuc", tinTucServiceImpl.getTinTucById(idTinTuc));

		return "fontend/tintuc";
	}
}

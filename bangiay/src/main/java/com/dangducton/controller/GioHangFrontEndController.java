package com.dangducton.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Chitiethoadon;
import com.dangducton.entity.Sanpham;
import com.dangducton.entity.Sizesanpham;
import com.dangducton.service.ChiTietHoaDonServiceImpl;
import com.dangducton.service.NguoidungServiceImpl;
import com.dangducton.service.SanPhamServiceImpl;
import com.dangducton.service.SizeSanPhamServiceImpl;

@Controller
public class GioHangFrontEndController {
	
	@Autowired
	SizeSanPhamServiceImpl sizeSanPhamServiceImpl;
	
	@Autowired
	SanPhamServiceImpl sanPhamServiceImpl;
	
	@Autowired
	ChiTietHoaDonServiceImpl chiTietHoaDonServiceImpl;
	
	@Autowired
	NguoidungServiceImpl nguoiDungServiceImpl;
	
	 
	@RequestMapping(value="/updateGioHang")
	public String updateGioHang(Model model,
			@RequestParam(name ="chiTietGioHangId") int IdChiTietGioHang,
			@RequestParam(name ="number") int soLuong,
			HttpSession session) {
			
		Integer nguoiDung = (Integer) session.getAttribute("id");
		Chitiethoadon chitiethoadon = chiTietHoaDonServiceImpl.getChiTietHoaDonById(IdChiTietGioHang);
		chitiethoadon.setSoluong(soLuong);
		chitiethoadon.setSotien(chitiethoadon.getGiatien() * soLuong);
		chiTietHoaDonServiceImpl.AddChiTietHoaDon(chitiethoadon);
		model.addAttribute("giohang", chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung));
		return "fontend/giohang";
	}
	
	@RequestMapping(value="/deleteGioHang")
	public String deleteGioHang(Model model,
			@RequestParam(name ="chiTietGioHangId") int IdChiTietGioHang,
			HttpSession session) {
		Integer nguoiDung = (Integer) session.getAttribute("id");
		boolean bl = chiTietHoaDonServiceImpl.deleteChiTietHoaDon(IdChiTietGioHang);
		 if (bl) {
			 session.removeAttribute("soluonggiohang");
			 session.setAttribute("soluonggiohang", chiTietHoaDonServiceImpl.getCountAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung));
			 session.removeAttribute("gioHangSession");
			 session.setAttribute("gioHangSession", chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung));
			 model.addAttribute("status", "Xóa thành công!");
			 model.addAttribute("giohang", chiTietHoaDonServiceImpl.getAllChiTietHoaDon());
			 return "fontend/giohang";
		 } else {
	         model.addAttribute("status", "Không xóa được!");
	         model.addAttribute("giohang", chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung));
		     return "fontend/giohang";
		
	}
}	
	
	@RequestMapping(value="/viewGioHang")
	public String ViewGioHang(Model model,
			HttpSession session) {
		Integer nguoiDung = (Integer) session.getAttribute("id");
		model.addAttribute("giohang", chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung));
		return "fontend/giohang";
		
	}

	@RequestMapping(value ="/gioHang")
	public String GioHang(HttpServletRequest request,
			HttpSession session,
			@RequestParam(name="product.idsanpham") Integer idSanPham,
			@RequestParam(name="size") String tenSize,
			@RequestParam(name="number") Integer soLuong, 
			Model model) {
		
		Integer nguoiDung = (Integer) session.getAttribute("id");
		if(idSanPham == null  && tenSize == null && soLuong == null) {
			model.addAttribute("giohang", chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung));
			return "fontend/giohang";
		}if(nguoiDung ==  null) {
			model.addAttribute("title", "Đăng nhập");
			model.addAttribute("yeucaudangnhap", "Xin vui lòng đăng nhập");
			return "fontend/login";
			
		}if(nguoiDung != null) {
		List<Chitiethoadon> listChiTietHoaDon = new ArrayList<Chitiethoadon>();
		listChiTietHoaDon = chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung);
		Sanpham sanpham = sanPhamServiceImpl.getProductById(idSanPham);
		Sizesanpham sizesanpham = sizeSanPhamServiceImpl.getIdByTenSize(tenSize);
			for (int i = 0; i < listChiTietHoaDon.size(); i++) {
			Chitiethoadon chitiethoadon = listChiTietHoaDon.get(i);
			if(sanpham.getIdsanpham().equals(chitiethoadon.getIdsanpham().getIdsanpham()) && chitiethoadon.getIdsizesanpham().getTensize().equals(sizesanpham.getTensize())){
				chitiethoadon.setSoluong(soLuong + chitiethoadon.getSoluong());
				chitiethoadon.setSotien(chitiethoadon.getGiatien() * chitiethoadon.getSoluong());
				chiTietHoaDonServiceImpl.AddChiTietHoaDon(chitiethoadon);
				model.addAttribute("giohang", chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung));
				return "fontend/giohang";
			}
		}
			Chitiethoadon chitiethoadon = new Chitiethoadon();
			chitiethoadon.setIdsanpham(sanPhamServiceImpl.getProductById(idSanPham));
			chitiethoadon.setIdsizesanpham(sizeSanPhamServiceImpl.getIdByTenSize(tenSize));
			chitiethoadon.setGiatien(sanPhamServiceImpl.getProductById(idSanPham).getGiakhuyenmai());
			chitiethoadon.setSoluong(soLuong);
			chitiethoadon.setSotien(chitiethoadon.getGiatien() * soLuong);
			chitiethoadon.setIdnguoidung(nguoiDungServiceImpl.getNguoiDungById(nguoiDung));
			chitiethoadon.setStatus(1);
			chiTietHoaDonServiceImpl.AddChiTietHoaDon(chitiethoadon);
            session.removeAttribute("soluonggiohang");
			session.setAttribute("soluonggiohang", chiTietHoaDonServiceImpl.getCountAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung));
			session.removeAttribute("gioHangSession");
			session.setAttribute("gioHangSession", chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung));
			
		model.addAttribute("giohang",  chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung));
		return "fontend/giohang";
	}else{
		return "fontend/login";
	}
	}
}

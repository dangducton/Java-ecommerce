package com.dangducton.controller;

import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Comment;
import com.dangducton.service.CommentServiceImpl;
import com.dangducton.service.NguoidungServiceImpl;
import com.dangducton.service.NhapChiTietSanPhamServiceImpl;
import com.dangducton.service.SanPhamServiceImpl;

@Controller
public class ChiTietSanPhamFrontEnd {
	@Autowired
	NhapChiTietSanPhamServiceImpl nhapChiTietSanPhamServiceImpl;

	@Autowired
	SanPhamServiceImpl sanPhamServiceImpl;

	@Autowired
	CommentServiceImpl commentServiceImpl;

	@Autowired
	NguoidungServiceImpl nguoiDungServiceImpl;

	@RequestMapping("/chitietsanpham")
	public String Sanpham(Model model, @RequestParam(name = "proId") int idsanpham,
			@RequestParam(name = "danhmucId") int idanhmuc, HttpSession session, Integer offset, Integer maxResult) {

		Integer nguoiDung = (Integer) session.getAttribute("id");
		long count = 0;
		count = commentServiceImpl.getAllCommentById(idsanpham).size();
		List<Comment> list = commentServiceImpl.getCommentDetailSanPham(idsanpham, offset, maxResult);

		model.addAttribute("inforNguoidung", nguoiDungServiceImpl.getNguoiDungById(nguoiDung));
		model.addAttribute("size", nhapChiTietSanPhamServiceImpl.getAllNhapChiTietTheoSanPham(idsanpham));
		model.addAttribute("product", sanPhamServiceImpl.getProductById(idsanpham));
		model.addAttribute("listComment", list);
		model.addAttribute("offset", offset);
		model.addAttribute("count", count);
		model.addAttribute("idsanpham", idsanpham);
		model.addAttribute("idanhmuc", idanhmuc);
		model.addAttribute("listproduct", sanPhamServiceImpl.getProductDetailSanPham(idanhmuc));

		return "fontend/sanpham";

	}

	@RequestMapping("/guiNhanXetKhongTheoId")
	public String GuiNhanXet(Model model, @RequestParam(name = "proId") int idsanpham,
			@RequestParam(name = "danhmucId") int idanhmuc,
			@RequestParam(name = "hoVaTen") String hoVaTen,
			@RequestParam(name = "email") String email,
			@RequestParam(name = "nhanXet") String nhanXet, Integer offset,
			Integer maxResult) {
		
			boolean ktEmail = validate(email);
			if (ktEmail) {
				if (hoVaTen.length() > 10 && hoVaTen.length() < 30) {
						if (nhanXet.length() > 1) {
							Comment cm = new Comment();
							cm.setEmail(email);
							cm.setHoten(hoVaTen);
							cm.setIdsanpham(sanPhamServiceImpl.getProductById(idsanpham));
							Date now = new Date();
							cm.setNgaycomment(now);
							cm.setNoidung(nhanXet);
							cm.setStatus(1);
							commentServiceImpl.AddComment(cm);

							long count = 0;
							count = commentServiceImpl.getAllCommentById(idsanpham).size();
							List<Comment> list = commentServiceImpl.getCommentDetailSanPham(idsanpham, offset, maxResult);
							model.addAttribute("size", nhapChiTietSanPhamServiceImpl.getAllNhapChiTietTheoSanPham(idsanpham));
							model.addAttribute("product", sanPhamServiceImpl.getProductById(idsanpham));
							model.addAttribute("listComment", list);
							model.addAttribute("offset", offset);
							model.addAttribute("count", count);
							model.addAttribute("idsanpham", idsanpham);
							model.addAttribute("idanhmuc", idanhmuc);
							model.addAttribute("listproduct", sanPhamServiceImpl.getProductDetailSanPham(idanhmuc));
							model.addAttribute("thankNoId", "Cảm ơn đã đã đóng góp ý kiến");
							return "fontend/sanpham";
						} else {
							long count = 0;
							count = commentServiceImpl.getAllCommentById(idsanpham).size();
							List<Comment> list = commentServiceImpl.getCommentDetailSanPham(idsanpham, offset, maxResult);
							model.addAttribute("size", nhapChiTietSanPhamServiceImpl.getAllNhapChiTietTheoSanPham(idsanpham));
							model.addAttribute("product", sanPhamServiceImpl.getProductById(idsanpham));
							model.addAttribute("listComment", list);
							model.addAttribute("offset", offset);
							model.addAttribute("count", count);
							model.addAttribute("idsanpham", idsanpham);
							model.addAttribute("idanhmuc", idanhmuc);
							model.addAttribute("listproduct", sanPhamServiceImpl.getProductDetailSanPham(idanhmuc));
							model.addAttribute("nhanXet", "Vui lòng ghi nhận xét của bạn");
							return "fontend/sanpham";
						}
				} else {
					long count = 0;
					count = commentServiceImpl.getAllCommentById(idsanpham).size();
					List<Comment> list = commentServiceImpl.getCommentDetailSanPham(idsanpham, offset, maxResult);
					model.addAttribute("size", nhapChiTietSanPhamServiceImpl.getAllNhapChiTietTheoSanPham(idsanpham));
					model.addAttribute("product", sanPhamServiceImpl.getProductById(idsanpham));
					model.addAttribute("listComment", list);
					model.addAttribute("offset", offset);
					model.addAttribute("count", count);
					model.addAttribute("idsanpham", idsanpham);
					model.addAttribute("idanhmuc", idanhmuc);
					model.addAttribute("listproduct", sanPhamServiceImpl.getProductDetailSanPham(idanhmuc));
					model.addAttribute("hoVaTen", "Họ và tên gồm 10 đến 30 ký tự");
					return "fontend/sanpham";
				}
			} else {
				long count = 0;
				count = commentServiceImpl.getAllCommentById(idsanpham).size();
				List<Comment> list = commentServiceImpl.getCommentDetailSanPham(idsanpham, offset, maxResult);
				model.addAttribute("size", nhapChiTietSanPhamServiceImpl.getAllNhapChiTietTheoSanPham(idsanpham));
				model.addAttribute("product", sanPhamServiceImpl.getProductById(idsanpham));
				model.addAttribute("listComment", list);
				model.addAttribute("offset", offset);
				model.addAttribute("count", count);
				model.addAttribute("idsanpham", idsanpham);
				model.addAttribute("idanhmuc", idanhmuc);
				model.addAttribute("listproduct", sanPhamServiceImpl.getProductDetailSanPham(idanhmuc));
				model.addAttribute("email", "Nhập đúng định dạng Email");
				return "fontend/sanpham";
			}
		}

	@RequestMapping("/guiNhanXetTheoId")
	public String GuiNhanXet(Model model, @RequestParam(name = "proId") int idsanpham,
			@RequestParam(name = "danhmucId") int idanhmuc, 
			@RequestParam(name = "tenNguoiDung") String tenNguoiDung,
			@RequestParam(name = "emaiNguoiDung") String emaiNguoiDung,
			@RequestParam(name = "nhanXet") String nhanXet, Integer offset,
			Integer maxResult,
			HttpSession session) {
		Integer nguoiDung = (Integer) session.getAttribute("id");
		
		if(nhanXet.length() > 1) {
		Comment cm = new Comment();
		cm.setEmail(emaiNguoiDung);
		cm.setHoten(tenNguoiDung);
		cm.setIdsanpham(sanPhamServiceImpl.getProductById(idsanpham));
		Date now = new Date();
		cm.setNgaycomment(now);
		cm.setNoidung(nhanXet);
		cm.setStatus(1);
		commentServiceImpl.AddComment(cm);
		long count = 0;
		count = commentServiceImpl.getAllCommentById(idsanpham).size();
		List<Comment> list = commentServiceImpl.getCommentDetailSanPham(idsanpham, offset, maxResult);
		model.addAttribute("inforNguoidung", nguoiDungServiceImpl.getNguoiDungById(nguoiDung));
		model.addAttribute("size", nhapChiTietSanPhamServiceImpl.getAllNhapChiTietTheoSanPham(idsanpham));
		model.addAttribute("product", sanPhamServiceImpl.getProductById(idsanpham));
		model.addAttribute("listComment", list);
		model.addAttribute("offset", offset);
		model.addAttribute("count", count);
		model.addAttribute("idsanpham", idsanpham);
		model.addAttribute("idanhmuc", idanhmuc);
		model.addAttribute("listproduct", sanPhamServiceImpl.getProductDetailSanPham(idanhmuc));
		model.addAttribute("thankDetailId", "Cảm ơn đã đã đóng góp ý kiến");
		return "fontend/sanpham";
		}else {
			long count = 0;
			count = commentServiceImpl.getAllCommentById(idsanpham).size();
			List<Comment> list = commentServiceImpl.getCommentDetailSanPham(idsanpham, offset, maxResult);
			model.addAttribute("inforNguoidung", nguoiDungServiceImpl.getNguoiDungById(nguoiDung));
			model.addAttribute("size", nhapChiTietSanPhamServiceImpl.getAllNhapChiTietTheoSanPham(idsanpham));
			model.addAttribute("product", sanPhamServiceImpl.getProductById(idsanpham));
			model.addAttribute("listComment", list);
			model.addAttribute("offset", offset);
			model.addAttribute("count", count);
			model.addAttribute("idsanpham", idsanpham);
			model.addAttribute("idanhmuc", idanhmuc);
			model.addAttribute("listproduct", sanPhamServiceImpl.getProductDetailSanPham(idanhmuc));
			model.addAttribute("nhanXet", "Vui lòng ghi nhận xét của bạn");
			return "fontend/sanpham";
		}

	}
	
	
	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
			Pattern.CASE_INSENSITIVE);

	public static boolean validate(String emailStr) {
		Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
		return matcher.find();
	}
}

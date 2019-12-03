package com.dangducton.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Chitiethoadon;
import com.dangducton.entity.Nguoidung;
import com.dangducton.service.ChiTietHoaDonServiceImpl;
import com.dangducton.service.NguoidungServiceImpl;

@Controller
public class ChiTietKhachHangFrontEndController {
	@Autowired
	NguoidungServiceImpl nguoiDungServiceImpl;
	
	@Autowired
	ChiTietHoaDonServiceImpl chiTietHoaDonServiceImpl;
	
	@RequestMapping(value = "/thongTinKhachHang")
	public String ViewThanhToan(Model model, HttpSession session,Integer offset, Integer maxResult) {
		Integer nguoiDung = (Integer) session.getAttribute("id");
		
		long count = 0;
		count = chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDung(nguoiDung).size();
		List<Chitiethoadon> list = chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDung(nguoiDung, offset, maxResult);
		
		model.addAttribute("title", "Thông tin khách hàng");
		model.addAttribute("chitiethonhang", list);
		model.addAttribute("offset", offset);
		model.addAttribute("count", count);
		model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(nguoiDung));
		

		return "fontend/thongtinkhachhang";
		
	}
	
	@RequestMapping(value = "/initUpdateThongTin")
	public String InitUpdateThongTin(Model model, HttpSession session,Integer offset, Integer maxResult) {
		Integer nguoiDung = (Integer) session.getAttribute("id");
		
		model.addAttribute("title", "Thông tin khách hàng");
		model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(nguoiDung));
		return "fontend/updateThongTinKhachHang";
		
	}
	
	@RequestMapping(value = "/updateThongTinKhachHang", method = RequestMethod.POST)
	public String DangKy(Model model,
			HttpSession session,
			Integer offset, Integer maxResult,
			@RequestParam(name = "tenDangNhap") String tenDangNhap,
			@RequestParam(name = "matKhauCu") String matKhauCu,
			@RequestParam(name = "tenNguoiDung") String tenNguoiDung,
			@RequestParam(name = "matKhau") String matKhau,
			@RequestParam(name = "xacNhanMatKhau") String xacNhanMatKhau,
			@RequestParam(name = "diaChi") String diaChi,
			@RequestParam(name = "dienThoai") String dienThoai) {
		
		Integer ng = (Integer) session.getAttribute("id");
		if (null != nguoiDungServiceImpl.getNguoidungLogin(tenDangNhap, matKhauCu)) {
			if (0 == nguoiDungServiceImpl.getNguoiDungBySoDienThoai(dienThoai).size()) {
						if (tenNguoiDung.length() > 10 && tenNguoiDung.length() < 50) {
								if (matKhau.length() > 8 && matKhau.length() < 50) {
									if (xacNhanMatKhau.equals(matKhau)) {
										if (diaChi.length() > 15 && diaChi.length() < 150) {
											if (dienThoai.length() > 9 && dienThoai.length() < 11
													&& dienThoai.charAt(0) == '0') {
												Nguoidung nguoiDung =nguoiDungServiceImpl.getNguoiDungById(ng) ;
												
												nguoiDung.setTenuser(tenNguoiDung);
												nguoiDung.setMatkhau(matKhau);
												nguoiDung.setDiachi(diaChi);
												nguoiDung.setDienthoai(dienThoai);
												nguoiDungServiceImpl.UpdateNguoiDung(nguoiDung);
												
												long count = 0;
												count = chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDung(ng).size();
												List<Chitiethoadon> list = chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDung(ng, offset, maxResult);
												
												model.addAttribute("title", "Thông tin khách hàng");
												model.addAttribute("chitiethonhang", list);
												model.addAttribute("offset", offset);
												model.addAttribute("count", count);
												model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(ng));
												

												return "fontend/thongtinkhachhang";
												

											} else {
												model.addAttribute("falseDienThoai",
														"Yêu cầu nhập đúng định dạng số điện thoại gồm 10 số");
												model.addAttribute("title", "Thông tin khách hàng");
												model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(ng));
												return "fontend/updateThongTinKhachHang";
											}
										} else {
											model.addAttribute("falseDiaChi", "Địa chỉ quá ngắn");
											model.addAttribute("title", "Thông tin khách hàng");
											model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(ng));
											return "fontend/updateThongTinKhachHang";
										}
									} else {
										model.addAttribute("falseNhapLaiMatKhau", "Hai mật khẩu không trùng nhau");
										model.addAttribute("title", "Thông tin khách hàng");
										model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(ng));
										return "fontend/updateThongTinKhachHang";
									}
								} else {
									model.addAttribute("falseMatKhau", "Độ dài của mật khẩu từ 8 đến 50 ký tự");
									model.addAttribute("title", "Thông tin khách hàng");
									model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(ng));
									return "fontend/updateThongTinKhachHang";
								}
						} else {
							model.addAttribute("falseTenNguoiDung", "Độ dài của tên từ 10 đến 50 ký tự");
							model.addAttribute("title", "Thông tin khách hàng");
							model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(ng));
							return "fontend/updateThongTinKhachHang";
						}
			} else {
				model.addAttribute("falseDienThoai", "Số điện thoại đã tồn tại");
				model.addAttribute("title", "Thông tin khách hàng");
				model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(ng));
				return "fontend/updateThongTinKhachHang";
			}
		} else {
			model.addAttribute("falseMatKhauCu", "Mật khẩu không đúng");
			model.addAttribute("title", "Thông tin khách hàng");
			model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(ng));
			return "fontend/updateThongTinKhachHang";
		}
	}

	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
			Pattern.CASE_INSENSITIVE);

	public static boolean validate(String emailStr) {
		Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
		return matcher.find();
	}
}

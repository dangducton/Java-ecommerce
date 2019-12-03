package com.dangducton.controller;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Nguoidung;
import com.dangducton.entity.Userrole;
import com.dangducton.service.NguoidungServiceImpl;
import com.dangducton.service.RoleServiceImpl;
import com.dangducton.service.SanPhamServiceImpl;
import com.dangducton.service.UserroleServiceImpl;

@Controller
public class DangKyFrontEndController {

	@Autowired
	NguoidungServiceImpl nguoiDungServiceImpl;

	@Autowired
	SanPhamServiceImpl sanPhamServiceImpl;

	@Autowired
	UserroleServiceImpl userRoleServiceImpl;

	@Autowired
	RoleServiceImpl roleServiceImpl;

	@RequestMapping(value = "/dangKy", method = RequestMethod.POST)
	public String DangKy(Model model,
			@RequestParam(name = "tenNguoiDung") String tenNguoiDung,
			@RequestParam(name = "tenDangNhap") String tenDangNhap,
			@RequestParam(name = "matKhau") String matKhau,
			@RequestParam(name = "xacNhanMatKhau") String xacNhanMatKhau,
			@RequestParam(name = "email") String email,
			@RequestParam(name = "diaChi") String diaChi,
			@RequestParam(name = "dienThoai") String dienThoai) {

		boolean ktEmail = validate(email);

		if (0 == nguoiDungServiceImpl.getNguoiDungByEmail(email).size()) {
			if (0 == nguoiDungServiceImpl.getNguoiDungBySoDienThoai(dienThoai).size()) {
				if (0 == nguoiDungServiceImpl.getNguoiDungByTenDangNhap(tenDangNhap).size()) {
					if (ktEmail) {
						if (tenNguoiDung.length() > 10 && tenNguoiDung.length() < 50) {
							if (tenDangNhap.length() > 8 && tenDangNhap.length() < 50) {
								if (matKhau.length() > 8 && matKhau.length() < 50) {
									if (xacNhanMatKhau.equals(matKhau)) {
										if (diaChi.length() > 15 && diaChi.length() < 150) {
											if (dienThoai.length() > 9 && dienThoai.length() < 11
													&& dienThoai.charAt(0) == '0') {
												Nguoidung nguoiDung = new Nguoidung();
												nguoiDung.setTenuser(tenNguoiDung);
												nguoiDung.setTendangnhap(tenDangNhap);
												nguoiDung.setMatkhau(matKhau);
												nguoiDung.setEmail(email);
												nguoiDung.setDiachi(diaChi);
												nguoiDung.setDienthoai(dienThoai);
												nguoiDung.setStatus(1);
												Date now = new Date();
												nguoiDung.setNgaytao(now);
												nguoiDungServiceImpl.AddNguoiDung(nguoiDung);

												Userrole userRole = new Userrole();
												userRole.setIdnguoidung(nguoiDungServiceImpl.getNguoiDungById(nguoiDung.getIduser()));
												userRole.setIdrode(roleServiceImpl.getRoleById(2));
												userRoleServiceImpl.UserRole(userRole);
												
												model.addAttribute("title", "Đăng nhập");
												return "fontend/login";

											} else {
												model.addAttribute("title", "Đăng ký");
												model.addAttribute("falseDienThoai",
														"Yêu cầu nhập đúng định dạng số điện thoại gồm 10 số");
												return "fontend/dangky";
											}
										} else {
											model.addAttribute("title", "Đăng ký");
											model.addAttribute("falseDiaChi", "Địa chỉ quá ngắn");
											return "fontend/dangky";
										}
									} else {
										model.addAttribute("title", "Đăng ký");
										model.addAttribute("falseNhapLaiMatKhau", "Hai mật khẩu không trùng nhau");
										return "fontend/dangky";
									}
								} else {
									model.addAttribute("title", "Đăng ký");
									model.addAttribute("falseMatKhau", "Độ dài của mật khẩu từ 8 đến 50 ký tự");
									return "fontend/dangky";
								}
							} else {
								model.addAttribute("title", "Đăng ký");
								model.addAttribute("falseTenDangNhap", "Độ dài của tên đăng nhập từ 8 đến 50 ký tự");
								return "fontend/dangky";
							}
						} else {
							model.addAttribute("title", "Đăng ký");
							model.addAttribute("falseTenNguoiDung", "Độ dài của tên từ 10 đến 50 ký tự");
							return "fontend/dangky";
						}
					} else {
						model.addAttribute("title", "Đăng ký");
						model.addAttribute("falseEmail", "Yêu cầu nhập đúng định dạng Email");
						return "fontend/dangky";
					}
				} else {
					model.addAttribute("title", "Đăng ký");
					model.addAttribute("falseTenDangNhap", "Tên đăng nhập đã tồn tại");
					return "fontend/dangky";
				}
			} else {
				model.addAttribute("title", "Đăng ký");
				model.addAttribute("falseDienThoai", "Số điện thoại đã tồn tại");
				return "fontend/dangky";
			}
		} else {
			model.addAttribute("title", "Đăng ký");
			model.addAttribute("falseEmail", "Email đã tồn tại");
			return "fontend/dangky";
		}
	}

	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
			Pattern.CASE_INSENSITIVE);

	public static boolean validate(String emailStr) {
		Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
		return matcher.find();
	}
}

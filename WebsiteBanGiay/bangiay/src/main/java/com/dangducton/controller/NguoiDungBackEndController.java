package com.dangducton.controller;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Nguoidung;
import com.dangducton.entity.Userrole;
import com.dangducton.service.NguoidungServiceImpl;
import com.dangducton.service.RoleServiceImpl;
import com.dangducton.service.UserroleServiceImpl;

@Controller
@RequestMapping(value="/admin")
public class NguoiDungBackEndController {
	
	@Autowired
	RoleServiceImpl roleServiceImpl;
	
	@Autowired
	UserroleServiceImpl userRoleServiceImpl;
	
	@Autowired
	NguoidungServiceImpl nguoiDungServiceImpl;
	
	
	
	@RequestMapping("/updateNguoiDung1")
	public String UpdateNguoiDung1(Model model,HttpSession session,@RequestParam("iduser") int idUser,Integer offset, Integer maxResult) {
		
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
				Nguoidung nd = nguoiDungServiceImpl.getNguoiDungById(idUser);
				nd.setStatus(2);
				nguoiDungServiceImpl.UpdateNguoiDung(nd);
				model.addAttribute("status", "Tắt kích hoạt thành công");
				model.addAttribute("title", "Danh sách người dùng");
				model.addAttribute("listNguoiDung", userRoleServiceImpl.findAllUser(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", userRoleServiceImpl.findAllUser().size());
			
				return "admin/danhsachnguoidung";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
	
	@RequestMapping("/updateNguoiDung2")
	public String UpdateNguoiDung2(Model model,HttpSession session,@RequestParam("iduser") int idUser,Integer offset, Integer maxResult) {
		
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
				Nguoidung nd = nguoiDungServiceImpl.getNguoiDungById(idUser);
				nd.setStatus(1);
				nguoiDungServiceImpl.UpdateNguoiDung(nd);
				model.addAttribute("status", "Kích hoạt thành công");
				model.addAttribute("title", "Danh sách người dùng");
				model.addAttribute("listNguoiDung", userRoleServiceImpl.findAllUser(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", userRoleServiceImpl.findAllUser().size());
				return "admin/danhsachnguoidung";
			
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
	
	@RequestMapping("/chiTietNguoidung")
	public String ChiTietNguoidung(Model model,HttpSession session,@RequestParam("iduser") int idUser) {
		
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
				model.addAttribute("title", "Chi tiết người dùng");
				model.addAttribute("nguoiDung", nguoiDungServiceImpl.getNguoiDungById(idUser));
				model.addAttribute("quyen", userRoleServiceImpl.getUserById(idUser));
				
				return "admin/nguoidungchitiet";
			
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
	
	@RequestMapping("/themNguoiDung")
	public String ThemNguoiDung(Model model,HttpSession session) {
		
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
				model.addAttribute("title", "Thêm người dùng");
				model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
			
				return "admin/insertNguoiDung";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
	
	@RequestMapping("/initUpdateNguoidung")
	public String InitUpdateNguoidung(Model model,HttpSession session,@RequestParam("idUser") int idUser) {
		
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
				model.addAttribute("title", "Update người dùng");
				model.addAttribute("title", "Chi tiết người dùng");
				model.addAttribute("nguoiDung", nguoiDungServiceImpl.getNguoiDungById(idUser));
				model.addAttribute("quyen", userRoleServiceImpl.getUserById(idUser));
				model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
			
				return "admin/updateNguoiDung";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
	
	@RequestMapping("/danhSachNguoiDung")
	public String DanhSachNguoiDung(Model model,HttpSession session, Integer offset, Integer maxResult) {
		
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
				model.addAttribute("title", "Danh sách người dùng");
				model.addAttribute("listNguoiDung", userRoleServiceImpl.findAllUser(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", userRoleServiceImpl.findAllUser().size());
			
				return "admin/danhsachnguoidung";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
	
	@RequestMapping("/updateNguoiDung")
	public String UpDateNguoiDung(Model model,
			@RequestParam(name = "idUser") int idUser,
			@RequestParam(name = "tenNguoiDung") String tenNguoiDung,
			@RequestParam(name = "tenDangNhap") String tenDangNhap,
			@RequestParam(name = "matKhau") String matKhau,
			@RequestParam(name = "Email") String email,
			@RequestParam(name = "diaChi") String diaChi,
			@RequestParam(name = "dienThoai") String dienThoai,
			@RequestParam(name = "quyen") int quyen,
			Integer offset, Integer maxResult) {
		
		boolean ktEmail = validate(email);
					if (ktEmail) {
						if (tenNguoiDung.length() > 10 && tenNguoiDung.length() < 50) {
							if (tenDangNhap.length() > 8 && tenDangNhap.length() < 50) {
								if (matKhau.length() > 8 && matKhau.length() < 50) {
										if (diaChi.length() > 15 && diaChi.length() < 150) {
											if (dienThoai.length() > 9 && dienThoai.length() < 11
													&& dienThoai.charAt(0) == '0') {
												Nguoidung nguoiDung = nguoiDungServiceImpl.getNguoiDungById(idUser);
												nguoiDung.setTenuser(tenNguoiDung);
												nguoiDung.setTendangnhap(tenDangNhap);
												nguoiDung.setMatkhau(matKhau);
												nguoiDung.setEmail(email);
												nguoiDung.setDiachi(diaChi);
												nguoiDung.setDienthoai(dienThoai);
												nguoiDung.setStatus(1);
												nguoiDungServiceImpl.UpdateNguoiDung(nguoiDung);

												Userrole userRole = userRoleServiceImpl.getUserById(idUser);
												userRole.setIdrode(roleServiceImpl.getRoleById(quyen));
												userRoleServiceImpl.updateUserRole(userRole);
												
												model.addAttribute("title", "Danh sách người dùng");
												model.addAttribute("listNguoiDung", userRoleServiceImpl.findAllUser(offset, maxResult));
												model.addAttribute("offset", offset);
												model.addAttribute("count", userRoleServiceImpl.findAllUser().size());
												return "admin/danhsachnguoidung";

											} else {
												model.addAttribute("title", "Đăng ký");
												model.addAttribute("falseDienThoai",
														"Yêu cầu nhập đúng định dạng số điện thoại gồm 10 số");
												model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
												return "admin/insertNguoiDung";
											}
										} else {
											model.addAttribute("title", "Đăng ký");
											model.addAttribute("falseDiaChi", "Địa chỉ quá ngắn");
											model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
											return "admin/insertNguoiDung";
										}
								} else {
									model.addAttribute("title", "Đăng ký");
									model.addAttribute("falseMatKhau", "Độ dài của mật khẩu từ 8 đến 50 ký tự");
									model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
									return "admin/insertNguoiDung";
								}
							} else {
								model.addAttribute("title", "Đăng ký");
								model.addAttribute("falseTenDangNhap", "Độ dài của tên đăng nhập từ 8 đến 50 ký tự");
								model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
								return "admin/insertNguoiDung";
							}
						} else {
							model.addAttribute("title", "Đăng ký");
							model.addAttribute("falseTenNguoiDung", "Độ dài của tên từ 10 đến 50 ký tự");
							model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
							return "admin/insertNguoiDung";
						}
					} else {
						model.addAttribute("title", "Đăng ký");
						model.addAttribute("falseEmail", "Yêu cầu nhập đúng định dạng Email");
						model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
						return "admin/insertNguoiDung";
					}
}

	
	
	@RequestMapping("/insertThemNguoiDung")
	public String InsertThemNguoiDung(Model model,
			@RequestParam(name = "tenNguoiDung") String tenNguoiDung,
			@RequestParam(name = "tenDangNhap") String tenDangNhap,
			@RequestParam(name = "matKhau") String matKhau,
			@RequestParam(name = "xacNhanMatKhau") String xacNhanMatKhau,
			@RequestParam(name = "Email") String email,
			@RequestParam(name = "diaChi") String diaChi,
			@RequestParam(name = "dienThoai") String dienThoai,
			@RequestParam(name = "quyen") int quyen,
			Integer offset, Integer maxResult) {
		
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
												userRole.setIdrode(roleServiceImpl.getRoleById(quyen));
												userRoleServiceImpl.UserRole(userRole);
												
												model.addAttribute("title", "Danh sách người dùng");
												model.addAttribute("listNguoiDung", userRoleServiceImpl.findAllUser(offset, maxResult));
												model.addAttribute("offset", offset);
												model.addAttribute("count", userRoleServiceImpl.findAllUser().size());
												return "admin/danhsachnguoidung";

											} else {
												model.addAttribute("title", "Đăng ký");
												model.addAttribute("falseDienThoai",
														"Yêu cầu nhập đúng định dạng số điện thoại gồm 10 số");
												model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
												return "admin/insertNguoiDung";
											}
										} else {
											model.addAttribute("title", "Đăng ký");
											model.addAttribute("falseDiaChi", "Địa chỉ quá ngắn");
											model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
											return "admin/insertNguoiDung";
										}
									} else {
										model.addAttribute("title", "Đăng ký");
										model.addAttribute("falseNhapLaiMatKhau", "Hai mật khẩu không trùng nhau");
										model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
										return "admin/insertNguoiDung";
									}
								} else {
									model.addAttribute("title", "Đăng ký");
									model.addAttribute("falseMatKhau", "Độ dài của mật khẩu từ 8 đến 50 ký tự");
									model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
									return "admin/insertNguoiDung";
								}
							} else {
								model.addAttribute("title", "Đăng ký");
								model.addAttribute("falseTenDangNhap", "Độ dài của tên đăng nhập từ 8 đến 50 ký tự");
								model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
								return "admin/insertNguoiDung";
							}
						} else {
							model.addAttribute("title", "Đăng ký");
							model.addAttribute("falseTenNguoiDung", "Độ dài của tên từ 10 đến 50 ký tự");
							model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
							return "admin/insertNguoiDung";
						}
					} else {
						model.addAttribute("title", "Đăng ký");
						model.addAttribute("falseEmail", "Yêu cầu nhập đúng định dạng Email");
						model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
						return "admin/insertNguoiDung";
					}
				} else {
					model.addAttribute("title", "Đăng ký");
					model.addAttribute("falseTenDangNhap", "Tên đăng nhập đã tồn tại");
					model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
					return "admin/insertNguoiDung";
				}
			} else {
				model.addAttribute("title", "Đăng ký");
				model.addAttribute("falseDienThoai", "Số điện thoại đã tồn tại");
				model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
				return "admin/insertNguoiDung";
			}
		} else {
			model.addAttribute("title", "Đăng ký");
			model.addAttribute("falseEmail", "Email đã tồn tại");
			model.addAttribute("listRole", roleServiceImpl.findAllRoleById());
			return "admin/insertNguoiDung";
		}
	}
	
	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
			Pattern.CASE_INSENSITIVE);

	public static boolean validate(String emailStr) {
		Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
		return matcher.find();
	}
}

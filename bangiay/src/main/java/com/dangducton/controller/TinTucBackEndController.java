package com.dangducton.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dangducton.entity.Tintuc;
import com.dangducton.entity.Userrole;
import com.dangducton.service.TinTucServiceImpl;
import com.dangducton.service.UserroleServiceImpl;

@Controller
@RequestMapping(value="/admin")
public class TinTucBackEndController {
	@Autowired
	UserroleServiceImpl userRoleServiceImpl;
	
	@Autowired
	TinTucServiceImpl tinTucServiceImpl;
	
	@RequestMapping(value="/initNhapTinTuc")
	public String NhapThemSanPham(Model model, HttpSession session) {
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
				model.addAttribute("title", "Nhập tin tức");
				
				return "admin/insertTinTuc";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}
		return "fontend/403";

	}
	
	@RequestMapping(value="/uploadTinTuc")
	public String UploadTinTuc(Model model, HttpSession session,
			@RequestParam(name = "file1") MultipartFile file1,
			@RequestParam(name = "moTaNgan") String moTaNgan,
			@RequestParam(name = "tenTinTuc") String tenTinTuc,
			@RequestParam(name = "noiDung") String noiDung) {
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
				
				Tintuc tt = new Tintuc();
				try {
					File newFile1 = new File(
							"C:\\Users\\Admin\\Documents\\workspace-spring-tool-suite-4-4.3.0.RELEASE\\bangiay\\src\\main\\webapp\\resources\\fontend\\anhsanpham\\"
									+ file1.getOriginalFilename());
					FileOutputStream fileOutputStream;
					fileOutputStream = new FileOutputStream(newFile1);
					fileOutputStream.write(file1.getBytes());
					tt.setImage(file1.getOriginalFilename());
					fileOutputStream.close();

				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				tt.setMotangan(moTaNgan);
				tt.setNoidung(noiDung);
				tt.setTentintuc(tenTinTuc);
				tt.setStatus(1);
				Date now = new Date();
				tt.setNgaytao(now);
				tinTucServiceImpl.AddTinTuc(tt);
				
				model.addAttribute("title", "Nhập tin tức");
				return "admin/insertTinTuc";
			}
			
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}
		return "fontend/403";
	}
	
	
	@RequestMapping(value="/danhSachTinTuc")
	public String DanhSachTinTuc(Model model, HttpSession session,Integer offset, Integer maxResult) {
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
				model.addAttribute("title", "Danh sách tin tức");
				model.addAttribute("listTinTuc", tinTucServiceImpl.findTinTuc(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", tinTucServiceImpl.findTinTuc().size());
				
				return "admin/danhsachtintuc";
			}
			
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}
		return "fontend/403";

	}
	
	@RequestMapping(value="/chiTietTinTuc")
	public String ChiTietTinTuc(Model model, HttpSession session,@RequestParam("chiTietTinTucId") int chiTietTinTucId) {
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
				model.addAttribute("title", "Chi tiết tin tức");
				model.addAttribute("chiTietTinTuc", tinTucServiceImpl.getTinTucById(chiTietTinTucId));
				
				return "admin/updateTinTuc";
			}
			
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}
		return "fontend/403";

	}
	
	@RequestMapping(value="/upDateTinTuc")
	public String UpDateTinTuc(Model model, HttpSession session,
			@RequestParam("idTinTuc") int chiTietTinTucId,
			@RequestParam(name = "file1") MultipartFile file1,
			@RequestParam(name = "moTaNgan") String moTaNgan,
			@RequestParam(name = "tenTinTuc") String tenTinTuc,
			@RequestParam(name = "noiDung") String noiDung,
			Integer offset, Integer maxResult) {
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
				model.addAttribute("title", "Chi tiết tin tức");
				Tintuc tt = tinTucServiceImpl.getTinTucById(chiTietTinTucId);
				try {
					File newFile1 = new File(
							"C:\\Users\\Admin\\Documents\\workspace-spring-tool-suite-4-4.3.0.RELEASE\\bangiay\\src\\main\\webapp\\resources\\fontend\\anhsanpham\\"
									+ file1.getOriginalFilename());
					FileOutputStream fileOutputStream;
					fileOutputStream = new FileOutputStream(newFile1);
					fileOutputStream.write(file1.getBytes());
					tt.setImage(file1.getOriginalFilename());
					fileOutputStream.close();

				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				tt.setMotangan(moTaNgan);
				tt.setNoidung(noiDung);
				tt.setTentintuc(tenTinTuc);
				tinTucServiceImpl.UpdateTinTuc(tt);
				
				model.addAttribute("title", "Danh sách tin tức");
				model.addAttribute("status", "Update thành công");
				model.addAttribute("listTinTuc", tinTucServiceImpl.findTinTuc(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", tinTucServiceImpl.findTinTuc().size());
				
				return "admin/danhsachtintuc";
			}
			
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}
		return "fontend/403";

	}
	
	@RequestMapping(value="/updateTinTuc1")
	public String UpdateTinTuc1(Model model, HttpSession session,
			@RequestParam("chiTietTinTucId") int chiTietTinTucId,
			Integer offset, Integer maxResult) {
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
				model.addAttribute("title", "Chi tiết tin tức");
				Tintuc tt = tinTucServiceImpl.getTinTucById(chiTietTinTucId);
				tt.setStatus(2);
				tinTucServiceImpl.UpdateTinTuc(tt);
				
				model.addAttribute("title", "Danh sách tin tức");
				model.addAttribute("status", "Update thành công");
				model.addAttribute("listTinTuc", tinTucServiceImpl.findTinTuc(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", tinTucServiceImpl.findTinTuc().size());
				
				return "admin/danhsachtintuc";
			}
			
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}
		return "fontend/403";

	}
	
	@RequestMapping(value="/updateTinTuc2")
	public String UpdateTinTuc2(Model model, HttpSession session,
			@RequestParam("chiTietTinTucId") int chiTietTinTucId,
			Integer offset, Integer maxResult) {
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
				model.addAttribute("title", "Chi tiết tin tức");
				Tintuc tt = tinTucServiceImpl.getTinTucById(chiTietTinTucId);
				tt.setStatus(1);
				tinTucServiceImpl.UpdateTinTuc(tt);
				
				model.addAttribute("title", "Danh sách tin tức");
				model.addAttribute("status", "Update thành công");
				model.addAttribute("listTinTuc", tinTucServiceImpl.findTinTuc(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", tinTucServiceImpl.findTinTuc().size());
				
				return "admin/danhsachtintuc";
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


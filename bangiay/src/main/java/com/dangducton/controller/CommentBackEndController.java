package com.dangducton.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangducton.entity.Userrole;
import com.dangducton.entity.Comment;
import com.dangducton.service.CommentServiceImpl;
import com.dangducton.service.UserroleServiceImpl;

@Controller
@RequestMapping(value = "/admin")
public class CommentBackEndController {

	@Autowired
	CommentServiceImpl commentServiceImpl;

	@Autowired
	UserroleServiceImpl userRoleServiceImpl;

	@RequestMapping("/deleteComment")
	public String DeleteComment(Model model, HttpSession session, Integer offset, Integer maxResult,
			@RequestParam(name = "commentId") int commentId) {
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
				boolean bl = commentServiceImpl.deleteComment(commentId);
				if (bl) {
					model.addAttribute("statusDelete", "Xóa thành công");
					model.addAttribute("title", "Danh sách comment");
					model.addAttribute("listComment", commentServiceImpl.findAllComment(offset, maxResult));
					model.addAttribute("offset", offset);
					model.addAttribute("count", commentServiceImpl.countFindAllComment().size());
					return "admin/danhsachcomment";
				}
				if (bl == false) {
					model.addAttribute("status", "Không xóa được!");
					model.addAttribute("title", "Danh sách comment");
					model.addAttribute("listComment", commentServiceImpl.findAllComment(offset, maxResult));
					model.addAttribute("offset", offset);
					model.addAttribute("count", commentServiceImpl.countFindAllComment().size());
					return "admin/danhsachcomment";
				}
				if (myName == 2) {
					model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
					model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
					return "fontend/403";
				}
			}
		}
		return "frontend/403";

	}

	@RequestMapping("/updateComment2")
	public String UpdateComment2(Model model, HttpSession session, Integer offset, Integer maxResult,
			@RequestParam(name = "commentId") int commentId) {
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
				Comment cm = commentServiceImpl.getCommentById(commentId);
				cm.setStatus(1);
				commentServiceImpl.upDateComment(cm);
				model.addAttribute("statusOn", "Kích hoạt thành công");

				model.addAttribute("title", "Danh sách comment");
				model.addAttribute("listComment", commentServiceImpl.findAllComment(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", commentServiceImpl.countFindAllComment().size());
				return "admin/danhsachcomment";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}

	@RequestMapping("/updateComment1")
	public String UpdateComment1(Model model, HttpSession session, Integer offset, Integer maxResult,
			@RequestParam(name = "commentId") int commentId) {
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
				Comment cm = commentServiceImpl.getCommentById(commentId);
				cm.setStatus(2);
				commentServiceImpl.upDateComment(cm);
				model.addAttribute("statusOff", "Tắt kích hoạt thành công");

				model.addAttribute("title", "Danh sách comment");
				model.addAttribute("listComment", commentServiceImpl.findAllComment(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", commentServiceImpl.countFindAllComment().size());
				return "admin/danhsachcomment";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}

	@RequestMapping("/comment")
	public String Comment(Model model, HttpSession session, Integer offset, Integer maxResult) {
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
				model.addAttribute("title", "Danh sách comment");
				model.addAttribute("listComment", commentServiceImpl.findAllComment(offset, maxResult));
				model.addAttribute("offset", offset);
				model.addAttribute("count", commentServiceImpl.countFindAllComment().size());
				return "admin/danhsachcomment";
			}
			if (myName == 2) {
				model.addAttribute("title", "Bạn không có quyền truy cập vào trang Web này");
				model.addAttribute("thongBao", "Bạn không có quyền truy cập vào trang Web này");
				return "fontend/403";
			}
		}

		return "frontend/403";
	}
}

package com.dangducton.controller;

import java.util.ArrayList;
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

import com.dangducton.entity.Chitiethoadon;
import com.dangducton.entity.Hoadon;
import com.dangducton.entity.Nguoidung;
import com.dangducton.service.ChiTietHoaDonServiceImpl;
import com.dangducton.service.HoaDonServiceImpl;
import com.dangducton.service.NguoidungServiceImpl;

@Controller
public class CheckOutFrontEndController {

	@Autowired
	HoaDonServiceImpl hoaDonServiceImpl;

	@Autowired
	ChiTietHoaDonServiceImpl chiTietHoaDonServiceImpl;

	@Autowired
	NguoidungServiceImpl nguoiDungServiceImpl;

	@RequestMapping(value = "/viewThanhToan")
	public String ViewThanhToan(Model model, HttpSession session) {
		Integer nguoiDung = (Integer) session.getAttribute("id");

		List<Chitiethoadon> list = new ArrayList<Chitiethoadon>();
		list = chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung);
		if (list.size() > 0) {
			model.addAttribute("title", "Thanh toán đơn hàng");
			model.addAttribute("giohang",
					chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung));
			model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(nguoiDung));

			return "fontend/thanhtoan";
		} else {
			model.addAttribute("falseThanhToan", "Giỏ hàng trống không thể thanh toán được! Bạn hãy mua sắm đi nhé!");
			return "fontend/giohang";
		}

	}

	@RequestMapping(value = "/checkOutDonHang")
	public String CheckOutDonHang(Model model, HttpSession session, @RequestParam("total") Double tongTien,
			@RequestParam(defaultValue = "false") boolean checkbox, @RequestParam("tenNguoiDung") String tenNguoiDung,
			@RequestParam("email") String email, @RequestParam("diaChi") String diaChi,
			@RequestParam("dienThoai") String dienThoai, @RequestParam("note") String note) {

		boolean ktEmail = validate(email);
		Integer nguoiDung = (Integer) session.getAttribute("id");
		List<Chitiethoadon> list = new ArrayList<Chitiethoadon>();
		list = chiTietHoaDonServiceImpl.getAllChiTietHoaDonTheoNguoiDungChuaThanhToan(nguoiDung);

		if (checkbox) {
			if (list.size() > 0) {
				if (tenNguoiDung.length() > 15 && tenNguoiDung.length() < 50) {
					if (ktEmail) {
						if (diaChi.length() > 20 && diaChi.length() < 50) {
							if (dienThoai.length() > 9 && dienThoai.length() < 11 && dienThoai.charAt(0) == '0') {
								Hoadon hoaDon = new Hoadon();
								hoaDon.setDienthoai(dienThoai);
								hoaDon.setEmail(email);
								hoaDon.setDiachi(diaChi);
								hoaDon.setTongtien(tongTien);
								hoaDon.setIduser(nguoiDungServiceImpl.getNguoiDungById(nguoiDung));
								hoaDon.setGhichu(note);
								hoaDon.setStatus(3);
								Date now = new Date();
								hoaDon.setNgaytao(now);
								hoaDonServiceImpl.AddHoaDon(hoaDon);
								session.removeAttribute("soluonggiohang");
								session.removeAttribute("gioHangSession");

								for (int i = 0; i < list.size(); i++) {
									Chitiethoadon chiTietHoaDon = chiTietHoaDonServiceImpl
											.getChiTietHoaDonById(list.get(i).getIdchitiethoadon());
									chiTietHoaDon.setIdhoadon(hoaDonServiceImpl.getHoaDonByID(hoaDon.getIdhoadon()));

									chiTietHoaDonServiceImpl.update(chiTietHoaDon);
								}
								model.addAttribute("title", "Cảm ơn đã sử dụng dịch vụ chúng tôi");
								return "fontend/thanks";
							} else {
								model.addAttribute("title", "Thanh toán");
								model.addAttribute("falseDienThoai",
										"Yêu cầu nhập đúng định dạng điện thoại gồm 10 số");
								model.addAttribute("thongtinnguoidung",
										nguoiDungServiceImpl.getNguoiDungById(nguoiDung));
								return "fontend/thanhtoan";
							}
						} else {
							model.addAttribute("title", "Thanh toán");
							model.addAttribute("falseDiaChi", "Địa chỉ có 20 đến 50 ký tự");
							model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(nguoiDung));
							return "fontend/thanhtoan";
						}
					} else {
						model.addAttribute("title", "Thanh toán");
						model.addAttribute("falseEmail", "Yêu cầu nhập đúng định dạng Email");
						model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(nguoiDung));
						return "fontend/thanhtoan";
					}
				} else {
					model.addAttribute("title", "Thanh toán");
					model.addAttribute("falseTenNguoiDung", "Tên người dùng có 15 đến 50 ký tự");
					model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(nguoiDung));
					return "fontend/thanhtoan";
				}
			} else {
				model.addAttribute("title", "Thanh toán");
				model.addAttribute("gioHangDangTrong", "Giỏ hàng của bạn đang trống quay lại để mua hàng");
				model.addAttribute("thongtinnguoidung", nguoiDungServiceImpl.getNguoiDungById(nguoiDung));
				return "fontend/thanhtoan";

			}

		}
		if (checkbox == false) {
			Nguoidung nguoidung = nguoiDungServiceImpl.getNguoiDungById(nguoiDung);
			Hoadon hoaDon = new Hoadon();
			hoaDon.setDienthoai(nguoidung.getDienthoai());
			hoaDon.setEmail(nguoidung.getEmail());
			hoaDon.setDiachi(nguoidung.getDiachi());
			hoaDon.setTongtien(tongTien);
			hoaDon.setIduser(nguoidung);
			hoaDon.setGhichu(note);
			hoaDon.setStatus(3);
			Date now = new Date();
			hoaDon.setNgaytao(now);
			hoaDonServiceImpl.AddHoaDon(hoaDon);
			session.removeAttribute("soluonggiohang");
			session.removeAttribute("gioHangSession");

			for (int i = 0; i < list.size(); i++) {
				Chitiethoadon chiTietHoaDon = chiTietHoaDonServiceImpl
						.getChiTietHoaDonById(list.get(i).getIdchitiethoadon());
				chiTietHoaDon.setIdhoadon(hoaDonServiceImpl.getHoaDonByID(hoaDon.getIdhoadon()));
				chiTietHoaDonServiceImpl.update(chiTietHoaDon);
			}
			model.addAttribute("title", "Cảm ơn đã sử dụng dịch vụ chúng tôi");
			return "fontend/thanks";
		} else {
			return "fontend/thanks";
		}
	}

	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
			Pattern.CASE_INSENSITIVE);

	public static boolean validate(String emailStr) {
		Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
		return matcher.find();
	}
}

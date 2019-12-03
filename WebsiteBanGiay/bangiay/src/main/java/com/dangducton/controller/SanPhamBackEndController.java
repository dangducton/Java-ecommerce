package com.dangducton.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dangducton.entity.Danhmucsanpham;
import com.dangducton.entity.Mausanpham;
import com.dangducton.entity.Sanpham;
import com.dangducton.service.DanhMucServiceImpl;
import com.dangducton.service.MauSanPhamServiceImpl;
import com.dangducton.service.SanPhamServiceImpl;

@Controller
@RequestMapping("/admin")
public class SanPhamBackEndController {

	@Autowired
	DanhMucServiceImpl danhMucServiceImpl;

	@Autowired
	MauSanPhamServiceImpl mauSanPhamServiceImpl;

	@Autowired
	SanPhamServiceImpl sanPhamServiceImpl;

	@RequestMapping("/themSanPham")
	public String ThemSanPham(Model model) {
		model.addAttribute("title", "Thêm sản phẩm");
		model.addAttribute("listmausanpham", mauSanPhamServiceImpl.getAllMauSanPhams());
		model.addAttribute("listdanhmuc", danhMucServiceImpl.getAllDanhMucs());
		return "admin/insertProduct";
	}

	@RequestMapping("/updateProduct")
	public String UpDateProDuctInit(Model model, @RequestParam("proId") int proId) {
		model.addAttribute("title", "Update sản phẩm");
		model.addAttribute("sanPham", sanPhamServiceImpl.getProductById(proId));
		model.addAttribute("listmausanpham", mauSanPhamServiceImpl.getAllMauSanPhams());
		model.addAttribute("listdanhmuc", danhMucServiceImpl.getAllDanhMucs());
		return "admin/updateProduct";
	}
	
	@RequestMapping("/deleteProduct")
	public String Delete(Model model, @RequestParam("proId") int proId, Integer offset, Integer maxResult) {
		model.addAttribute("title", "Update sản phẩm");
		Sanpham sanPham = sanPhamServiceImpl.getProductById(proId);
		sanPham.setStatus(0);
		sanPhamServiceImpl.updateProduct(sanPham);
		List<Sanpham> list = sanPhamServiceImpl.findAll(offset, maxResult);
		model.addAttribute("title", "Danh sách sản phẩm");
		model.addAttribute("listDanhMuc", danhMucServiceImpl.getAllDanhMucs());
		model.addAttribute("listMauSanPham", mauSanPhamServiceImpl.getAllMauSanPhams());
		model.addAttribute("listStu", list);
		model.addAttribute("offset", offset);
		model.addAttribute("count", sanPhamServiceImpl.getTotal());
		return "admin/danhsachsanpham";
	}

	@RequestMapping("/updateSanPham")
	public String UpDateProDuct(HttpServletRequest request,
			@RequestParam(name = "file1") MultipartFile file1,
			@RequestParam(name = "file2") MultipartFile file2, 
			@RequestParam(name = "file3") MultipartFile file3,
			@RequestParam(name = "file4") MultipartFile file4, 
			@RequestParam(name = "tensanpham") String tenSanPham,
			@RequestParam(name = "giagoc") Double giaGoc, 
			@RequestParam(name = "giaban") Double giaBan,
			@RequestParam(name = "giakhuyenmai") Double giaKhuyenMai, 
			@RequestParam(name = "baohanh") String baoHanh,
			@RequestParam(name = "motangan") String moTaNgan,
			@RequestParam(name = "motachitiet") String moTaChiTiet,
			@RequestParam(name = "danhmuc") int danhMuc, 
			@RequestParam(name = "mausanpham") int mauSanPham,
			@RequestParam("idsanpham") int proId, Integer offset, Integer maxResult, Model model) {

		Sanpham sanPham = sanPhamServiceImpl.getProductById(proId);
		Danhmucsanpham danhMucSanPham = new Danhmucsanpham();
		danhMucSanPham.setIddanhmuc(danhMuc);
		Mausanpham newMauSanPham = new Mausanpham();
		newMauSanPham.setIdmausanpham(mauSanPham);

		try {
			File newFile1 = new File(
					"C:\\Users\\Admin\\Documents\\workspace-spring-tool-suite-4-4.3.0.RELEASE\\bangiay\\src\\main\\webapp\\resources\\fontend\\anhsanpham\\"
							+ file1.getOriginalFilename());
			FileOutputStream fileOutputStream;
			fileOutputStream = new FileOutputStream(newFile1);
			fileOutputStream.write(file1.getBytes());
			sanPham.setImage1(file1.getOriginalFilename());
			fileOutputStream.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			File newFile2 = new File(
					"C:\\Users\\Admin\\Documents\\workspace-spring-tool-suite-4-4.3.0.RELEASE\\bangiay\\src\\main\\webapp\\resources\\fontend\\anhsanpham\\"
							+ file2.getOriginalFilename());
			FileOutputStream fileOutputStream;
			fileOutputStream = new FileOutputStream(newFile2);
			fileOutputStream.write(file2.getBytes());
			sanPham.setImage2(file2.getOriginalFilename());
			fileOutputStream.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			File newFile3 = new File(
					"C:\\Users\\Admin\\Documents\\workspace-spring-tool-suite-4-4.3.0.RELEASE\\bangiay\\src\\main\\webapp\\resources\\fontend\\anhsanpham\\"
							+ file3.getOriginalFilename());
			FileOutputStream fileOutputStream;
			fileOutputStream = new FileOutputStream(newFile3);
			fileOutputStream.write(file3.getBytes());
			sanPham.setImage3(file3.getOriginalFilename());
			fileOutputStream.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			File newFile4 = new File(
					"C:\\Users\\Admin\\Documents\\workspace-spring-tool-suite-4-4.3.0.RELEASE\\bangiay\\src\\main\\webapp\\resources\\fontend\\anhsanpham\\"
							+ file4.getOriginalFilename());
			FileOutputStream fileOutputStream;
			fileOutputStream = new FileOutputStream(newFile4);
			fileOutputStream.write(file4.getBytes());
			sanPham.setImage4(file4.getOriginalFilename());
			fileOutputStream.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		sanPham.setTensanpham(tenSanPham);
		sanPham.setGiagoc(giaGoc);
		sanPham.setGiaban(giaBan);
		sanPham.setGiakhuyenmai(giaKhuyenMai);
		sanPham.setBaohanh(baoHanh);
		sanPham.setMotangan(moTaNgan);
		sanPham.setMotachitiet(moTaChiTiet);
		sanPham.setIddanhmuc(danhMucSanPham);
		sanPham.setIdmausanpham(newMauSanPham);

		sanPhamServiceImpl.updateProduct(sanPham);

		List<Sanpham> list = sanPhamServiceImpl.findAll(offset, maxResult);
		model.addAttribute("title", "Danh sách sản phẩm");
		model.addAttribute("listDanhMuc", danhMucServiceImpl.getAllDanhMucs());
		model.addAttribute("listMauSanPham", mauSanPhamServiceImpl.getAllMauSanPhams());
		model.addAttribute("listStu", list);
		model.addAttribute("offset", offset);
		model.addAttribute("count", sanPhamServiceImpl.getTotal());

		return "admin/danhsachsanpham";
	}

	@RequestMapping(value = "/uploadSanPham", method = RequestMethod.POST)
	public String SanPham(HttpServletRequest request, 
			@RequestParam(name = "file1") MultipartFile file1,
			@RequestParam(name = "file2") MultipartFile file2,
			@RequestParam(name = "file3") MultipartFile file3,
			@RequestParam(name = "file4") MultipartFile file4, 
			@RequestParam(name = "tensanpham") String tenSanPham,
			@RequestParam(name = "giagoc") Double giaGoc, 
			@RequestParam(name = "giaban") Double giaBan,
			@RequestParam(name = "giakhuyenmai") Double giaKhuyenMai,
			@RequestParam(name = "baohanh") String baoHanh,
			@RequestParam(name = "motangan") String moTaNgan,
			@RequestParam(name = "motachitiet") String moTaChiTiet,
			@RequestParam(name = "danhmuc") int danhMuc,
			@RequestParam(name = "mausanpham") int mauSanPham,
			Integer offset, Integer maxResult, Model model) throws IOException {

						if (tenSanPham != null) {
							if (giaGoc != null) {
								if (giaBan != null) {
									if (baoHanh != null) {
										if (moTaNgan != null) {
											if (moTaChiTiet != null) {
												Sanpham sanPham = new Sanpham();
												Danhmucsanpham danhMucSanPham = new Danhmucsanpham();
												danhMucSanPham.setIddanhmuc(danhMuc);
												Mausanpham newMauSanPham = new Mausanpham();
												newMauSanPham.setIdmausanpham(mauSanPham);

												try {
													File newFile1 = new File(
															"C:\\Users\\Admin\\Documents\\workspace-spring-tool-suite-4-4.3.0.RELEASE\\bangiay\\src\\main\\webapp\\resources\\fontend\\anhsanpham\\"
																	+ file1.getOriginalFilename());
													FileOutputStream fileOutputStream;
													fileOutputStream = new FileOutputStream(newFile1);
													fileOutputStream.write(file1.getBytes());
													sanPham.setImage1(file1.getOriginalFilename());
													fileOutputStream.close();

												} catch (FileNotFoundException e) {
													e.printStackTrace();
												} catch (IOException e) {
													e.printStackTrace();
												}
												try {
													File newFile2 = new File(
															"C:\\Users\\Admin\\Documents\\workspace-spring-tool-suite-4-4.3.0.RELEASE\\bangiay\\src\\main\\webapp\\resources\\fontend\\anhsanpham\\"
																	+ file2.getOriginalFilename());
													FileOutputStream fileOutputStream;
													fileOutputStream = new FileOutputStream(newFile2);
													fileOutputStream.write(file2.getBytes());
													sanPham.setImage2(file2.getOriginalFilename());
													fileOutputStream.close();

												} catch (FileNotFoundException e) {
													e.printStackTrace();
												} catch (IOException e) {
													e.printStackTrace();
												}
												try {
													File newFile3 = new File(
															"C:\\Users\\Admin\\Documents\\workspace-spring-tool-suite-4-4.3.0.RELEASE\\bangiay\\src\\main\\webapp\\resources\\fontend\\anhsanpham\\"
																	+ file3.getOriginalFilename());
													FileOutputStream fileOutputStream;
													fileOutputStream = new FileOutputStream(newFile3);
													fileOutputStream.write(file3.getBytes());
													sanPham.setImage3(file3.getOriginalFilename());
													fileOutputStream.close();

												} catch (FileNotFoundException e) {
													e.printStackTrace();
												} catch (IOException e) {
													e.printStackTrace();
												}
												try {
													File newFile4 = new File(
															"C:\\Users\\Admin\\Documents\\workspace-spring-tool-suite-4-4.3.0.RELEASE\\bangiay\\src\\main\\webapp\\resources\\fontend\\anhsanpham\\"
																	+ file4.getOriginalFilename());
													FileOutputStream fileOutputStream;
													fileOutputStream = new FileOutputStream(newFile4);
													fileOutputStream.write(file4.getBytes());
													sanPham.setImage4(file4.getOriginalFilename());
													fileOutputStream.close();

												} catch (FileNotFoundException e) {
													e.printStackTrace();
												} catch (IOException e) {
													e.printStackTrace();
												}
												sanPham.setTensanpham(tenSanPham);
												sanPham.setGiagoc(giaGoc);
												sanPham.setGiaban(giaBan);
												sanPham.setGiakhuyenmai(giaKhuyenMai);
												sanPham.setBaohanh(baoHanh);
												sanPham.setMotangan(moTaNgan);
												sanPham.setMotachitiet(moTaChiTiet);
												sanPham.setIddanhmuc(danhMucSanPham);
												sanPham.setIdmausanpham(newMauSanPham);
												sanPham.setStatus(1);
												Date now = new Date();
												sanPham.setNgaynhap(now);
												sanPhamServiceImpl.addProduct(sanPham);

												List<Sanpham> list = sanPhamServiceImpl.findAll(offset, maxResult);
												model.addAttribute("title", "Danh sách sản phẩm");
												model.addAttribute("listDanhMuc", danhMucServiceImpl.getAllDanhMucs());
												model.addAttribute("listMauSanPham", mauSanPhamServiceImpl.getAllMauSanPhams());
												model.addAttribute("listStu", list);
												model.addAttribute("offset", offset);
												model.addAttribute("count", sanPhamServiceImpl.getTotal());
												return "admin/danhsachsanpham";

											} else {
												model.addAttribute("moTaChiTiet","Yêu cầu nhập mô tả chi tiết cho sản phẩm");
												model.addAttribute("title", "Thêm sản phẩm");
												model.addAttribute("listmausanpham", mauSanPhamServiceImpl.getAllMauSanPhams());
												model.addAttribute("listdanhmuc", danhMucServiceImpl.getAllDanhMucs());
												return "admin/insertProduct";
											}

										} else {
											model.addAttribute("maTaNgan", "Yêu cầu nhập mô tả ngắn cho sản phẩm");
											model.addAttribute("title", "Thêm sản phẩm");
											model.addAttribute("listmausanpham", mauSanPhamServiceImpl.getAllMauSanPhams());
											model.addAttribute("listdanhmuc", danhMucServiceImpl.getAllDanhMucs());
											return "admin/insertProduct";
										}
									} else {
										model.addAttribute("baoHanh", "Yêu cầu nhập bảo hành cho sản phẩm");
										model.addAttribute("title", "Thêm sản phẩm");
										model.addAttribute("listmausanpham", mauSanPhamServiceImpl.getAllMauSanPhams());
										model.addAttribute("listdanhmuc", danhMucServiceImpl.getAllDanhMucs());
										return "admin/insertProduct";
									}
								} else {
									model.addAttribute("giaBan", "Yêu cầu nhập giá bán sản phẩm");
									model.addAttribute("title", "Thêm sản phẩm");
									model.addAttribute("listmausanpham", mauSanPhamServiceImpl.getAllMauSanPhams());
									model.addAttribute("listdanhmuc", danhMucServiceImpl.getAllDanhMucs());
									return "admin/insertProduct";
								}
							} else {
								model.addAttribute("giaGoc", "Yêu cầu nhập giá gốc sản phẩm");
								model.addAttribute("title", "Thêm sản phẩm");
								model.addAttribute("listmausanpham", mauSanPhamServiceImpl.getAllMauSanPhams());
								model.addAttribute("listdanhmuc", danhMucServiceImpl.getAllDanhMucs());
								return "admin/insertProduct";
							}
						} else {
							model.addAttribute("tenSanPham", "Yêu cầu nhập tên sản phẩm");
							model.addAttribute("title", "Thêm sản phẩm");
							model.addAttribute("listmausanpham", mauSanPhamServiceImpl.getAllMauSanPhams());
							model.addAttribute("listdanhmuc", danhMucServiceImpl.getAllDanhMucs());
							return "admin/insertProduct";
						}
				} 
	}
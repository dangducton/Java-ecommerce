<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="/bangiay/admin">
                      <h3>Giày Nam BôniTôni</h3>              
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li class="has-sub">
                            <a class="js-arrow" href="/bangiay/admin">
                                <i class="fas fa-tachometer-alt"></i>Trang chủ</a>
                        </li>
                          <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-list-alt"></i>Quản lý sản phẩm</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="/bangiay/admin/themSanPham">Thêm sản phẩm</a>
                                </li>
                                <li>
                                    <a href="/bangiay/admin/danhsachsanpham">Danh sách sản phẩm</a>
                                </li>
                            </ul>
                        </li>
                         <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-female"></i>Quản lý người dùng</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                 <li>
                                    <a href="/bangiay/admin/themNguoiDung">Thêm người dùng</a>
                                </li>
                                <li>
                                    <a href="/bangiay/admin/danhSachNguoiDung">Danh sách người dùng</a>
                                </li>
                            </ul>
                        </li>
                          <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-eraser"></i>Danh sách nhập</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="/bangiay/admin/danhsachsanpham">Nhập chi tiết</a>
                                </li>
                                <li>
                                    <a href="/bangiay/admin/kiemTraTonKho">Kiểm tra số lượng đã bán và còn lại</a>
                                </li>
                                <li>
                                    <a href="/bangiay/admin/danhSachNhapChiTiet">Danh sách nhập chi tiết</a>
                                </li>
                            </ul>
                        </li>
                            <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-building"></i>Quản lý hóa đơn</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="/bangiay/admin/danhSachHoaDon">Danh sách đơn hàng</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-map-marker-alt"></i>Quản lý tin tức</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="/bangiay/admin/initNhapTinTuc">Thêm tin tức</a>
                                </li>
                                <li>
                                    <a href="/bangiay/admin/danhSachTinTuc">Quản lý tin tức</a>
                                </li>
                            </ul>
                        </li>
                           <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-envelope"></i>Quản lý comment</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                <a href="/bangiay/admin/comment">Danh sách comment</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
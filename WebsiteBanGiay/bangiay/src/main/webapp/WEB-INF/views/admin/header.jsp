<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="" method="POST">
                                <input class="au-input au-input--xl" type="text" name="search" placeholder="Tìm kiếm" />
                                <button class="au-btn--submit" type="submit">
                                    <i class="zmdi zmdi-search"></i>
                                </button>
                            </form>
                            <div class="header-button">
                                <div class="noti-wrap">
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-email"></i>
                                        <span class="quantity">${soSanPhamSapHet}</span>
                                        <div class="email-dropdown js-dropdown">
                                            <div class="email__title">
                                                <p>Sản phẩm sắp hết(Có ${soSanPhamSapHet} sản phẩm)</p>
                                            </div>
                                            <c:forEach var="listSanPhamSapHet" items="${listSanPhamSapHet}">
                                             <a href="/bangiay/admin/nhapThemSanPham?idSanpham=${listSanPhamSapHet[0]}&tenSize=${listSanPhamSapHet[4]}">
                                            <div class="email__item">
                                                <div class="image img-cir img-40">
                                                <img src="<c:url value="/files/${listSanPhamSapHet[2]}"/>" alt="">
                                                </div>
                                                <div class="content">
                                                    <p>${listSanPhamSapHet[1]} | ${listSanPhamSapHet[3]} | ${listSanPhamSapHet[4]} </p>
                                                    <span>Số lượng còn lại ${listSanPhamSapHet[7]}</span>
                                                </div>
                                            </div>
                                            </a>
                                            </c:forEach>
                                          
                                       
                                            <div class="email__footer">
                                                <a href="/bangiay/admin/kiemTraTonKho">Xem tất cả danh sách tồn kho</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-notifications"></i>
                                        <span class="quantity">${soHoaDonChuaXacDinh}</span>
                                        <div class="notifi-dropdown js-dropdown">
                                            <div class="notifi__title">
                                                <p>Đơn hàng mới(Có ${soHoaDonChuaXacDinh } đơn hàng mới)</p>
                                            </div>
                                            <c:forEach var="listHoaDonChuaXacDinh" items="${listHoaDonChuaXacDinh}">
                                            <div class="notifi__item">
                                                <div class="bg-c1 img-cir img-40">
                                                    <i class="zmdi zmdi-email-open"></i>
                                                </div>
                                                <a href="/bangiay/admin/chiTietHoaDon?hoaDonId=${listHoaDonChuaXacDinh.idhoadon}">
                                                <div class="content">
                                                    <p>Điện thoại: ${listHoaDonChuaXacDinh.dienthoai} </p>
                                                     <p>Tổng tiền: <fmt:formatNumber type = "number" value = "${listHoaDonChuaXacDinh.tongtien}"/> VNĐ</p> 
                                                     <p>Người mua: ${listHoaDonChuaXacDinh.iduser.tenuser} </p>
                                                     <p>Ngày mua: <span class="date">${listHoaDonChuaXacDinh.ngaytao}</span><p>
                                                </div>
                                               	 </a>
                                            </div>
                                            </c:forEach>
                                            <div class="notifi__footer">
                                                <a href="/bangiay/admin/danhSachHoaDon">Danh sách đơn hàng</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="content">
                                            <a class="js-acc-btn">${admin.tenuser}</a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="/bangiay/admin/chiTietNguoidung?iduser=${admin.iduser}">${admin.tenuser}</a>
                                                    </h5>
                                                    <span class="email">${admin.email}</span>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href="/bangiay/admin/chiTietNguoidung?iduser=${admin.iduser}">
                                                        <i class="zmdi zmdi-account"></i>Tài khoản</a>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__footer">
                                                <a href="/bangiay/">
                                                    <i class="zmdi zmdi-power"></i>Quay lại trang khách hàng</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
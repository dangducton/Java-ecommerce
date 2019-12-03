<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <title>${title }</title>
    <jsp:include page="head.jsp" flush="true"/>
</head>
<body>
    <div class="page-wrapper">
         <jsp:include page="header.jsp" flush="true"/>
 		 <jsp:include page="menu.jsp" flush="true"/>
        <div class="page-container">
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">Tổng quan</h2>
                                    <a class="au-btn au-btn-icon au-btn--blue" href="/bangiay/admin/themSanPham">
                                        <i class="zmdi zmdi-plus"></i>Thêm sản phẩm</a>
                                </div>
                            </div>
                        </div>
                        <div class="row m-t-25">
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c1">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-account-o"></i>
                                            </div>
                                            <div class="text">
                                                <h2>${tongNguoiDung }</h2>
                                                <span>Số người dùng</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c2">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-shopping-cart"></i>
                                            </div>
                                            <div class="text">
                                                <h2>${tongSanPham}</h2>
                                                <span>Số sản phẩm</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart2"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c3">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-calendar-note"></i>
                                            </div>
                                            <div class="text">
                                             <h2>${tongDonHang}</h2>
                                              <span>Số đơn hàng</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart3"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-money"></i>
                                            </div>
                                            <div class="text">
                                                <h2> <fmt:formatNumber type="number" value="${tongThuNhap}" /> VNĐ</h2>
                                                <span>Tổng thu nhập</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart4"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                                    <div class="au-card-title" style="background-image:url('./resources/admin/images/bg-title-01.jpg');">
                                        <div class="bg-overlay bg-overlay--blue"></div>
                                        <h3>
                                            <i class="zmdi zmdi-account-calendar"></i>Đơn hàng mới</h3>
                                        <button class="au-btn-plus">
                                            <i class="zmdi zmdi-plus"></i>
                                        </button>
                                    </div>
                                    <div class="au-task js-list-load">
                                        <div class="au-task__title">
                                            <p>Có ${soDonHangMoi} đơn hàng mới</p>
                                        </div>
                                        <div class="au-task-list js-scrollbar3">
                                            <c:forEach var="danhSachDonHangMoi" items="${danhSachDonHangMoi}">
                                            <div class="au-task__item au-task__item--danger">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task">
                                                        <a href="/bangiay/admin/chiTietHoaDon?hoaDonId=${danhSachDonHangMoi.idhoadon}">
                                                        <p>Người mua: ${danhSachDonHangMoi.iduser.tenuser}</p>
                                                        <p>Số tiền: <fmt:formatNumber type = "number" value = "${danhSachDonHangMoi.tongtien}"/> VNĐ </p>
                                                        <p>Số điện thoại: ${danhSachDonHangMoi.dienthoai} </p>
                                                        </a>
                                                    </h5>
                                                    <span class="time">Ngày giờ mua: ${danhSachDonHangMoi.ngaytao}</span>
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </div>
                                        <div class="au-task__footer">
                                            <button><a href="/bangiay/admin/danhSachHoaDon">Danh sách đơn hàng</a></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                                    <div class="au-card-title" style="background-image:url('./resources/admin/images/bg-title-02.jpg');">
                                        <div class="bg-overlay bg-overlay--blue"></div>
                                        <h3>
                                            <i class="zmdi zmdi-comment-text"></i>Thông báo hệ thống</h3>
                                        <button class="au-btn-plus">
                                            <i class="zmdi zmdi-plus"></i>
                                        </button>
                                    </div>
                                    <div class="au-inbox-wrap js-inbox-wrap">
                                        <div class="au-message js-list-load">
                                            <div class="au-message__noti">
                                                <p>Bạn có
                                                    <span>${soSanPhamSapHet}</span> sản phẩm sắp hết
                                                </p>
                                            </div>
                                            <div class="au-message-list">
                                                <c:forEach var="sanPhamSapHet" items="${sanPhamSapHet}">
                                                <a href="/bangiay/admin/nhapThemSanPham?idSanpham=${sanPhamSapHet[0]}&tenSize=${sanPhamSapHet[4]}">
                                                <div>
                                                    <div class="au-message__item-inner">
                                                        <div class="au-message__item-text">
                                                            <div class="avatar-wrap">
                                                                <div class="image img-cir img-40">
                                                                <img src="<c:url value="/files/${sanPhamSapHet[2]}"/>" alt="">
                                                                </div>
                                                            </div>
                                                            <div class="text">
                                                                <h5 class="name">${sanPhamSapHet[1]}</h5>
                                                                <p>Màu: ${sanPhamSapHet[3]} |Size: ${sanPhamSapHet[4]}</p>
                                                            </div>
                                                        </div>
                                                        <div class="au-message__item-time">
                                                            <span>Còn ${sanPhamSapHet[7]} sản phẩm</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                </a>
                                                </c:forEach>
                                            </div>
                                            <div class="au-task__footer"">
                                                <button><a href="/bangiay/admin/kiemTraTonKho">Kiểm tra tồn kho</a></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       <jsp:include page="footer.jsp" flush="true"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="<c:url value="/resources/admin/vendor/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/vendor/bootstrap-4.1/popper.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/vendor/bootstrap-4.1/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/vendor/slick/slick.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/vendor/wow/wow.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/vendor/animsition/animsition.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/vendor/counter-up/jquery.waypoints.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/vendor/counter-up/jquery.counterup.min.js"/>"></script>
 	<script src="<c:url value="/resources/admin/vendor/circle-progress/circle-progress.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/vendor/perfect-scrollbar/perfect-scrollbar.js"/>"></script>
    <script src="<c:url value="/resources/admin/vendor/chartjs/Chart.bundle.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/vendor/select2/select2.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/js/main.js"/>"></script>
</body>

</html>


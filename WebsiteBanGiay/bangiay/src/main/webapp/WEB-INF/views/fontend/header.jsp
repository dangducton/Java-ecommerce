<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet" />
<link href="<c:url value="/resources/fontend/css/bootstrap.min.css"/>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/fontend/css/slick.css"/>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/fontend/css/slick-theme.css"/>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/fontend/css/nouislider.min.css"/>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/fontend/css/font-awesome.min.css"/>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/fontend/css/style.css"/>"
	rel="stylesheet" type="text/css" />
<link href="//cdn.nhanh.vn/cdn/store/19330/store_1503659479_292.jpg"
	rel="shortcut icon" type="image/vnd.microsoft.icon" />
<script src="<c:url value="/resources/fontend/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/fontend/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/fontend/js/slick.min.js"/>"></script>
<script src="<c:url value="/resources/fontend/js/nouislider.min.js"/>"></script>
<script src="<c:url value="/resources/fontend/js/jquery.zoom.min.js"/>"></script>
<script src="<c:url value="/resources/fontend/js/main.js"/>"></script>

</head>
<header>
	<div id="top-header">
		<div class="container">
			<ul class="header-links pull-left">
				<li><a href="#"><i class="fa fa-phone"></i>+84366640630</a></li>
				<li><a href="#"><i class="fa fa-envelope-o"></i>dangducton@gmail.com</a></li>
				<li><a href="#"><i class="fa fa-map-marker"></i>73 Minh
						Đăng - Văn Bàn - Lào Cai</a></li>
			</ul>
			<ul class="header-links pull-right">

				<%
					if (session.getAttribute("tennguoidung") == null) {
				%>
						<li><a href="/bangiay/pageLogin"><i class="fa fa-user-o"></i>
						Đăng nhập</a></li>
						<li><a href="/bangiay/pageDangKy"><i class="fa fa-sign-in"></i>
						Đăng ký</a></li>
				<%
					}
				%>


				<%
					if (session.getAttribute("quanTriWeb") != null) {
				%>
				<li><a href="/bangiay/admin"><i
						class="fa fa-tachometer"></i><%=session.getAttribute("quanTriWeb")%></a></li>
				<li><a href="/bangiay/thongTinKhachHang"><i class="fa fa-bars"></i>
						<%=session.getAttribute("thongTinTaiKhoan")%></a></li>
				<%
					}
				%>

				<%
					if (session.getAttribute("thongTinTaiKhoan") != null && session.getAttribute("quanTriWeb") == null) {
				%>
				<li><a href="/bangiay/thongTinKhachHang"><i class="fa fa-bars"></i>
						<%=session.getAttribute("thongTinTaiKhoan")%></a></li>
				<%
					}
				%>

				<%
					if (session.getAttribute("tennguoidung") != null) {
				%>
				<li><a href="/bangiay/thongTinKhachHang"><i class="fa fa-user-o"></i>Xin
						chào <b><%=session.getAttribute("tennguoidung")%></b></a></li>
				<%
					}
				%>

				<%
					if (session.getAttribute("tennguoidung") != null) {
				%>
				<li><a href="/bangiay/logout"><i class="fa fa-sign-out"></i>Thoát</a></li>
				<%
					}
				%>

			</ul>
		</div>
	</div>
	<div id="header">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="header-logo">
						<a href="#" class="logo"> <img
							src="./resources/fontend/img/lg1.png" alt="" width="120"
							height="60">
						</a>
					</div>
				</div>
				<div class="col-md-6">
					<div class="header-search">
						<form action="timKiemTatCa" method="get">
							<input class="input" name="noiDungTimKiem"  placeholder="Tìm kiếm">
							<button type="submit" class="search-btn">Tìm Kiếm</button>
						</form>
					</div>
				</div>
				<div class="col-md-3 clearfix">
					<div class="header-ctn">
						<div class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown"
								aria-expanded="true"> <i class="fa fa-shopping-cart"></i> <span>Giỏ
									hàng</span>
								   <%
								 	if (session.getAttribute("soluonggiohang") != null) {
								   %>
											<div class="qty"><%=session.getAttribute("soluonggiohang")%></div>
											<%
											}
											%> <%
								 	if (session.getAttribute("soluonggiohang") == null) {
								  %>
											<div class="qty">0</div> <%
								 	}
								  %>

							</a>
							<div class="cart-dropdown">
								<div class="cart-list">

									<c:forEach var="giohang" items="${gioHangSession}">
										<div class="product-widget">
											<div class="product-img">
												<img  
													src="<c:url value="/files/${giohang.idsanpham.image1}"/>"
													alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name">
													<a href="#">${giohang.idsanpham.tensanpham}</a>
												</h3>
												<h4 class="product-price">
													<span class="qty">${giohang.soluong} x</span>
													<fmt:formatNumber type="number" value="${giohang.sotien}" />
													VNĐ
												</h4>
											</div>
										</div>
									</c:forEach>

								</div>
								<div class="cart-summary">
									<small>Có ${soluonggiohang} sản phẩm trong giỏ hàng</small>
									<c:set var="total" value="${0}" />
									<c:forEach var="gioHangSession" items="${gioHangSession}">
										<c:set var="total" value="${total + gioHangSession.sotien}" />
									</c:forEach>
									<h5>
										Tổng số tiền là:
										<fmt:formatNumber type="number" value="${total}" />
										VNĐ
									</h5>
									<div class="cart-btns">
									<a href="/bangiay/viewGioHang">Xem giỏ hàng</a> <a href="viewThanhToan">Thanh toán<i
										class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="menu-toggle">
							<a href="#"> <i class="fa fa-bars"></i> <span>Menu</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
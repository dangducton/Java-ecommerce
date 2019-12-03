<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title> ${title}</title>
    </head>
 <jsp:include page="header.jsp" flush="true"/>
 <nav id="navigation">
			<div class="container">
				<div id="responsive-nav">
					<ul class="main-nav nav navbar-nav">
						<li><a href="/bangiay/home">Trang chủ</a></li>
						<li><a href="/bangiay/danhsachsanpham">Sản phẩm</a></li>
						<li><a href="#">Bộ sưu tập</a></li>
						<li><a href="/bangiay/danhsachtintuc">Tin tức</a></li>
						<li><a href="#">Khuyến mãi</a></li>
						<li><a href="#">Hệ thống cửa hàng</a></li>
					</ul>
				</div>
			</div>
		</nav>

	<div id="breadcrumb" class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Thanh toán</h3>
						<ul class="breadcrumb-tree">
							<li><a href="#">Trang chủ</a></li>
							<li class="active">Thanh toán</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="section">
			<div class="container">
			<form action="/bangiay/checkOutDonHang" method="POST">
				<div class="row">
					<div class="col-md-7">
						<div class="billing-details">
							<h4 class="title" style="color: red;text-align: center">${gioHangDangTrong }</h4>
							<div class="section-title">
								<h3 class="title">Địa chỉ của bạn</h3>
							</div>
							<div class="form-group">
								<input class="input" type="text" placeholder="Tên người nhận" value="${thongtinnguoidung.tenuser}" disabled>
							</div>
							<div class="form-group">
								<input class="input" type="text" placeholder="Email" value="${thongtinnguoidung.email}" disabled>
							</div>
							<div class="form-group">
								<input class="input" type="text" placeholder="Địa chỉ" value="${thongtinnguoidung.diachi}" disabled>
							</div>
							<div class="form-group">
								<input class="input" type="text" placeholder="Điện thoại" value="${thongtinnguoidung.dienthoai}" disabled>
							</div>
						</div>
						<div class="shiping-details">
							<div class="section-title">
								<h3 class="title">Địa chỉ khác </h3>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="shiping-address" name="checkbox">
								<label for="shiping-address">
									<span></span>
									Gửi đến địa chỉ khác?
								</label>
								<div class="caption">
								<div class="form-group">
									<input class="input" type="text" name="tenNguoiDung" placeholder="Tên người nhận">
									<p style="color: red">${falseTenNguoiDung}</p>
								</div>
								<div class="form-group">
									<input class="input" type="text" name="email" placeholder="Email">
									<p style="color: red">${falseEmail}</p>
								</div>
								<div class="form-group">
									<input class="input" type="text" name="diaChi" placeholder="Địa chỉ">
									<p style="color: red">${falseDiaChi}</p>
								</div>
								<div class="form-group">
									<input class="input" type="text" name="dienThoai" placeholder="Điện thoại">
									<p style="color: red">${falseDienThoai}</p>
								</div>
								</div>
							</div>
						</div>
						<div class="order-notes">
							<textarea class="input" placeholder="Nhắc nhở?" name="note"></textarea>
						</div>
					</div>

					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">Giỏ hàng</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>Sản phẩm</strong></div>
								<div><strong>Giá tiền</strong></div>
							</div>
							<div class="order-products">
								<c:forEach items="${giohang}" var="giohang">
								<div class="order-col">
									<div>${giohang.soluong} x ${giohang.idsanpham.tensanpham}</div>
									<div><fmt:formatNumber type = "number" value = "${giohang.sotien}"/>VNĐ</div>
								</div>
								</c:forEach>
							</div>
							<div class="order-col">
								<c:set var="total" value="${0}"/>
									<c:forEach var="giohang" items="${giohang}">
										<c:set var="total" value="${total + giohang.sotien}" />
									</c:forEach>
								<div><strong>Tổng số tiền</strong></div>
								<input type="hidden" type="number" value="${total}" name="total"></input>
								<div><strong class="order-total"><fmt:formatNumber type = "number" value = "${total}"/>VNĐ</strong></div>
							</div>
						</div>
						<button type="submit" class="primary-btn order-submit">Thanh toán</button>
					</div>
				</div>
				</form>
			</div>
		</div>
		
		<jsp:include page="footer.jsp" flush="true"/>
		<script src="<c:url value="/resources/fontend/js/jquery.min.js"/>"></script>
		<script src="<c:url value="/resources/fontend/js/bootstrap.min.js"/>"></script>
		<script src="<c:url value="/resources/fontend/js/slick.min.js"/>"></script>
		<script src="<c:url value="/resources/fontend/js/nouislider.min.js"/>"></script>
		<script src="<c:url value="/resources/fontend/js/jquery.zoom.min.js"/>"></script>
		<script src="<c:url value="/resources/fontend/js/main.js"/>"></script>
		<script src="<c:url value="/resources/fontend/js/jquery.min.js"/>"></script>
		<script src="<c:url value="/resources/fontend/js/bootstrap.min.js"/>"></script>
		<script src="<c:url value="/resources/fontend/js/slick.min.js"/>"></script>
		<script src="<c:url value="/resources/fontend/js/nouislider.min.js"/>"></script>
		<script src="<c:url value="/resources/fontend/js/jquery.zoom.min.js"/>"></script>
		<script src="<c:url value="/resources/fontend/js/main.js"/>"></script>
</html>
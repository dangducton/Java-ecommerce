<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="mytag1" uri="/WEB-INF/tlds/MyCusTag2.tld" %>
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
				<div class="row">
					<div class="col-md-5 order-details">
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Thông tin của bạn</h3>
							</div>
							<div class="form-group">
								<b>Họ tên:</b><input class="input" type="text" placeholder="Tên người nhận" value="${thongtinnguoidung.tenuser}" disabled>
							</div>
							<div class="form-group">
								<b>Email:</b><input class="input" type="text" placeholder="Email" value="${thongtinnguoidung.email}" disabled>
							</div>
							<div class="form-group">
								<b>Địa chỉ:</b><input class="input" type="text" placeholder="Địa chỉ" value="${thongtinnguoidung.diachi}" disabled>
							</div>
							<div class="form-group">
								<b>Điện thoại:</b><input class="input" type="text" placeholder="Điện thoại" value="${thongtinnguoidung.dienthoai}" disabled>
							</div>
						</div>
						<button type="submit" class="primary-btn order-submit"><a href="/bangiay/initUpdateThongTin" style="color: white">Cập nhật thông tin </a></button>
					</div>

					<div class="col-md-7">
						<div class="section-title text-center">
							<h3 class="title">Sản phẩm đã mua</h3>
						</div>
						<div class="order-summary">
							<div class="order-products">
								<table class="table">
									  <thead>
									    <tr>
									      <th scope="col">Tên sản phẩm</th>
									      <th scope="col">Ảnh sản phẩm</th>
									      <th scope="col">Size sản phẩm</th>
									      <th scope="col">Số lượng</th>
									      <th scope="col">Đơn giá</th>
									      <th scope="col">Thành tiền</th>
									    </tr>
									  </thead>
									  <tbody>
									  <c:forEach items="${chitiethonhang}" var="chitiethonhang">
									    <tr>
									      <td><b>${chitiethonhang.idsanpham.tensanpham}</b></td>
									      <td><img src="<c:url value="/files/${chitiethonhang.idsanpham.image1}"/>"  width="100" height="100"></td>
									      <td><b>${chitiethonhang.idsizesanpham.tensize}</b></td>
									      <td><b>${chitiethonhang.soluong}</b></td>
									      <td><b><fmt:formatNumber type = "number" value = "${chitiethonhang.giatien}"/> VNĐ</b></td>
									      <td><b><fmt:formatNumber type = "number" value = "${chitiethonhang.sotien}"/> VNĐ</b></td>
									    </tr>
									   </c:forEach>
									  </tbody>
									</table>
						</div>
						 <mytag1:ClassPaginationTag max="5" offset="${offset}" count="${count}" uri="/bangiay/thongTinKhachHang?" next="&raquo;" previous="&laquo;"/>
					</div>
				</div>
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
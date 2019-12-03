<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title> Giỏ hàng</title>
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
						<h3 class="breadcrumb-header">Giỏ hàng</h3>
						<ul class="breadcrumb-tree">
							<li><a href="#">Trang chủ</a></li>
							<li class="active">Giỏ hàng</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="section">
			<div class="container">
				<div class="row">
				<h6> ${status }</h6>
				<h4 style="color: red;text-align: center;"> ${falseThanhToan}</h4>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">Mã sản phẩm</th>
					      <th scope="col">Tên sản phẩm</th>
					      <th scope="col">Đơn giá</th>
					      <th scope="col">Số lượng</th>
					      <th scope="col">Thành tiền</th>
					      <th scope="col"></th>
					      <th scope="col"></th>
					    </tr>
					  </thead>
					  <tbody>
					    <c:forEach items="${giohang}" var="giohang">
					   <tr>
					      <th scope="col"><b>${giohang.idsanpham.idsanpham}</b></th>
					      <td scope="col"><img src="<c:url value="/files/${giohang.idsanpham.image1}"/>" height='100' width='100' alt=""><b>${giohang.idsanpham.tensanpham}|${giohang.idsizesanpham.tensize}|${giohang.idsanpham.idmausanpham.tenmau}</b></td>
					      <td scope="col"><b><fmt:formatNumber type = "number" value = "${giohang.idsanpham.giakhuyenmai}"/> </b>VNĐ</td>
					      <form action="/bangiay/updateGioHang?chiTietGioHangId=${giohang.idchitiethoadon}" method="POST">
					      <td scope="col"><input type="number" name="number" value="${giohang.soluong}" min="1" max="10" style="text-align: center;color: red;width: 50px;font:bold"></input></td>
					      <td scope="col"><b><fmt:formatNumber type = "number" value = "${giohang.sotien}"/></b> VNĐ</td>
					      <td scope="col"><button type="submit"><b style="text-align: center;color: red;">Sửa</b></button></td>
					      </form>
					      <td scope="col"><a href="/bangiay/deleteGioHang?chiTietGioHangId=${giohang.idchitiethoadon}"> <b style="text-align: center;color: red;">Xóa</b> </a></td> 
					    </tr>
					    </c:forEach>
					  </tbody>
					</table>
					<c:set var="total" value="${0}"/>
						<c:forEach var="giohang" items="${giohang}">
						<c:set var="total" value="${total + giohang.sotien}" />
					</c:forEach>
				
					<h3 style="float: right;">Tổng tiền:<b style="color: red;"><fmt:formatNumber value = "${total}"/>VNĐ</b></h3>
			  </div>
			  <div style="float: right;">
			    <a href="/bangiay/viewThanhToan" class="btn btn-info"> <b>Thanh toán</b></a>
			    <a href="/bangiay/danhsachsanpham" class="btn btn-success"> <b>Tiếp tục mua sắm</b></a>
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
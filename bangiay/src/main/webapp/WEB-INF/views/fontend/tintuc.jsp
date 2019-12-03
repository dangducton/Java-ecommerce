<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="mytag" uri="/WEB-INF/tlds/MyCustomTag.tld" %>
<%@taglib prefix="mytag1" uri="/WEB-INF/tlds/MyCusTag1.tld" %>
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
						<li><a href="/bangiay/">Trang chủ</a></li>
						<li><a href="/bangiay/danhsachsanpham">Sản phẩm</a></li>
						<li><a href="#">Bộ sưu tập</a></li>
						<li  class="active"><a href="/bangiay/danhsachtintuc">Tin tức</a></li>
						<li><a href="#">Khuyến mãi</a></li>
						<li><a href="#">Hệ thống cửa hàng</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="section">
			<div class="container">
				<div class="row">
					<div id="aside" class="col-md-3">
						<div class="aside">
							<h3 class="aside-title">Danh mục</h3>
							<div class="checkbox-filter">
								<c:forEach items="${danhmuc}" var="danhmuc">
								<a href="/bangiay/sanphamdanhmuc?danhMucId=${danhmuc.iddanhmuc}">
								<div class="input-checkbox">
									<label for="category-1">
										<b>${danhmuc.tendanhmuc}</b>
									</label>
								</div>
								</a>
								</c:forEach>
							</div>
						</div>
						<div class="aside">
							<h3 class="aside-title">Tìm kiếm</h3>
							<form action="timKiemSanPhamTheoGia" method="get">
							<div class="price-filter">
								<input class="input" type="number" name="giaBatDau" placeholder="Nhập giá bắt đầu">
								<input class="input" type="number" name="giaKetThuc" placeholder="Nhập giá kết thúc">
								<button type="submit" style="background-color: White">Tìm kiếm</button>
							</div>
							</form>
						</div>
						<div class="aside">
							<h3 class="aside-title">Màu sắc</h3>
							<div class="checkbox-filter">
							<c:forEach items="${mausac}" var="mausac">
								<a href="/bangiay/sanphammausac?mauSacId=${mausac.idmausanpham}">
								<div class="input-checkbox">
									<label for="brand-1">
									<b>${mausac.tenmau}</b>
									</label>
								</div>
								</a>
								</c:forEach>
							</div>
						</div>
						<div class="aside">
							<h3 class="aside-title">Sản Phẩm Mới Nhất</h3>
							<c:forEach items="${productdetaildanhmuc}" var="productdetaildanhmuc">
							<div class="product-widget">
								<a href="/bangiay/chitietsanpham?proId=${productdetaildanhmuc.idsanpham}&danhmucId=${productdetaildanhmuc.iddanhmuc.iddanhmuc}">
								<div class="product-img">
									<img src="<c:url value="/files/${productdetaildanhmuc.image1}"/>" alt="">
								</div>
								</a>
								<a href="/bangiay/chitietsanpham?proId=${productdetaildanhmuc.idsanpham}&danhmucId=${productdetaildanhmuc.iddanhmuc.iddanhmuc}">
								<div class="product-body">
									<p class="product-category">${productdetaildanhmuc.iddanhmuc.tendanhmuc}</p>
									<h3 class="product-name"><a href="#">${productdetaildanhmuc.tensanpham}</a></h3>
									<h4 class="product-price">
												<fmt:formatNumber type = "number" value = "${productdetaildanhmuc.giakhuyenmai}"/> VNĐ
												 <del class="product-old-price"> <fmt:formatNumber type = "number" value = "${productdetaildanhmuc.giaban}"/> VNĐ
												 </del></h4>
									</div>
								</a>
							</div>
							</c:forEach>
							
						</div>
					</div>

					<div id="store" class="col-md-9">
						<div class="row">
						<h3>${tintuc.tentintuc}</h3>
						<b>${tintuc.motangan}</b>
						<p>${tintuc.ngaytao}</p>
						<p>${tintuc.noidung}</p>
					</div>
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
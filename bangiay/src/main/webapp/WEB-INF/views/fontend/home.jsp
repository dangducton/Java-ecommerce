<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title> ${title} </title>
    </head>
 <jsp:include page="header.jsp" flush="true"/>
		<nav id="navigation">
			<div class="container">
				<div id="responsive-nav">
					<ul class="main-nav nav navbar-nav">
						<li class="/bangiay/home"><a href="#">Trang chủ</a></li>
						<li><a href="/bangiay/danhsachsanpham">Sản phẩm</a></li>
						<li><a href="#">Bộ sưu tập</a></li>
						<li><a href="/bangiay/danhsachtintuc">Tin tức</a></li>
						<li><a href="#">Khuyến mãi</a></li>
						<li><a href="#">Hệ thống cửa hàng</a></li>
					</ul>
				</div>
			</div>
		</nav>
		
		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">Sneaker Mới Nhất</h3>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<div id="tab2" class="tab-pane fade in active">
									<div class="products-slick" data-nav="#slick-nav-2">
										<c:forEach items="${giaysneaker}" var="giaysneaker">
										<div class="product">
											<a href="/bangiay/chitietsanpham?proId=${giaysneaker.idsanpham}&danhmucId=${giaysneaker.iddanhmuc.iddanhmuc}">
											<div class="product-img">
											<img src="<c:url value="/files/${giaysneaker.image1}"/>" alt="">
												<div class="product-label">
													<span class="sale">- ${(giaysneaker.giaban - giaysneaker.giakhuyenmai) / (giaysneaker.giaban / 100 )}%</span>
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">${giaysneaker.iddanhmuc.tendanhmuc}</p>
												<h3 class="product-name"><a href="#">${giaysneaker.tensanpham}</a></h3>
												<h4 class="product-price">
												<fmt:formatNumber type = "number" value = "${giaysneaker.giakhuyenmai}"/> VNĐ
												 <del class="product-old-price"> <fmt:formatNumber type = "number" value = "${giaysneaker.giaban}"/> VNĐ
												 </del></h4>
											</div>
											</a>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Thêm giỏ hàng</button>
											</div>
										</div>
										</c:forEach>
									</div>
									<div id="slick-nav-2" class="products-slick-nav"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">Giày Lười Mới Nhất</h3>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<div id="tab2" class="tab-pane fade in active">
									<div class="products-slick" data-nav="#slick-nav-2">
										<c:forEach items="${giayluoi}" var="giayluoi">
										<div class="product">
										<a href="/bangiay/chitietsanpham?proId=${giayluoi.idsanpham}&danhmucId=${giayluoi.iddanhmuc.iddanhmuc}">
											<div class="product-img">
											<img src="<c:url value="/files/${giayluoi.image1}"/>" alt="">
												<div class="product-label">
													<span class="sale">- ${(giayluoi.giaban - giayluoi.giakhuyenmai) / (giayluoi.giaban / 100 )}%</span>
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">${giayluoi.iddanhmuc.tendanhmuc}</p>
												<h3 class="product-name"><a href="#">${giayluoi.tensanpham}</a></h3>
												<h4 class="product-price">
												<fmt:formatNumber type = "number" value = "${giayluoi.giakhuyenmai}"/> VNĐ
												<del class="product-old-price">
												<fmt:formatNumber type = "number" value = "${giayluoi.giaban}"/> VNĐ
												</del></h4>
											</div>
											</a>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Thêm giỏ hàng</button>
											</div>
										</div>
										</c:forEach>
									</div>
									<div id="slick-nav-2" class="products-slick-nav"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">Giày Tây Mới Nhất</h3>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<div id="tab2" class="tab-pane fade in active">
									<div class="products-slick" data-nav="#slick-nav-2">
										<c:forEach items="${giaytay}" var="giaytay">
										<div class="product">
										<a href="/bangiay/chitietsanpham?proId=${giaytay.idsanpham}&danhmucId=${giaytay.iddanhmuc.iddanhmuc}">
											<div class="product-img">
											<img src="<c:url value="/files/${giaytay.image1}"/>" alt="">
												<div class="product-label">
													<span class="sale">- ${(giaytay.giaban - giaytay.giakhuyenmai) / (giaytay.giaban / 100 )}%</span>
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">${giaytay.iddanhmuc.tendanhmuc}</p>
												<h3 class="product-name"><a href="#">${giaytay.tensanpham}</a></h3>
												<h4 class="product-price">
												<fmt:formatNumber type = "number" value = "${giaytay.giakhuyenmai}"/> VNĐ
												<del class="product-old-price">
												<fmt:formatNumber type = "number" value = "${giaytay.giaban}"/> VNĐ
												</del></h4>
											</div>
											</a>
											<div class="add-to-cart">
												<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Thêm giỏ hàng</button>
											</div>
										</div>
										</c:forEach>
									</div>
									<div id="slick-nav-2" class="products-slick-nav"></div>
								</div>
							</div>
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="mytag1" uri="/WEB-INF/tlds/MyCusTag2.tld" %>
 <!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title> ${product.tensanpham}|${product.idmausanpham.tenmau	}  </title>
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
		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-5 col-md-push-2">
						<div id="product-main-img">
							<div class="product-preview">
								<img src="<c:url value="/files/${product.image1}"/>" alt="">
							</div>
							<div class="product-preview">
							<img src="<c:url value="/files/${product.image2}"/>" alt="">
							</div>
							<div class="product-preview">
							<img src="<c:url value="/files/${product.image3}"/>" alt="">
							</div>

							<div class="product-preview">
							<img src="<c:url value="/files/${product.image4}"/>" alt="">
							</div>
						</div>
					</div>
					<div class="col-md-2  col-md-pull-5">
						<div id="product-imgs">
							<div class="product-preview">
							<img src="<c:url value="/files/${product.image1}"/>" alt="">
							</div>
							<div class="product-preview">
							<img src="<c:url value="/files/${product.image2}"/>" alt="">
							</div>
							<div class="product-preview">
							<img src="<c:url value="/files/${product.image3}"/>" alt="">
							</div>
							<div class="product-preview">
							<img src="<c:url value="/files/${product.image4}"/>" alt="">
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="product-details">
							<h3 class="product-price"> ${thankDetailId}</h3>
							<h3 class="product-price"> ${thankNoId}</h3>
							<form action = "/bangiay/gioHang/" method="POST">
							<input type="hidden" type="number" value="${product.idsanpham}" name="product.idsanpham"></input>
							<h2 class="product-name">${product.tensanpham} ${product.idmausanpham.tenmau}</h2>
							<div>
								<h3 class="product-price"><fmt:formatNumber type = "number" value = "${product.giakhuyenmai}"/> VNĐ <del class="product-old-price"><fmt:formatNumber type = "number" value = "${product.giaban}"/> VNĐ</del></h3>
								<p class="product-available">Thông tin sản phẩm</p>
							</div>
							<p>${product.motangan}</p>

							<div class="product-options">
								<label>
									Size
									<select class="input-select" name='size'>
										<c:forEach items="${size}" var="size">
										<option value="${size[0]}">${size[0]}</option>
										</c:forEach>
									</select>
								</label>
							</div>
							<div class="add-to-cart">
								<div class="qty-label">
									Qty
									<input type="number" name="number" min="1" value="1" max="10" step="1" style="width: 90px;height: 42px;text-align: center;">
								</div>
								<button type="submit" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm giỏ hàng</button>
							</div>
							</form>
						</div>
					</div>
					<div class="col-md-12">
						<div id="product-tab">
							<ul class="tab-nav">
								<li class="active"><a data-toggle="tab" href="#tab1">Thông tin chi tiết</a></li>
								<li><a data-toggle="tab" href="#tab2">Bảo hành</a></li>
								<li><a data-toggle="tab" href="#tab3">Nhận Xét</a></li>
							</ul>
							<div class="tab-content">
								<div id="tab1" class="tab-pane fade in active">
									<div class="row">
										<div class="col-md-12">
											<p>${product.motachitiet}</p>
										</div>
									</div>
								</div>
								<div id="tab2" class="tab-pane fade in">
									<div class="row">
										<div class="col-md-12">
											<p>${product.baohanh}</p>
										</div>
									</div>
								</div>
								<div id="tab3" class="tab-pane fade in">
									<div class="row">
										<div class="col-md-6">
											<div id="reviews">
												<ul class="reviews">
												   <c:forEach items="${listComment}" var="listComment">
												   <li>
														<div class="review-heading">
															<h5 class="name">${listComment.hoten}</h5>
															<p class="date">${listComment.ngaycomment}</p>
														</div>
														<div class="review-body">
															<p>${listComment.noidung}</p>
														</div>
													</li>
													</c:forEach>
												</ul>
											</div>
											 <mytag1:ClassPaginationTag max="5" offset="${offset}" count="${count}" uri="/bangiay/chitietsanpham?proId=${idsanpham}&danhmucId=${idanhmuc}&" next="&raquo;" previous="&laquo;"/>
										</div>

										<div class="col-md-3">
											<div id="review-form">
												<c:if test="${inforNguoidung != null}">
												<form action="/bangiay/guiNhanXetTheoId" class="review-form">
												<input class="input" type="hidden" name="proId" value="${product.idsanpham}">
												<input class="input" type="hidden" name="danhmucId" value="${product.iddanhmuc.iddanhmuc}">
													<input class="input" type="hidden" name="tenNguoiDung" value="${inforNguoidung.tenuser}">
													<input class="input" type="hidden" name="emaiNguoiDung" value="${inforNguoidung.email}">
													<input class="input" type="text" value="${inforNguoidung.tenuser}" disabled>
													<input class="input" type="email" value="${inforNguoidung.email}" disabled>
													<textarea class="input" name="nhanXet" placeholder="Nhận xét"></textarea>
													<p style="color: red"> ${nhanXet}</p>
													<button class="primary-btn"> Nhận xét</button>
													</form>
												</c:if>
												
												<c:if test="${inforNguoidung == null}">
												<form action="/bangiay/guiNhanXetKhongTheoId" class="review-form">
												<input class="input" type="hidden" name="proId" value="${product.idsanpham}">
												<input class="input" type="hidden" name="danhmucId" value="${product.iddanhmuc.iddanhmuc}">
													<input class="input" type="text" name="hoVaTen" placeholder="Họ và tên">
													<p style="color: red">${hoVaTen}</p>
													<input class="input" type="email" name="email" placeholder="Email">
													<p style="color: red">${email}</p>
													<textarea class="input" name="nhanXet" placeholder="Nhận xét"></textarea>
													<p style="color: red">${nhanXet}</p>
													<button class="primary-btn"> Nhận xét</button>
													</form>
												</c:if>
											</div>
										</div>
									</div>
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
						<div class="section-title text-center">
							<h3 class="title">Sản Phẩm Liên Quan</h3>
						</div>
					</div>
					<c:forEach items="${listproduct}" var="listproduct">
					<div class="col-md-3 col-xs-6">
						<a href="/bangiay/chitietsanpham?proId=${listproduct.idsanpham}&danhmucId=${listproduct.iddanhmuc.iddanhmuc}">
						<div class="product">
							<div class="product-img">
							<img src="<c:url value="/files/${listproduct.image1}"/>" alt="">
								<div class="product-label">
									<span class="sale">- ${(listproduct.giaban - listproduct.giakhuyenmai) / (listproduct.giaban / 100 )}%</span>
									<span class="new">NEW</span>
								</div>
							</div>
							<div class="product-body">
								<p class="product-category">${listproduct.iddanhmuc.tendanhmuc}</p>
								<h3 class="product-name">${listproduct.tensanpham}</h3>
								<h4 class="product-price">
												<fmt:formatNumber type = "number" value = "${listproduct.giakhuyenmai}"/> VNĐ
												 <del class="product-old-price"> <fmt:formatNumber type = "number" value = "${listproduct.giaban}"/> VNĐ
												 </del></h4>
							</div>
							<div class="add-to-cart">
								<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm giỏ hàng</button>
							</div>
						</div>
						</a>
					</div>
					</c:forEach>
					<div class="clearfix visible-sm visible-xs"></div>
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
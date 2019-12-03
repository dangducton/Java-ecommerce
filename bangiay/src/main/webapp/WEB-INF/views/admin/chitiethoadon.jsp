<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title}</title>
<jsp:include page="head.jsp" flush="true" />
</head>
<body>
	<div class="page-wrapper">
		<jsp:include page="menu.jsp" flush="true" />
		<div class="page-container">
			<jsp:include page="header.jsp" flush="true" />
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header">
										<strong>Chi tiết hóa đơn</strong>
									</div>
									<div class="card-body card-block">
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">ID
													hóa đơn</label>
											</div>
											<div class="col-12 col-md-9">
												<p style="color: blue;">${hoaDon.idhoadon}</p>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">Điện
													thoại</label>
											</div>
											<div class="col-12 col-md-9">
												<p style="color: blue;">${hoaDon.dienthoai}</p>
											</div>
										</div>

										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">Email</label>
											</div>
											<div class="col-12 col-md-9">
												<p style="color: blue;">${hoaDon.email}</p>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">Địa
													chỉ</label>
											</div>
											<div class="col-12 col-md-9">
												<p style="color: blue;">${hoaDon.diachi}</p>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="textarea-input" class=" form-control-label">Tổng
													tiền</label>
											</div>
											<div class="col-12 col-md-9">
												<p style="color: blue;">
													<b><fmt:formatNumber type="number"
															value="${hoaDon.tongtien}" /></b> VNĐ
												</p>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">Tên
													người mua</label>
											</div>
											<div class="col-12 col-md-9">
												<p style="color: blue;">${hoaDon.iduser.tenuser}</p>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">Ngày
													mua</label>
											</div>
											<div class="col-12 col-md-9">
												<p style="color: blue;">${hoaDon.ngaytao }</p>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="mausanpham" class=" form-control-label">Ghi
													chú</label>
											</div>
											<div class="col-12 col-md-9">
												<p style="color: blue;">${hoaDon.ghichu}</p>
											</div>
										</div>
										<div class="table-responsive table-responsive-data2">
											<table class="table table-data2">
												<thead>
													<tr>
														<th></th>
														<th>ID sản phẩm</th>
														<th>Tên sản phẩm</th>
														<th>Ảnh sản phẩm</th>
														<th>Tên size</th>
														<th>Số lượng</th>
														<th>Giá sản phẩm</th>
														<th>Tổng tiền</th>
													</tr>
												</thead>
												<c:forEach items="${listHoaDon}" var="listHoaDon"
													varStatus="itr">
													<tr class="tr-shadow">
														<td>${offset + itr.index +1 }</td>
														<td class="desc">${listHoaDon.idsanpham.idsanpham}</td>
														<td class="desc">${listHoaDon.idsanpham.tensanpham}</td>
														<td><img
															src="<c:url value="/files/${listHoaDon.idsanpham.image1}"/>"
															height='150' width='150' alt=""></td>
														<td class="desc">${listHoaDon.idsizesanpham.tensize}</td>
														<td class="desc">${listHoaDon.soluong}</td>
														<td class="desc"><b><fmt:formatNumber
																	type="number"
																	value="${listHoaDon.idsanpham.giakhuyenmai}" /></b> VNĐ</td>
														<td class="desc"><b><fmt:formatNumber
																	type="number" value="${listHoaDon.sotien}" /></b> VNĐ</td>
													</tr>
												</c:forEach>
											</table>
										</div>
										<div class="table-data-feature">
											<c:if test="${hoaDon.status == 1}">
												<p style="color: white; background-color: blue">Đơn hàng
													đã thanh toán</p>
													
												<a href="/bangiay/admin/danhSachHoaDon"
													style="color: white; background-color: green;">Quay lại
													danh sách sản phẩm</a>
											</c:if>
											<c:if test="${hoaDon.status == 2}">
												<p style="color: white; background-color: red">Đơn hàng
													đã được hủy</p>
													
												<a href="/bangiay/admin/danhSachHoaDon"
													style="color: white; background-color: green;">Quay lại
													danh sách sản phẩm</a>
											</c:if>
										</div>
										<c:if test="${hoaDon.status == 3}">
											<div class="card-footer">
												<button class="btn btn-primary btn-sm">
													<a href="/bangiay/admin/updateHoaDon1?idHoaDon=${hoaDon.idhoadon}"
														style="color: white"><i class="fa fa-dot-circle-o">Xác nhận đơn hàng thành công</i></a>
												</button>
												<button class="btn btn-danger btn-sm">
													<a
														href="/bangiay/admin/updateHoaDon2?idHoaDon=${hoaDon.idhoadon}"
														style="color: white"><i class="fa fa-ban">Hủy đơn hàng</i></a>
												</button>
												<button class="btn btn-primary btn-sm">
												<a href="/bangiay/admin/danhSachHoaDon"
													style="color: white;">Quay lại
													danh sách sản phẩm</a>
														</button>
												</button>
											</div>
										</c:if>
									</div>

								</div>
							</div>
							<jsp:include page="footer.jsp" flush="true" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/admin/ckeditor/ckeditor.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/vendor/jquery-3.2.1.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/vendor/bootstrap-4.1/popper.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/vendor/bootstrap-4.1/bootstrap.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/vendor/slick/slick.min.js"/>"></script>
	<script src="<c:url value="/resources/admin/vendor/wow/wow.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/vendor/animsition/animsition.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/vendor/counter-up/jquery.waypoints.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/vendor/counter-up/jquery.counterup.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/vendor/circle-progress/circle-progress.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/vendor/perfect-scrollbar/perfect-scrollbar.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/vendor/chartjs/Chart.bundle.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/vendor/select2/select2.min.js"/>"></script>
	<script src="<c:url value="/resources/admin/js/main.js"/>"></script>


</body>
</html>
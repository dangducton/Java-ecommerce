<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
										<strong>Người dùng</strong>
									</div>
									<div class="card-body card-block">
										<form action="/bangiay/admin/insertThemNguoiDung" method="POST"
											enctype="multipart/form-data" class="form-horizontal">
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Tên người dùng</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" name="tenNguoiDung"
														placeholder="Nhập tên người dùng" class="form-control" /> 
													<p style="color: red"> ${falseTenNguoiDung}</p>
												</div>
											</div>


											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Tên đăng nhập</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" name="tenDangNhap" placeholder="Nhập tên đăng nhập"
														class="form-control" />
														<p style="color: red"> ${falseTenDangNhap}</p>
												</div>
											</div>

											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Mật khẩu</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="password" name="matKhau" placeholder="Nhập mật khẩu"
														class="form-control" />
														<p style="color: red"> ${falseMatKhau}</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Nhập lại mật khẩu</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="password" name="xacNhanMatKhau" placeholder="Nhập lại mật khẩu"
														class="form-control" />
														<p style="color: red"> ${falseNhapLaiMatKhau}</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Email</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" name="Email"
														placeholder="Nhập Email" class="form-control" />
														<p style="color: red"> ${falseEmail}</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="textarea-input" class=" form-control-label">Địa chỉ</label>
												</div>
												<div class="col-12 col-md-9">
													<textarea rows="9" name="diaChi" placeholder="Nhập địa chỉ"
														class="form-control"></textarea>
														<p style="color: red"> ${falseDiaChi}</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Số điện thoại</label>
												</div>
												<div class="col-12 col-md-9">
													<input name="dienThoai" placeholder="Nhập số điện" class="form-control"></input>
													<p style="color: red"> ${falseDienThoai}</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="mausanpham" class=" form-control-label">Quyền người dùng</label>
												</div>
												<div class="col-12 col-md-9">
														<c:forEach items="${listRole}" var="listRole">
															<input type="radio" name="quyen" value="${listRole.id}"/>${listRole.name}
														</c:forEach>
														<p style="color: red"> ${falseQuyenNguoiDung}</p>
												</div>
											</div>
				
											<div class="card-footer">
												<button type="submit" class="btn btn-primary btn-sm">
													<i class="fa fa-dot-circle-o"></i> Thêm người dùng
												</button>
												<button type="reset" class="btn btn-danger btn-sm">
													<i class="fa fa-ban"></i> Xóa
												</button>
											</div>
										</form>
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
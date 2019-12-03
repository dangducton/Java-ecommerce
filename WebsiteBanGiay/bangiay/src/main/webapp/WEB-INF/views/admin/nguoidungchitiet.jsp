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
										<strong>Nhập người dùng</strong>
									</div>
									<div class="card-body card-block">
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Tên người dùng</label>
												</div>
												<div class="col-12 col-md-9">
													<p style="color: blue;">${nguoiDung.tenuser }</p> 
												</div>
											</div>


											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Tên đăng nhập</label>
												</div>
												<div class="col-12 col-md-9">
													<p style="color: blue;">${nguoiDung.tendangnhap }</p>
												</div>
											</div>

											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Mật khẩu</label>
												</div>
												<div class="col-12 col-md-9">
												 <p style="color: blue;">${nguoiDung.matkhau }</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Email</label>
												</div>
												<div class="col-12 col-md-9">
													<p style="color: blue;">${nguoiDung.email }</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="textarea-input" class=" form-control-label">Địa chỉ</label>
												</div>
												<div class="col-12 col-md-9">
														 <p style="color: blue;">${nguoiDung.diachi }</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Thời gian tạo</label>
												</div>
												<div class="col-12 col-md-9">
													<p style="color: blue;">${nguoiDung.ngaytao }</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Số điện thoại</label>
												</div>
												<div class="col-12 col-md-9">
													<p style="color: blue;">${nguoiDung.dienthoai }</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="mausanpham" class=" form-control-label">Quyền người dùng</label>
												</div>
												<div class="col-12 col-md-9">
															<p style="color: blue;"> ${quyen.idrode.name}</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Trạng thái</label>
												</div>
												<div class="col-12 col-md-9">
													  <c:if test="${nguoiDung.status == 1}">
                                             		   	<b style="color: green;">Kích hoạt</b>
                                                		</c:if>
                                                		 <c:if test="${nguoiDung.status == 2}">
                                                		 <b style="color: red;">Không kích hoạt</b>
                                                	</c:if>
												</div>
											</div>
											
											
											<div class="card-footer">
												<button class="btn btn-primary btn-sm">
													<a href="/bangiay/admin/danhSachNguoiDung" style="color: white"><i class="fa fa-dot-circle-o">Danh sách người dùng</i></a>
												</button>
												<button class="btn btn-danger btn-sm">
													<a href="/bangiay/admin/initUpdateNguoidung?idUser=${nguoiDung.iduser}" style="color: white"><i class="fa fa-ban">Update người dùng</i></a>
												</button>
											</div>
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
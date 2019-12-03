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
										<strong>Update Sản Phẩm</strong>
									</div>
									<div class="card-body card-block">
										<form action="/bangiay/admin/updateSanPham" method="POST"
											enctype="multipart/form-data" class="form-horizontal">
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Tên
														sản phẩm</label>
												</div>
												<div class="col-12 col-md-9">
												<input type="hidden" name="idsanpham"
														placeholder="Nhập tên sản phâm" class="form-control" value="${sanPham.idsanpham}"/>
													<input type="text" name="tensanpham"
														placeholder="Nhập tên sản phâm" class="form-control" value="${sanPham.tensanpham}"/> 
												</div>
											</div>


											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Giá
														gốc</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" name="giagoc" placeholder="Giá gốc"
														class="form-control"  value="${sanPham.giagoc}" /> 
												</div>
											</div>

											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Giá
														bán</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" name="giaban" placeholder="Giá bán"
														class="form-control"  value="${sanPham.giaban}" /> 
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Giá
														khuyến mãi</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" name="giakhuyenmai"
														placeholder="Giá khuyến mãi" class="form-control" value="${sanPham.giakhuyenmai}" /> 
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="textarea-input" class=" form-control-label">Bảo
														hành</label>
												</div>
												<div class="col-12 col-md-9">
													<textarea rows="9" name="baohanh" placeholder="Bảo hành"
														class="form-control">${sanPham.baohanh}</textarea>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Mô
														tả ngắn</label>
												</div>
												<div class="col-12 col-md-9">
													<textarea name="motangan" id="noidung">${sanPham.motangan}</textarea>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="textarea-input" class=" form-control-label">Mô
														tả chi tiết</label>
												</div>
												<div class="col-12 col-md-9">
													<textarea name="motachitiet" id="noidung1">${sanPham.motachitiet}</textarea>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="danhmuc" class=" form-control-label">Danh
														mục sản phẩm</label>
												</div>
												<div class="col-12 col-md-9">
													<select name="danhmuc" class="form-control">
														<option value="${sanPham.iddanhmuc.iddanhmuc}">${sanPham.iddanhmuc.tendanhmuc}</option>
														<c:forEach items="${listdanhmuc}" var="listdanhmuc">
															<option value="${listdanhmuc.iddanhmuc}">${listdanhmuc.tendanhmuc}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="mausanpham" class=" form-control-label">Màu
														sản phẩm</label>
												</div>
												<div class="col-12 col-md-9">
													<select name="mausanpham" class="form-control">
														<option value="${sanPham.idmausanpham.idmausanpham}">${sanPham.idmausanpham.tenmau}</option>
														<c:forEach items="${listmausanpham}" var="listmausanpham">
															<option value="${listmausanpham.idmausanpham}">${listmausanpham.tenmau}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="row form-group">
											<div class="col col-md-3">
													
												</div>
											<div class="col-12 col-md-9">
													<img src="<c:url value="/files/${sanPham.image1}"/>" height='150' width='150' alt="">
													<img src="<c:url value="/files/${sanPham.image2}"/>" height='150' width='150' alt="">
													<img src="<c:url value="/files/${sanPham.image3}"/>" height='150' width='150' alt="">
													<img src="<c:url value="/files/${sanPham.image4}"/>" height='150' width='150' alt="">
											</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="file-input" class=" form-control-label">Ảnh
														1 (Ảnh chính)</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="file" id="file-input" name="file1"
														class="form-control-file">
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="file-input" class=" form-control-label">Ảnh
														2</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="file" id="file-input" name="file2"
														class="form-control-file">
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="file-input" class=" form-control-label">Ảnh
														3</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="file" id="file-input" name="file3"
														class="form-control-file">
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="file-input" class=" form-control-label">Ảnh
														4</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="file" id="file-input" name="file4"
														class="form-control-file">
												</div>
											</div>
											<div class="card-footer">
												<button type="submit" class="btn btn-primary btn-sm">
													<i class="fa fa-dot-circle-o"></i> Update
												</button>
												<button type="reset" class="btn btn-danger btn-sm">
													 <a href="/bangiay/admin/danhsachsanpham" style="color: white;"><i class="fa fa-ban"></i> Quay lại danh sách sản phẩm</a>
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
	<script>
	var editor = '';
		$(document).ready(function(){
			editor = CKEDITOR.replace('noidung'); 
		});
	</script>
	
	<script>
	var editor = '';
		$(document).ready(function(){
			editor = CKEDITOR.replace('noidung1'); 
		});
	</script>
</html>
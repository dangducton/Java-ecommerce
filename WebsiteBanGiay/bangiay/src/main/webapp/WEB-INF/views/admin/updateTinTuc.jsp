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
										<strong>Nhập tin tức</strong>
									</div>
									<div class="card-body card-block">
										<form action="/bangiay/admin/upDateTinTuc" method="POST"
											enctype="multipart/form-data" class="form-horizontal">
											<div class="row form-group">
													<input type="hidden" name="idTinTuc" value="${chiTietTinTuc.idtintuc}" />
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Mô tả ngắn</label>
												</div>
												<div class="col-12 col-md-9">
													<textarea name="moTaNgan"
														placeholder="Nhập mô tả" class="form-control"> ${chiTietTinTuc.motangan}</textarea>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Tên tin tức</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" name="tenTinTuc" placeholder="Nhập tên tin tức"
														class="form-control" value="${chiTietTinTuc.tentintuc}" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Nội dung</label>
												</div>
												<div class="col-12 col-md-9">
													<textarea name="noiDung" id="noidung">${chiTietTinTuc.noidung}</textarea>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Ngày tạo</label>
											</div>
											<div class="col-12 col-md-9">
													<p>${chiTietTinTuc.ngaytao}</p>
											</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="file-input" class=" form-control-label">Ảnh tin tức</label>
												</div>
												<div class="col-12 col-md-9">
												<img src="<c:url value="/files/${chiTietTinTuc.image}"/>" height='480' width='640' alt="">
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="file-input" class=" form-control-label">Ảnh tin tức</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="file" id="file-input" name="file1"
														class="form-control-file">
												</div>
											</div>
											
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="file-input" class=" form-control-label">Trạng thái</label>
												</div>
												<div class="col-12 col-md-9">
													<c:if test="${chiTietTinTuc.status == 1}">
                                                		<button style="background-color: red">
                                                           <b style="color: white;">Đang kích hoạt</b>
                                                            </button>
                                                		</c:if>
                                                    	
                                                        <c:if test="${chiTietTinTuc.status == 2}">
                                                        <button style="background-color: blue">
                                                           <b style="color: white;">Không kích hoạt</b>
                                                            </button>
                                                     </c:if>
												</div>
											</div>
												<div class="card-footer">
												<button type="submit" class="btn btn-primary btn-sm">
													<i class="fa fa-dot-circle-o"></i>Update Tin Tức
												</button>
												<button type="reset" class="btn btn-danger btn-sm">
													 <a href="/bangiay/admin/danhSachTinTuc" style="color: white;"><i class="fa fa-ban"></i> Quay lại danh sách tin tức</a>
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
</html>
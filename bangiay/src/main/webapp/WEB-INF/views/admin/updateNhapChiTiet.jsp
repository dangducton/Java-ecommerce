<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> ${title}</title>
<jsp:include page="head.jsp" flush="true"/>
</head>
<body class="animsition">
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
                                        <strong>Nhập Chi Tiết Sản Phẩm</strong>
                                    </div>
                                    <div class="card-body card-block">
                                        <form action = "/bangiay/admin/updateNhapChiTietSanPham" method="POST" class="form-horizontal">
                                            	<input type="hidden" name="idNhap" value="${nhapChitiet.idnhapchitiet}"></input>
                                            	<div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Tên sản phẩm</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                <input type="text" name="tensanpham" value="${nhapChitiet.idsanpham.tensanpham}" disabled  class="form-control"/>
                                                </div>
                                            </div>
                                               <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Màu Sản Phẩm</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                <input type="text" name="tenmau" value="${nhapChitiet.idsanpham.idmausanpham.tenmau}" disabled  class="form-control"/>
                                                </div>
                                            </div>
                                             <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Ảnh Sản Phẩm</label>
                                                </div>
                                                    <img src="<c:url value="/files/${nhapChitiet.idsanpham.image1}"/>" height='150' width='150' alt="">
                                                    <img src="<c:url value="/files/${nhapChitiet.idsanpham.image2}"/>" height='150' width='150' alt="">
                                                    <img src="<c:url value="/files/${nhapChitiet.idsanpham.image3}"/>" height='150' width='150' alt="">
                                                    <img src="<c:url value="/files/${nhapChitiet.idsanpham.image4}"/>" height='150' width='150' alt="">
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Nhập Số Lượng</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" name="soluong" placeholder="Nhập Số Lượng" class="form-control" value="${nhapChitiet.soluong}"/>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="danhmuc" class=" form-control-label">Size Sản Phẩm</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <select name="size" class="form-control">
                                                       <option value="${nhapChitiet.idsize.idsizesanpham}">${nhapChitiet.idsize.tensize}</option>
                                                      <c:forEach items="${listSize}" var="listSize">
                                                        <option value="${listSize.idsizesanpham}">${listSize.tensize}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                     <div class="card-footer">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            <i class="fa fa-dot-circle-o"></i> Update
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
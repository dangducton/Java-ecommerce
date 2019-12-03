<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mytag1" uri="/WEB-INF/tlds/MyCusTag1.tld" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title> ${title} </title>
	<jsp:include page="head.jsp" flush="true"/>

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
                          <div class="col-md-12">
                                <h3 class="title-5 m-b-35">Danh sách sản phẩm</h3>
                                <div class="table-data__tool">
                                    <div class="table-data__tool-left">
                                        <div class="rs-select2--light rs-select2--md">
                                            <select class="js-select2" name="property" onchange="location = this.options[this.selectedIndex].value;">
                                               <option> ${danhMuc}</option>
                                               <c:forEach items="${listDanhMuc}" var="listDanhMuc">
															<option value="/bangiay/admin/sanphamdanhmuc?danhMucId=${listDanhMuc.iddanhmuc}">${listDanhMuc.tendanhmuc}</option>
												</c:forEach>
                                            </select>
                                            <div class="dropDownSelect2">
                                            
                                            </div>
                                        </div>
                                        <div class="rs-select2--light rs-select2--md">
                                            <select class="js-select2" name="property" onchange="location = this.options[this.selectedIndex].value;">
                                               <option>Tất cả màu sắc</option>
                                                <c:forEach items="${listMauSanPham}" var="listmausanpham">
															<option value="/bangiay/admin/sanphammausac?mauSacId=${listmausanpham.idmausanpham}">${listmausanpham.tenmau}</option>
												</c:forEach>
                                            </select>
                                            <div class="dropDownSelect2">
                                            
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-data__tool-right">
                                        <a href="/bangiay/admin/themSanPham">
                                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                                            <i class="zmdi zmdi-plus"></i>add item</button>
                                            </a>
                                    </div>
                                </div>
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Tên sản phẩm</th>
                                                <th>Ảnh sản phẩm</th>
                                                <th>Giá gốc</th>
                                                <th>Giá bán</th>
                                                <th>Giá khuyến mãi</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <c:forEach items="${listStu}" var="listProduct" varStatus="itr">
                                            <tr class="tr-shadow">
                                                <td>${offset + itr.index +1 }</td>
                                                <td class="desc">${listProduct.tensanpham}${listProduct.idmausanpham.tenmau}</td>
                                                <td><img src="<c:url value="/files/${listProduct.image1}"/>" height='150' width='150' alt=""></td>
                                                <td class="desc">
                                                <fmt:formatNumber type = "number" value = "${listProduct.giagoc}"/> VNĐ
                                                </td>
                                                <td class="desc">
                                                <fmt:formatNumber type = "number" value = "${listProduct.giaban}"/> VNĐ
                                                </td>
                                                <td class="desc">
                                                <fmt:formatNumber type = "number" value = "${listProduct.giakhuyenmai}"/> VNĐ
                                                </td>
                                                <td><a href="/bangiay/admin/nhapchitietsanpham?proId=${listProduct.idsanpham}">
                                            <button class="au-btn au-btn-icon au-btn--blue au-btn--small">
                                             nhập chi tiết</button>
                                            </a></td>
                                              <td>
                                                    <div class="table-data-feature">
                                                    <button class="item" data-toggle="tooltip" data-placement="top" title="Sửa">
                                                            <a href="/bangiay/admin/updateProduct?proId=${listProduct.idsanpham}"><i class="zmdi zmdi-edit"></i></a>
                                                            </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Xóa">
                                                            <a href="/bangiay/admin/deleteProduct?proId=${listProduct.idsanpham}"><i class="zmdi zmdi-delete"></i></a>
                                                            </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                 <h2 style="float:right"><mytag1:ClassPaginationTag1 max="10" offset="${offset}" count="${count}" uri="/bangiay/admin/sanphamdanhmuc?danhMucId=${maDanhMuc}&" next="&raquo;" previous="&laquo;"/></h2>
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
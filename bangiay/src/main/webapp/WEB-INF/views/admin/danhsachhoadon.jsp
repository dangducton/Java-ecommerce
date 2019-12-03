<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mytag" uri="/WEB-INF/tlds/MyCustomTag.tld" %>
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
                                <h3 class="title-5 m-b-35">Danh sách hóa đơn</h3>
                                <div class="table-data__tool">
                                            <h3 style="color: red;text-align: center;"> ${status} </h3>
                                </div>
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Điện thoại</th>
                                                <th>Tổng tiền</th>
                                                <th>Người mua</th>
                                                <th>Ngày mua</th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <c:forEach items="${listHoaDon}" var="listHoaDon" varStatus="itr">
                                            <tr class="tr-shadow">
                                                <td>${offset + itr.index +1 }</td>
                                                <td class="desc">${listHoaDon.dienthoai}</td>
                                                <td class="desc"><b><fmt:formatNumber type = "number" value = "${listHoaDon.tongtien}"/></b> VNĐ</td>
                                                <td class="desc">${listHoaDon.iduser.tenuser}</td>
                                                <td class="desc">${listHoaDon.ngaytao}</td>
                                                <c:if test="${listHoaDon.status == 1}">
                                                <td class="desc"><b style="color: green;">Đơn hàng thành công</b></td>
                                                </c:if>
                                                 <c:if test="${listHoaDon.status == 2}">
                                                <td class="desc"><b style="color: red;"> Đơn hàng bị hủy</b></td>
                                                </c:if>
                                                 <c:if test="${listHoaDon.status == 3}">
                                                <td class="desc"><b style="color: blue;"> Chưa xác định</b></td>
                                                </c:if>
                                                 <td>
                                                    <div class="table-data-feature">
                                                		<button style="background-color: red">
                                                            <a href="/bangiay/admin/chiTietHoaDon?hoaDonId=${listHoaDon.idhoadon}"><b style="color: white;">Chi tiết hóa đơn<b></a>
                                                            </button>
                                                         </div>
                                                    </td>
                                                    <td> 
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                 <h2 style="float:right"><mytag:ClassPaginationTag max="10" offset="${offset}" count="${count}" uri="/bangiay/admin/danhSachHoaDon" next="&raquo;" previous="&laquo;"/></h2>
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
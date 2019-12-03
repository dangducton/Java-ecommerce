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
                                <h3 class="title-5 m-b-35">Danh sách người dùng</h3>
                                <h3 class="title-5 m-b-35" style="color: red"> ${status}</h3>
                                <div class="table-data__tool">
                                            <h3 style="color: red;text-align: center;"> ${statusOff} </h3>
                                </div>
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Tên người dùng</th>
                                                <th>Tên đăng nhập</th>
                                                <th>Điện thoại</th>
                                                <th>Quyền</th>
                                                <th>Ngày tạo</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <c:forEach items="${listNguoiDung}" var="listNguoiDung" varStatus="itr">
                                            <tr class="tr-shadow">
                                                <td>${offset + itr.index +1 }</td>
                                                <td class="desc">${listNguoiDung.idnguoidung.tenuser}</td>
                                                <td class="desc">${listNguoiDung.idnguoidung.tendangnhap}</td>
                                                <td class="desc">${listNguoiDung.idnguoidung.dienthoai}</td>
                                                <td class="desc">${listNguoiDung.idrode.name}</td>
                                                <td class="desc">${listNguoiDung.idnguoidung.ngaytao}</td>
                                                <c:if test="${listNguoiDung.idnguoidung.status == 1}">
                                                <td class="desc"><b style="color: green;">Kích hoạt</b></td>
                                                </c:if>
                                                 <c:if test="${listNguoiDung.idnguoidung.status == 2}">
                                                <td class="desc"><b style="color: red;">Không kích hoạt</b></td>
                                                </c:if>
                                                 <td>
                                                    <div class="table-data-feature">
                                                    	<c:if test="${listNguoiDung.idnguoidung.status == 1}">
                                                		<button style="background-color: red">
                                                            <a href="/bangiay/admin/updateNguoiDung1?iduser=${listNguoiDung.idnguoidung.iduser}"><b style="color: white;">Không kích hoạt<b></a>
                                                            </button>
                                                		</c:if>
                                                    	
                                                        <c:if test="${listNguoiDung.idnguoidung.status == 2}">
                                                        <button style="background-color: blue">
                                                            <a href="/bangiay/admin/updateNguoiDung2?iduser=${listNguoiDung.idnguoidung.iduser}"><b style="color: white;"> Kích hoạt<b></a>
                                                            </button>
                                                            </c:if>
                                                         </div>
                                                    </td>
                                                    <td class="desc"><button style="background-color: blue">
                                                            <a href="/bangiay/admin/chiTietNguoidung?iduser=${listNguoiDung.idnguoidung.iduser}"><b style="color: white;">Chi tiết người dùng<b></a>
                                                            </button></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                 <h2 style="float:right"><mytag:ClassPaginationTag max="10" offset="${offset}" count="${count}" uri="/bangiay/admin/danhSachNguoiDung" next="&raquo;" previous="&laquo;"/></h2>
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
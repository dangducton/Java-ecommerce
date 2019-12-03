<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title> ${title}</title>
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
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-7 order-details" style="background-color: #b30000">
							<h1 style="color:white;text-align: center;padding-top: 80px">Giày nam BôniTôni</h1>
							<h2 style="color:white;text-align: center">Giày nam BôniTôni cam kết hàng chính hãng và các chính sách hậu mãi tuyệt vời</h2>
					</div>
		
				<form action ="/bangiay/dangKy" method="POST">
				<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">Đăng Ký</h3>
						</div>
							<div class="form-group">
							<b>Tên người dùng:</b>
								<input class="input" type="text" name="tenNguoiDung" placeholder="Tên người dùng" required>
								<p style="color: red"> ${falseTenNguoiDung}</p>
							</div>
							<div class="form-group">
							<b>Tên tài khoản:</b>
								<input class="input" type="text" name="tenDangNhap" placeholder="Tên tài khoản" required>
								<p style="color: red"> ${falseTenDangNhap}</p>
							</div>
							
							<div class="form-group">
							<b>Mật khẩu:</b>
								<input class="input" type="password" name="matKhau" placeholder="Mật khẩu" required>
								<p style="color: red"> ${falseMatKhau}</p>
							</div>
							<div class="form-group">
							<b>Xác nhận mật khẩu:</b>
								<input class="input" type="password" name="xacNhanMatKhau" placeholder="Xác nhận mật khẩu" required>
								<p style="color: red"> ${falseNhapLaiMatKhau}</p>
							</div>
							<div class="form-group">
							<b>Email</b>
								<input class="input" type="text" name="email" placeholder="Email" required>
								<p style="color: red"> ${falseEmail}</p>
							</div>
							<div class="form-group">
							<b>Địa chỉ</b>
								<input class="input" type="text" name="diaChi" placeholder="Địa chỉ" required>
								<p style="color: red"> ${falseDiaChi}</p>
							</div>
							<div class="form-group">
							<b>Điện thoại</b>
								<input class="input" type="text" name="dienThoai" placeholder="Điện thoại" required>
								<p style="color: red"> ${falseDienThoai}</p>
							</div>
							
							<button class="primary-btn order-submit" type="submit">Đăng Ký</button>
							<a href="/bangiay/pageLogin" style="color: red"><i class="fa fa-sign-in"></i>
						Đăng Nhập</a>
					</div>
					</form>
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
		
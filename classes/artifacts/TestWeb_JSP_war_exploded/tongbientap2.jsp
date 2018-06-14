<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
     </script>
	<title>Tạp chí Khoa Học SPKT</title>
	<!-- Latest compiled and minified CSS & JS -->
	<link rel="stylesheet" href="css/bootstrap.min.css" >
	<link rel="stylesheet" href="css/myweb.css" >

	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js" ></script>
    <script src="js/angular.min.js"></script>
    <script src="js/jquery.validate.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12 well	">
<!--header-->
			<div id="header" >
			<!--row logo-->
				<div class="row">
					<div class="col-md-8">
						<div class="image" href="">
							<img src="images/banner.png" class="img-responsive" alt="Responsive image">
						</div>
					</div><!--end cột image-->
				<!--login-siging-search-->
					<div class="col-md-4">
					<!--Login-->
						<div class="row">
							<div class="col-md-12">
								<div class="dropdown navbar-form navbar-right">
									<button class="btn btn-default dropdown-toggle textcolor" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="background: #0c6b63;">
										<c:out value="${sessionScope['loginUser']}"/>
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
										<li><a href="thongtincanhan.jsp">Thông Tin Cá Nhân</a></li>
										<li><a href="chuyentrang.jsp"><c:out value="${sessionScope['phanquyen']}"/></a></li>
										<li role="separator" class="divider"></li>
										<li><a href="logout.jsp">Thoát</a></li>
									</ul>
								</div>
							</div>
						</div><br>
					<!--end login-->
					<!--search-->
						<div class="row">
							
								<div class="col-md-12">
									<form class="navbar-form navbar-right" role="search" method="post" action="xulytimkiem.jsp">
								  		<div class="form-group">
								    		<input type="text" name="key" value="" class="form-control" placeholder="Nhập từ khóa tìm kiếm...">
								 		</div>
								  		<button  type="submit" class="btn btn-primary textcolor" style="background: #0c6b63;">TÌM</button>
									</form>
									<!--Ajax-->	
									  <script type="text/javascript">
										 $(document).ready(function() {
										 $('#tim').click(function(e) {
										 e.preventDefault();
										 $('#ndtk').load('ketquatimkiem.jsp #ndtk-canlay');
										 });
										 });
									</script>
				  				<!--endAjax-->
								</div>
						</div><!--end search-->
						<div class="row">
							<div class="col-md-4">							
							</div>
							<div class="col-md-8">
								<a href="" data-toggle="modal" data-target="#myModal3">Tìm Kiếm Nâng Cao</a>
								<!-- Modal -->
								<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="myModalLabel">Tìm Kiếm Nâng Cao</h4>
								      </div>
								      <form id="FormTimKiemNangCao" method="post" class="form-horizontal" action="xulytimkiem.jsp">
								      <div class="modal-body">
								      
								      	<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                  							 url="${sessionScope['url']}" user="${sessionScope['userdb']}" 
                  							 password="${sessionScope['passdb']}" />
								        <sql:query dataSource="${dataSource}" var="result">
											select *
											from ds_baiviet_dagui
										</sql:query>
										
										<sql:query dataSource="${dataSource}" var="result2">
											select *
											from ds_noidung_bientap
										</sql:query>
								        
								        
											<div class="form-group">
												<label class="col-sm-4 control-label" for="TimKiemTheo">Tìm Kiếm Theo Tác Giả: </label>
												<div class="col-sm-5">
													<select class="form-control" name="key">																												
														<c:forEach var="row1" items="${result.rows }">															
															<option value="${row1.username_taikhoan }"><c:out value="${row1.tentacgia }"/></option>
														</c:forEach>													
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label" for="ThoiGian">Thời Gian: </label>
												<div class="col-sm-5">
													<select class="form-control" name="date">																													
														<c:forEach var="row2" items="${result2.rows }">	
															<option value="${row2.NgayDang }"><c:out value="${row2.NgayDang }"/></option>
														</c:forEach>													
													</select>
												</div>
											</div>

											
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
								       <button type="submit" class="btn btn-primary">TÌM</button>
								      </div>
								      </form>
								    </div>
								  </div>
								</div>
							</div>
						</div>
					</div><!--end Cột login-siging-->
				</div><!--end row logo--><br>

			<!--thanh dieu huong-->
				<div class="row">
					<div class="col-md-12">
						<nav class="navbar navbar-default" style="background: #0c6b63;">
							<div class="navbar-header">
								<button class="navbar-toggle" data-toggle="collapse" data-target="#main-menu">
						           <span class="sr-only">Toggle navigation</span>
						           <span class="icon-bar"></span>
						           <span class="icon-bar"></span>
						           <span class="icon-bar"></span>
						        </button>
							</div>
							<div class="navbar-collapse collapse" id="main-menu">
								<ul class="nav nav-justified " >
										<li><a class="textcolor" href="trangchu.jsp"><strong>Trang chủ</strong></a></li>
										<li><a class="textcolor" href="" id="GioiThieu"><strong>Giới Thiệu</strong></a></li>
										<li><a class="textcolor" href="" id="QDHD"><strong>Quy Định-Hướng Dẫn</strong></a></li>
										<li><a class="textcolor" href="" id="LienHe"><strong>Liên Hệ</strong></a></li>
										<li><a class="textcolor" href="" id="LienKet"><strong>Liên Kết</strong></a></li>
								</ul>
							</div>
						
								
						</nav>
					</div>
				</div><!--end thanh dieu huong-->				
			</div>
<!--endhead-->
<!--Main-->
			<div id="Main">
					<div class="row" >
						<!--cột trái-->
						<div class="col-md-2">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title" ><strong>Lĩnh vực</strong></h3>
								</div >

								
								
								<ul class="list-group"> 
								<li class="list-group-item" data-id="journal1672"> 
								  <a href="#" class="list-group-item"><strong>Khoa học tự nhiên và công nghệ</strong></a>
								  		<ul id="journal1672" style="display: none;">
											<li><a href="#" style="font-weight:normal">Ban biên tập</a></li>
											<li><a href="#" style="font-weight:normal">Bài viết</a></li>
										</ul>
								<li class="list-group-item" data-id="journal1673"> 
								  <a href="#" class="list-group-item"><strong>Khoa học xã hội và nhân văn</strong></a>
								  		<ul id="journal1673" style="display: none;">
											<li><a href="#" style="font-weight:normal">Ban biên tập</a></li>
											<li><a href="#" style="font-weight:normal">Bài viết</a></li>
										</ul>
								 <li class="list-group-item" data-id="journal1674"> 
								  <a href="#" class="list-group-item"><strong>Khoa học giáo dục</strong></a>
								  		<ul id="journal1674" style="display: none;">
											<li><a href="#" style="font-weight:normal">Ban biên tập</a></li>
											<li><a href="#" style="font-weight:normal">Bài viết</a></li>
										</ul>
								 <li class="list-group-item" data-id="journal1675"> 
								  <a href="#" class="list-group-item"><strong>Khoa học môi trường</strong></a>
								  		<ul id="journal1675" style="display: none;">
											<li><a href="#" style="font-weight:normal">Ban biên tập</a></li>
											<li><a href="#" style="font-weight:normal">Bài viết</a></li>
										</ul>
								</ul>		
							</div>
						<script type="text/javascript">
						<!--
							var elm = null;
							$(".list-group-item").hover(function(){
								$("#"+$(this).attr("data-id")).show();
							},function(){
								$("#"+$(this).attr("data-id")).hide();
							});
						//-->
						</script>
							<!--quang cao-->
							<p style=" "><embed height="210" width="180" type="application/x-shockwave-flash" allowscriptaccess="always" wmode="transparent" allowfullscreen="false" scale="noborder" quality="high" src="Flash/135.swf" title=" "/></p>

						</div>
					<!--end cột trái-->

					<!--cột giữa-->
					<div id="nd">
						<div class="col-md-10 line">
		
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Quản Lý Bài Viết</h3>
								</div>
								<div class="panel-body">
								 <!-- Nav tabs -->
									  <ul class="nav nav-tabs">
									    <li class="active"><a href="#dschuaphancong" data-toggle="tab">Danh Sách Bài Chưa Phân công</a></li>
									    <li><a href="#dsdaphancong" data-toggle="tab">Danh Sách Bài Đã Phân công</a></li>
									    <li><a href="#dsdadang" data-toggle="tab">Danh Sách Bài Đã Đăng</a></li>
									  </ul>
									  
								<!-- kết nối DB -->
									  <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" 
											url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
										<!--ds chưa đc phân công -->
											<sql:query var="result" sql="select * from ds_baiviet_dagui,taikhoan 
											where taikhoan.Username=ds_baiviet_dagui.username_taikhoan 											
											and (phancong_BT='0' or phancong_PB='0')" 
											dataSource="${con}"/>
										<!-- ds dc phân công -->			
											<sql:query var="result1" sql="select * from ds_baiviet_dagui,
											 taikhoan, ds_baiviet_bientap, ds_baiviet_phanbien
											 where taikhoan.Username=ds_baiviet_dagui.username_taikhoan 
											 and ds_baiviet_dagui.ID_baiviet_dagui=ds_baiviet_bientap.ID_baiviet_dagui
											 and ds_baiviet_dagui.ID_baiviet_dagui=ds_baiviet_phanbien.ID_baiviet_dagui												
											 and trangthai='1'" 
											dataSource="${con}"/>
										<!-- ds dc đăng -->			
											<sql:query var="result2" sql="select * from ds_baiviet_dagui,
											taikhoan,ds_noidung_bientap, ds_baiviet_bientap
											 where taikhoan.Username=ds_baiviet_dagui.username_taikhoan 
											 and ds_baiviet_dagui.ID_baiviet_dagui=ds_baiviet_bientap.ID_baiviet_dagui
											 and ds_baiviet_bientap.ID_baiviet_bientap=ds_noidung_bientap.ID_baiviet_bientap
											 and trangthai_duocdang ='2'" 
											dataSource="${con}"/>
								<!-- tab -->
								<div class="tab-content">
								<!-- tab chưa phân công -->
									  	<div class="tab-pane fade in active" id="dschuaphancong">
									  		<table class="table table-bordered table-hover">
												<thead>
													<tr>
														<th>Tác Giả</th>
														<th>Tiêu Đề</th>
														<th>Nội Dung</th>														
														<th>Ngày Gửi</th>													
														<th colspan="1">Action</th>
													</tr>
												</thead>
												<tbody>
													
													
														<c:forEach var="rows" items="${result.rows }">
															<tr>
																<td>${rows.last_name} ${rows.first_name}</td>
																<td>${rows.tieude }</td>
																<td>${rows.noidung }</td>																
																<td>${rows.ngaygui }</td>
																
																<td><a href="xemchitiet.jsp?id=<c:out value="${rows.ID_baiviet_dagui}"/>" >Chi tiết</a></td>
																
															</tr>
														</c:forEach>
													
													
												</tbody>
											</table>
									  	</div>
									  
									  <!-- tab được phân công -->
									  	<div class="tab-pane fade" id="dsdaphancong">
									  		<table class="table table-bordered table-hover">
												<thead>
													<tr>
														
														<th>Tiêu Đề</th>
														<th>Nội Dung</th>
														<th>Ngày Giao BT</th>
														<th>Ngày Giao PB</th>														
														<th>Trạng Thái BT</th>
														<th>Trạng Thái PB</th>
														<th colspan="1">Action</th>
													</tr>
												</thead>
												<tbody>
													
													
														<c:forEach var="rows1" items="${result1.rows }">
															<tr>
																
																<td>${rows1.tieude }</td>
																<td>${rows1.noidung }</td>
																<td>${rows1.ngaygiaobientap }</td>
																<td>${rows1.ngaygiaophanbien }</td>															
																<td>${rows1.trangthai_bientap }</td>
																<td>${rows1.trangthai_phanbien }</td>
																<td><a href="xemchitiet.jsp?id=<c:out value="${rows1.ID_baiviet_dagui}"/>" >Chi tiết</a></td>
																
															</tr>
														</c:forEach>
													
													
												</tbody>
											</table>
									  	</div>
									  <!-- tab đã đăng -->
										<div class="tab-pane fade" id="dsdadang">
											<table class="table table-bordered table-hover">
												<thead>
													<tr>
														<th>Tác Giả</th>
														<th>Tiêu Đề</th>
														<th>Nội Dung</th>														
														<th>Ngày Gửi</th>
														<th>Ngày Đăng</th>													
														<th colspan="2">Action</th>
													</tr>
												</thead>
												<tbody>
													
													
														<c:forEach var="row2" items="${result2.rows }">
															<tr>
																<td>${row2.last_name} ${row2.first_name}</td>
																<td>${row2.tieude_bientap }</td>
																<td>${row2.noidung_bientap }</td>																
																<td>${row2.ngaygui }</td>
																<td>${row2.NgayDang }</td>																
																<td><a href="xemchitiet.jsp?id=<c:out value="${row2.ID_baiviet_dagui}"/>" >Chi tiết</a></td>
																<td><a href="javascript:confirmGo('Sure to delete this record?','deleteBaiDang.jsp?id1=<c:out value="${row2.ID_noidung_bientap}"/>')">Xóa</a></td>
															</tr>
														</c:forEach>
													
													
												</tbody>
											</table>
											
										</div>
								</div>
							</div>
						</div>
					</div>	
					<!--end cột giữa-->
					</div><!--endrow chinh-->

					<!--Ajax-->	
						  <script type="text/javascript">
							 $(document).ready(function() {
							 $('#GioiThieu').click(function(e) {
							 e.preventDefault();
							 $('#nd').load('gioithieu.jsp #nd2-canlay');
							 });
							 });

							 $(document).ready(function() {
							 $('#QDHD').click(function(e) {
							 e.preventDefault();
							 $('#nd').load('quydinh_huongdan.jsp #nd2-canlay');
							 });
							 });

							 $(document).ready(function() {
							 $('#LienHe').click(function(e) {
							 e.preventDefault();
							 $('#nd').load('lienhe.jsp #nd2-canlay');
							 });
							 });

							 $(document).ready(function() {
							 $('#LienKet').click(function(e) {
							 e.preventDefault();
							 $('#nd').load('lienket.jsp #nd2-canlay');
							 });
							 });
						</script>
	  				<!--endAjax-->
			</div>
<!--endMain-->
		</div>
	</div>
</div>
</body>
<footer>
	<div class="container well footer">
		<div class="row">
			<div class="col-md-12">
				<div class="text">
						<h6>Copyright © 2013, Trường Đại Học Sư Phạm Kỹ Thuật - Tp.HCM </h6>
						<h6>Địa chỉ: 1 Võ Văn Ngân, Phường Linh Chiểu, Quận Thủ Đức, Thành phố Hồ Chí Minh.</h6>
						<h6>Điện thoại: (+84 - 8) 38968641 - (+84 - 8) 38961333</h6>
						<h6>E-mail: ic@hcmute.edu.vn</h6>
				</div>
			</div>
		</div>
	</div>
</footer>
</html>
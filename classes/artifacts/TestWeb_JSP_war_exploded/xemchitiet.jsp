<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
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
									<h3 class="panel-title">Thông tin chi tiết</h3>
								</div>
								<div class="panel-body">
							
									<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
					          				           url="${sessionScope['url']}"
					                          		   user="${sessionScope['userdb']}"  password="${sessionScope['passdb']}"/>
					                <sql:query dataSource="${dbsource}" var="baivietdagui">
										SELECT * from ds_baiviet_dagui
										where ds_baiviet_dagui.ID_baiviet_dagui=?
										<sql:param value="${param.id}" />					    
									</sql:query>
						<div class="col-sm-10">
						<!-- CHi tiết -->
									<div class="col-sm-7">
									<form class="form-horizontal" method="get" action="DownloadFile_TBT">
										<c:forEach var="row" items="${baivietdagui.rows}">
											<div class="form-group">
												<label class="col-sm-4 control-label">Tên Tác Giả: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${row.tentacgia}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Cơ quan </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${row.coquan}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Info </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${row.thongtinlienlacs}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Tiêu Đề: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${row.tieude}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Lĩnh vực: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${row.linhvuc}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Nội Dung: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${row.noidung}"/></p>
												</div>
											</div>
											
											<div class="form-group" >	  													  
												<label class="col-sm-4 control-label">File</label>
												<div class="col-sm-8" >
													<button type="submit" value="${row.ID_baiviet_dagui }" name="id"  class="btn btn-link">${row.TenFile }</button>
												</div>														    											  								 
											</div>
											
											
											<div class="form-group">
												<label class="col-sm-4 control-label">DS Từ Khóa: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${row.dstukhoa}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Ngày Gửi: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${row.ngaygui}"/></p>
												</div>
											</div>
											
										</c:forEach>
									</form>
									</div>
						<!-- ảnh bìa -->
									<div class="col-sm-5">
										<div class="form-group">
												<label class="col-sm-4 control-label">Ảnh Bìa </label>
												<div class="col-sm-8">
													<img src="GetAnhTG?id_tg=<c:out value="${param.id}"/>" height="150px" width="150px" alt="ProfilePic">
												</div>
											</div>
									</div>
									<p>____________________________________________________________________________________________________________</p>
								
								
									<sql:query dataSource="${dbsource}" var="baivietphanbien">
										SELECT * from ds_baiviet_phanbien,ds_noidung_phanbien,taikhoan,ds_baiviet_dagui
										where ds_baiviet_phanbien.username_taikhoan=taikhoan.Username
										and ds_baiviet_phanbien.ID_baiviet_dagui=ds_baiviet_dagui.ID_baiviet_dagui
										and ds_baiviet_phanbien.ID_baiviet_phanbien=ds_noidung_phanbien.ID_baiviet_phanbien
										and ds_baiviet_dagui.ID_baiviet_dagui=?
										<sql:param value="${param.id}" />					    
									</sql:query>
									
									<div class="col-sm-7">
									<form class="form-horizontal" method="get" action="DownloadFile_PB">
										<c:forEach var="row" items="${baivietphanbien.rows}">
											<div class="form-group">
												<label class="col-sm-4 control-label">Tên Phản Biện: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${row.last_name} ${row.first_name}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Ngày Giao: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${row.ngaygiaophanbien}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Nội Dung: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${row.noidung_phanbien}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">File: </label>
												<div class="col-sm-8">
													<button type="submit" value="${row.ID_noidung_phanbien}" name="id"  class="btn btn-link">${row.tenfile_phanbien}</button>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Ngày Phản Biện: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${row.ngayphanbien}"/></p>
												</div>
											</div>
											
											
										</c:forEach>
									</form>
									</div>
									
									<div class="col-sm-5">
										
									</div>
									<p>____________________________________________________________________________________________________________</p>
										
									
								<div class="col-sm-7">
									
									<sql:query dataSource="${dbsource}" var="baivietbientap">
										SELECT * from ds_baiviet_bientap,ds_noidung_bientap,taikhoan,ds_baiviet_dagui
										where ds_baiviet_bientap.username_taikhoan=taikhoan.Username
										and ds_baiviet_bientap.ID_baiviet_dagui=ds_baiviet_dagui.ID_baiviet_dagui
										and ds_baiviet_bientap.ID_baiviet_bientap=ds_noidung_bientap.ID_baiviet_bientap
										and ds_baiviet_dagui.ID_baiviet_dagui=?
										<sql:param value="${param.id}" />					    
									</sql:query>
									<form class="form-horizontal">
										<c:forEach var="rows" items="${baivietbientap.rows}">
											<div class="form-group">
												<label class="col-sm-4 control-label">Tên Biên Tập: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${rows.last_name} ${rows.first_name}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Ngày Giao: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${rows.ngaygiaobientap}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Tiêu Đề Mới: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${rows.tieude_bientap}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Nội Dung Mới: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${rows.noidung_bientap}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">File: </label>
												<div class="col-sm-8">
													<a onclick="window.open('Read_TBT?id=${rows.ID_noidung_bientap}',
													 '_blank', 'location=yes,height=600,width=600,scrollbars=yes,status=yes' );" 
													 class="btn btn-link"><c:out value="${rows.tenfile_PDF}"/></a>	
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">DS Từ Khóa: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${rows.dstukhoa_bientap}"/></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label">Ngày Biên Tập: </label>
												<div class="col-sm-8">
													<p class="form-control-static"><c:out value="${rows.ngaybientap}"/></p>
												</div>
											</div>																						
										</c:forEach>
									</form>
								</div>
						<!-- ảnh bìa -->
								<div class="col-sm-5">
									<c:forEach var="row2" items="${baivietbientap.rows}">
											<div class="form-group">
													<label class="col-sm-4 control-label">Ảnh Bìa </label>
													<div class="col-sm-8">
														<img src="GetAnhBT?id_bt=<c:out value="${row2.ID_noidung_bientap}"/>" height="150px" width="150px" alt="ProfilePic">
													</div>
												</div>
									</c:forEach>
								</div>	
							</div>
									
									<div class="col-sm-2">
										<button class="btn btn-primary" data-toggle="modal" data-target="#dangbai">ĐĂNG BÀI VIẾT</button><br>
										<br>
										<button class="btn" data-toggle="modal" data-target="#giaophanbien">Giao Phản Biện</button><br>
										<br>
										<button class="btn" data-toggle="modal" data-target="#giaobientap">Giao Biên Tập</button><br>
										
									<!-- Modal -->
									<div class="modal fade" id="dangbai" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									  <div class="modal-dialog" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									        <h4 class="modal-title" id="myModalLabel">Thông Báo</h4>
									      </div>
									      <div class="modal-body">
									      <sql:query dataSource="${dbsource}" var="timid">
											SELECT * from ds_baiviet_dagui
											where ds_baiviet_dagui.ID_baiviet_dagui=?
											<sql:param value="${param.id}" />					    
										</sql:query>
									        <form class="form-horizontal" action="dangbai.jsp" method="post">
										        <div hidden="" class="form-group">
														<label class="col-md-4">ID: </label>
														<input type="text" name="idbaiviet" value="${param.id}">
												</div>
												<c:forEach var="row" items="${timid.rows}">
													<div hidden="" class="form-group">
														<label class="col-md-4">Username: </label>
														<input type="text" name="usernametaikhoan" value="${row.username_taikhoan}">
													</div>
												</c:forEach>
									        	<div class="form-group">
													<label class="col-md-4">Danh Mục: </label>
													<div class="col-md-8">
														<select class="form-control" name="danhmuc">
														<option value="Khoa hoc tu nhien va cong nghe">Khoa học tự nhiên và công nghệ</option>
														<option value="Khoa hoc xa hoi va nhan van">Khoa học xã hội và nhân văn</option>
														<option value="Khoa hoc giao duc">Khoa học giáo dục</option>
														<option value="Khoa hoc moi truong">Khoa học môi trường</option>
														</select>
													</div>
												</div>
												
												<div class="form-group">
													<div class="col-md-4"></div>
													<div class="col-md-8">
														<button type="submit" class="btn btn-primary">ĐĂNG</button>
													</div>
												</div>
									        </form>
									      </div>
									    </div>
									  </div>
									</div>
									<!-- Modal -->
									<div class="modal fade" id="giaophanbien" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									  <div class="modal-dialog" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									        <h4 class="modal-title" id="myModalLabel">Phân Công Phản Biện</h4>
									      </div>
									      <div class="modal-body">
									      	<sql:query dataSource="${dbsource}" var="dbgiaophanbien">
												SELECT * from ds_baiviet_dagui
												where ds_baiviet_dagui.ID_baiviet_dagui=?
												<sql:param value="${param.id}" />					    
											</sql:query>
											<sql:query dataSource="${dbsource}" var="dsnguoiphanbien">
												SELECT * from taikhoan
												where MaQuyen=3					    
											</sql:query>
									        <form method="post" class="form-horizontal" action="giaophanbien.jsp">
									        <c:forEach var="row" items="${dbgiaophanbien.rows}">
									        	<div hidden="" class="form-group">
													<label class="col-md-4">ID: </label>
													<input type="text" name="idbaiviet" value="${row.ID_baiviet_dagui}">
												</div>
									        	<div class="form-group">
													<label class="col-md-4">Tiêu Đề: </label>
													<p class="col-md-8"><c:out value="${row.tieude}"></c:out></p>
												</div>
												<div class="form-group">
													<label class="col-md-4">Người Phản Biện: </label>
													<div class="col-md-8">
														<select class="form-control" name="idnguoiphanbien">
															<c:forEach var="ds" items="${dsnguoiphanbien.rows}">
																<option value="${ds.Username}"><c:out value="${ds.last_name} ${ds.first_name}"></c:out></option>
															</c:forEach>
														</select>
													</div>
												</div>
									
											</c:forEach>
											<div class="form-group">
												<div class="col-md-4"></div>
												<div class="col-md-8">
													<button type="submit" class="btn btn-primary">Giao bài</button>
													
												</div>
											</div>

									        </form>
									      </div>
									    </div>
									  </div>
									</div>
									<!-- Modal -->
									<div class="modal fade" id="giaobientap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									  <div class="modal-dialog" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									        <h4 class="modal-title" id="myModalLabel">Phân Công Biên Tập</h4>
									      </div>
									      <div class="modal-body">
									      	<sql:query dataSource="${dbsource}" var="dbgiaobientap">
												SELECT * from ds_baiviet_dagui
												where ds_baiviet_dagui.ID_baiviet_dagui=?
												<sql:param value="${param.id}" />					    
											</sql:query>
											<sql:query dataSource="${dbsource}" var="dsnguoibientap">
												SELECT * from taikhoan
												where MaQuyen=2					    
											</sql:query>
									        <form method="post" class="form-horizontal" action="giaobientap.jsp">
									        <c:forEach var="row" items="${dbgiaobientap.rows}">
									        	<div hidden="" class="form-group">
													<label class="col-md-4">ID: </label>
													<input type="text" name="idbaiviet" value="${row.ID_baiviet_dagui}">
												</div>
									        	<div class="form-group">
													<label class="col-md-4">Tiêu Đề: </label>
													<p class="col-md-8"><c:out value="${row.tieude}"></c:out></p>
												</div>
												<div class="form-group">
													<label class="col-md-4">Người Biên Tập: </label>
													<div class="col-md-8">
														<select class="form-control" name="idnguoibientap">
															<c:forEach var="ds" items="${dsnguoibientap.rows}">
																<option value="${ds.Username}"><c:out value="${ds.last_name} ${ds.first_name}"></c:out></option>
															</c:forEach>
														</select>
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-md-4">Ghi chú: </label>
													<div class="col-md-8">
														<textarea name="ghichu" class="form-control" rows="5" placeholder="Nhập ghi chú cho bài viết"></textarea>
													</div>
												</div>
									
											</c:forEach>
											<div class="form-group">
												<div class="col-md-4"></div>
												<div class="col-md-8">
													<button type="submit" class="btn btn-primary">Giao bài</button>
													
												</div>
											</div>

									        </form>
									      </div>
									    </div>
									  </div>
									</div>
									
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
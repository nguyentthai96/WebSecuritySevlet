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
									<button class="btn btn-default dropdown-toggle textcolor" type="button" style="background: #0c6b63;" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
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
			<div id="Main" >
					<div class="row">
						<!--cột trái-->
						<div class="col-md-2">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title" ><strong>Lĩnh vực</strong></h3>
								</div >

								
								
								<ul class="list-group"> 
								<li class="list-group-item" data-id="journal1672"> 
								  <a href="" class="list-group-item"><strong>Khoa học tự nhiên và công nghệ</strong></a>
								  		<ul id="journal1672" style="display: none;">
											<li><a href="" style="font-weight:normal">Ban biên tập</a></li>
											<li><a href="" style="font-weight:normal" id="khcn">Bài viết</a></li>
										</ul>
								<li class="list-group-item" data-id="journal1673"> 
								  <a href="" class="list-group-item"><strong>Khoa học xã hội và nhân văn</strong></a>
								  		<ul id="journal1673" style="display: none;">
											<li><a href="" style="font-weight:normal">Ban biên tập</a></li>
											<li><a href="" style="font-weight:normal" id="khxh">Bài viết</a></li>
										</ul>
								 <li class="list-group-item" data-id="journal1674"> 
								  <a href="" class="list-group-item"><strong>Khoa học giáo dục</strong></a>
								  		<ul id="journal1674" style="display: none;">
											<li><a href="" style="font-weight:normal">Ban biên tập</a></li>
											<li><a href="" style="font-weight:normal" id="khgd">Bài viết</a></li>
										</ul>
								 <li class="list-group-item" data-id="journal1675"> 
								  <a href="" class="list-group-item"><strong>Khoa học môi trường</strong></a>
								  		<ul id="journal1675" style="display: none;">
											<li><a href="" style="font-weight:normal">Ban biên tập</a></li>
											<li><a href="" style="font-weight:normal" id="khmt">Bài viết</a></li>
										</ul>
								</ul>		
							</div>
							
							
							<!--Ajax-->	
						 <script type="text/javascript">
							 $(document).ready(function() {
							 $('#khcn').click(function(e) {
							 e.preventDefault();
							 $('#nd').load('timkiemnangcao.jsp #ndtk1');
							 });
							 });

							 $(document).ready(function() {
							 $('#khxh').click(function(e) {
							 e.preventDefault();
							 $('#nd').load('timkiemnangcao.jsp #ndtk2');
							 });
							 });

							 $(document).ready(function() {
							 $('#khgd').click(function(e) {
							 e.preventDefault();
							 $('#nd').load('timkiemnangcao.jsp #ndtk3');
							 });
							 });

							 $(document).ready(function() {
							 $('#khmt').click(function(e) {
							 e.preventDefault();
							 $('#nd').load('timkiemnangcao.jsp #ndtk4');
							 });
							 });
						</script>
							
							
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
						<div class="col-md-7 line" id="nd">
							<!-- panel tiêu điểm -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><strong>Tạp Chí</strong></h3>
								</div>
								<div class="panel-body">
									
										<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
										    url="${sessionScope['url']}" user="${sessionScope['userdb']}" 
										    password="${sessionScope['passdb']}" />
						
										<sql:query dataSource="${ds}" var="rs">								 
										    SELECT *  FROM ds_noidung_bientap
										    Where dstukhoa_bientap= '${param.keys}'
										</sql:query>
										
										<sql:query dataSource="${ds}" var="rs2">								 
										    	select * from ds_baiviet_dagui,
												ds_noidung_bientap, ds_baiviet_bientap
												where 
												ds_baiviet_dagui.ID_baiviet_dagui=ds_baiviet_bientap.ID_baiviet_dagui
												and ds_baiviet_bientap.ID_baiviet_bientap=ds_noidung_bientap.ID_baiviet_bientap
                                                and trangthai_duocdang=2												
												and ds_baiviet_dagui.username_taikhoan='${param.keys }'
												and NgayDang='${param.date}' 
										</sql:query>
									<c:choose>
							
										<c:when test="${not empty rs.rows }">
											<c:forEach items="${rs.rows}" var="rows">								  	
												<div class="media">
													<a class="pull-left" href="xulyxembai.jsp?id=${rows.ID_noidung_bientap }">
														<img class="media-object" src="images/2.jpg" alt="...">
													</a>
													<div class="media-body">
														<h5 class="media-heading"><a href="xulyxembai.jsp?id=${rows.ID_noidung_bientap }">
														<c:out value="${rows.tieude_bientap}"/></a></h5>
														<em><font color="silver">Số:<c:out value="${rows.NgayDang }"></c:out></font></em>	    
													</div>
												 </div>													
											</c:forEach>										
										</c:when>
							
							
										<c:when test="${not empty rs2.rows }">
											<c:forEach items="${rs2.rows}" var="rows2">								  	
												<div class="media">
													<a class="pull-left" href="xulyxembai.jsp?id=${rows2.ID_noidung_bientap }">
														<img class="media-object" src="images/2.jpg" alt="...">
													</a>
													<div class="media-body">
														<h5 class="media-heading"><a href="xulyxembai.jsp?id=${rows2.ID_noidung_bientap }">
														<c:out value="${rows2.tieude_bientap}"/></a></h5>
														<em><font color="silver">Số:<c:out value="${rows2.NgayDang }"></c:out></font></em>	    
													</div>
												 </div>													
											</c:forEach>
										</c:when>
							
							
										<c:otherwise>
											<Center><font color="green">Không Tìm Thấy Nội Dung Bạn Cần Tìm</font></Center>
										</c:otherwise>
									</c:choose>
						
								</div>

								</div>	
						<!--end panel -->
						
						
							
						</div>
					<!--end cột giữa-->

					<!--Ajax-->	
						 <script type="text/javascript">
							 $(document).ready(function() {
							 $('#GioiThieu').click(function(e) {
							 e.preventDefault();
							 $('#nd').load('gioithieu.jsp #ndgt-canlay');
							 });
							 });

							 $(document).ready(function() {
							 $('#QDHD').click(function(e) {
							 e.preventDefault();
							 $('#nd').load('quydinh_huongdan.jsp #ndqd-canlay');
							 });
							 });

							 $(document).ready(function() {
							 $('#LienHe').click(function(e) {
							 e.preventDefault();
							 $('#nd').load('lienhe.jsp #ndlh-canlay');
							 });
							 });

							 $(document).ready(function() {
							 $('#LienKet').click(function(e) {
							 e.preventDefault();
							 $('#nd').load('lienket.jsp #ndlk-canlay');
							 });
							 });
						</script>
	  				<!--endAjax-->

					<!--cột 3-->
						<div class="col-md-3">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><strong>Được Đọc nhiều</strong></h3>
								</div>
								<div class="panel-body">
									<marquee scrolldelay="6" scrollamount="2" onmouseover="this.stop()"" onmouseout="this.start()" direction="up" height="300" style="height:300px;"  behavior="" direction="">
										<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" 
													url="${sessionScope['url']}" user="${sessionScope['userdb']}" 
										   			password="${sessionScope['passdb']}" />
										   			
													<sql:query dataSource="${con}" var="result3">
														select ID_baiviet,ds_noidung_bientap.tieude_bientap, sum(comment.danhgia)
														from comment,ds_noidung_bientap
														where comment.ID_baiviet=ds_noidung_bientap.ID_noidung_bientap
														group by ID_baiviet,tieude_bientap
														LIMIT 4
													</sql:query>
										<c:forEach items="${result3.rows}" var="rows">	
										        	
										  	<div class="media">
												<a class="pull-left" href="xulyxembai.jsp?id=${rows.ID_baiviet }">
														    <img class="media-object" src="images/3.jpg" alt="...">
												 </a>
												<div class="media-body">
													<h5 class="media-heading"><a href="xulyxembai.jsp?id=${rows.ID_baiviet }"><c:out value="${rows.tieude_bientap}"/></a></h5>
														    
												</div>
											</div>
																		
										</c:forEach>
										

										
									</marquee>
								</div>
							</div><!--end panel-->
							<div class="media">
							 <h3 class="glyphicon glyphicon-earphone"><strong> 0166.680.7064</strong></h3>
							  <a class="pull-left" href="">
							    <img class="media-object" src="images/quangcao.jpg" alt="...">
							  </a>
							</div>
						</div>
					<!--end cột 3-->
					</div><!--endrow chinh-->
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
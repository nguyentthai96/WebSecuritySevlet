<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
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
								<div class="nav navbar col-md-push-6">						
											<button class="btn btn-default textcolor" style="background: #0c6b63;" data-toggle="modal" data-target="#myModal">
											  Đăng Nhập
											</button>

										<!-- Modal 1 -->
									
											<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
											        <h4 class="modal-title" id="myModalLabel">Đăng Nhập</h4>
											      </div>
											      <!--body-->
											      <div class="modal-body">
											      	<form id="FormDangNhap" method="post" action="loginAuthenticate.jsp"  class="form-horizontal">
												      	<label class="radio-inline">
												      		<input type="radio" name="q"  value="0" checked>  Admin
												      	</label>
												      	<label class="radio-inline">
												      		<input type="radio" name="q"  value="1">  Tổng Biên Tập
												      	</label>
												      	<label class="radio-inline">
												      		<input type="radio" name="q"  value="2">  Biên Tập Viên
												      	</label>
												      	<label class="radio-inline">
												      		<input type="radio" name="q"  value="3">  Phản Biện
												      	</label>
												      	<label class="radio-inline">
												      		<input type="radio" name="q"  value="4">  Tác Giả
												      	</label>
												      	<br><br>
														<div class="form-group">
															<label class="col-sm-4 control-label" for="username_signin">User Name </label>
															<div class="col-sm-5">
																<input type="text" class="form-control" id="username_signin" name="uname" placeholder="Username" />
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-4 control-label" for="password_signin">Password</label>
															<div class="col-sm-5">
																<input type="password" class="form-control" id="password_signin" name="pass" placeholder="Password" />
															</div>
														</div>
														
														<div class="modal-footer modal-footer-left">
															<a href="" data-toggle="modal" data-target="#modalResetpw">Forgot Password? </a>
													        <input type="submit" class="btn btn-primary col-md-offset-5" role="button" value="Đăng Nhập"/> 
													        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>												    
												        </div>
													</form>
													 <script type="text/javascript">
														$( document ).ready( function () {
															$( "#FormDangNhap" ).validate( {
																rules: {
																	uname: {
																		required: true,
																		minlength: 2
																	},
																	pass: {
																		required: true,
																		minlength: 5
																	},
																},
																errorElement: "em",
																errorPlacement: function ( error, element ) {
																	// Add the `help-block` class to the error element
																	error.addClass( "help-block" );

																	// Add `has-feedback` class to the parent div.form-group
																	// in order to add icons to inputs
																	element.parents( ".col-sm-5" ).addClass( "has-feedback" );

																	if ( element.prop( "type" ) === "checkbox" ) {
																		error.insertAfter( element.parent( "label" ) );
																	} else {
																		error.insertAfter( element );
																	}

																	// Add the span element, if doesn't exists, and apply the icon classes to it.
																	if ( !element.next( "span" )[ 0 ] ) {
																		$( "<span class='glyphicon glyphicon-remove form-control-feedback'></span>" ).insertAfter( element );
																	}
																},
																success: function ( label, element ) {
																	// Add the span element, if doesn't exists, and apply the icon classes to it.
																	if ( !$( element ).next( "span" )[ 0 ] ) {
																		$( "<span class='glyphicon glyphicon-ok form-control-feedback'></span>" ).insertAfter( $( element ) );
																	}
																},
																highlight: function ( element, errorClass, validClass ) {
																	$( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
																	$( element ).next( "span" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
																},
																unhighlight: function ( element, errorClass, validClass ) {
																	$( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
																	$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
																}
															} );
														} );
													</script>
											      </div>   
											      <!--end body-->
											    </div>
											  </div>
											</div>
										<!-- end Modal 1 -->
										<!-- modal reset pw -->
										<div class="modal fade" id="modalResetpw" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
											        <h4 class="modal-title" id="myModalLabel">Khôi Phục Mật Khẩu</h4>
											      </div>
											      <!--body-->
											      <div class="modal-body">
											      	<form id="FormResetpw" method="post" action="SendServlet"  class="form-horizontal">
											      	<center><font color="blue" >Mật khẩu sẽ được reset và gửi vào địa chỉ Email bạn đã đăng ký		</font></center>	
											      		<br>
											      		<br>			
														<div class="form-group">
															<label class="col-sm-4 control-label" for="password_signin">Email</label>
															<div class="col-sm-5">
																<input type="email" class="form-control" id="" name="email" placeholder="Email Address" />
															</div>
														</div>
														<br>
														<br>
														<div class="modal-footer modal-footer-left">
													        <input type="submit" class="btn btn-primary col-md-offset-5" role="button" value="Reset"/> 
													        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>												    
												        </div>
													</form>
													 <script type="text/javascript">
														$( document ).ready( function () {
															$( "#FormResetpw" ).validate( {
																rules: {
																	
																	email: {
																		required: true,
																		email: true
																	},
																},
																errorElement: "em",
																errorPlacement: function ( error, element ) {
																	// Add the `help-block` class to the error element
																	error.addClass( "help-block" );

																	// Add `has-feedback` class to the parent div.form-group
																	// in order to add icons to inputs
																	element.parents( ".col-sm-5" ).addClass( "has-feedback" );

																	if ( element.prop( "type" ) === "checkbox" ) {
																		error.insertAfter( element.parent( "label" ) );
																	} else {
																		error.insertAfter( element );
																	}

																	// Add the span element, if doesn't exists, and apply the icon classes to it.
																	if ( !element.next( "span" )[ 0 ] ) {
																		$( "<span class='glyphicon glyphicon-remove form-control-feedback'></span>" ).insertAfter( element );
																	}
																},
																success: function ( label, element ) {
																	// Add the span element, if doesn't exists, and apply the icon classes to it.
																	if ( !$( element ).next( "span" )[ 0 ] ) {
																		$( "<span class='glyphicon glyphicon-ok form-control-feedback'></span>" ).insertAfter( $( element ) );
																	}
																},
																highlight: function ( element, errorClass, validClass ) {
																	$( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
																	$( element ).next( "span" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
																},
																unhighlight: function ( element, errorClass, validClass ) {
																	$( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
																	$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
																}
															} );
														} );
													</script>
											      </div>   
											      <!--end body-->
											    </div>
											  </div>
											</div>
										
										<!-- end reset -->

											<button class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myModal1">
											  Đăng Ký
											</button>
										<!-- Modal 2 -->
											<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
											        <h4 class="modal-title" id="myModalLabel">Đăng Ký</h4>
											      </div>
											      <!--body-->
											      <div class="modal-body">
											        	<form id="FormDangKy" method="post" class="form-horizontal" action="registration.jsp">

															<div class="form-group">
																<label class="col-sm-4 control-label" for="ho">Họ</label>
																<div class="col-sm-5">
																	<input type="text" class="form-control" id="ho" name="ho" placeholder="Họ">
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-4 control-label" for="ten">Tên</label>
																<div class="col-sm-5">
																	<input type="text" class="form-control" id="ten" name="ten" placeholder="Tên">
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-4 control-label" for="username">UserName</label>
																<div class="col-sm-5">
																	<input type="text" class="form-control" id="username" name="username" placeholder="Username">
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-4 control-label" for="email">Email </label>
																<div class="col-sm-5">
																	<input type="email" class="form-control" id="email" name="email" placeholder="Email">
																</div> 
															</div>

															<div class="form-group">
																<label class="col-sm-4 control-label" for="password">Password </label> 
																<div class="col-sm-5">
																	<input type="password" class="form-control" id="password" name="password" placeholder="Password">
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-4 control-label" for="confirm">Confirm PassWord </label> 
																<div class="col-sm-5">
																	<input type="password" class="form-control" id="confirm" name="confirm" placeholder="Confirm Password">
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-5 col-sm-offset-4">
																	<div class="checkbox">
																		<label>
																			<input type="checkbox" id="agree1" name="agree1" value="agree" />Đồng ý điều khoản 
																		</label>
																	</div>
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-9 col-sm-offset-2">
																	<button type="submit" class="btn btn-primary col-md-offset-4" name="signup1" value="Sign up">Đăng Ký</button>
																</div>
															</div>
															
														</form>
											      </div>
											      <!--endbody-->
											      <div class="modal-footer">
											        <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
											        
											      </div>
											    </div>
											  </div>
											</div>
											<script>
												$( document ).ready( function () {
													$( "#FormDangKy" ).validate( {
														rules: {
															ho: "required",
															ten: "required",
															username: {
																required: true,
																minlength: 2
															},
															password: {
																required: true,
																minlength: 5
															},
															confirm: {
																required: true,
																minlength: 5,
																equalTo: "#password"
															},
															email: {
																required: true,
																email: true
															},
															agree1: "required"
														},
														errorElement: "em",
														errorPlacement: function ( error, element ) {
															// Add the `help-block` class to the error element
															error.addClass( "help-block" );

															// Add `has-feedback` class to the parent div.form-group
															// in order to add icons to inputs
															element.parents( ".col-sm-5" ).addClass( "has-feedback" );

															if ( element.prop( "type" ) === "checkbox" ) {
																error.insertAfter( element.parent( "label" ) );
															} else {
																error.insertAfter( element );
															}

															// Add the span element, if doesn't exists, and apply the icon classes to it.
															if ( !element.next( "span" )[ 0 ] ) {
																$( "<span class='glyphicon glyphicon-remove form-control-feedback'></span>" ).insertAfter( element );
															}
														},
														success: function ( label, element ) {
															// Add the span element, if doesn't exists, and apply the icon classes to it.
															if ( !$( element ).next( "span" )[ 0 ] ) {
																$( "<span class='glyphicon glyphicon-ok form-control-feedback'></span>" ).insertAfter( $( element ) );
															}
														},
														highlight: function ( element, errorClass, validClass ) {
															$( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
															$( element ).next( "span" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
														},
														unhighlight: function ( element, errorClass, validClass ) {
															$( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
															$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
														}
													} );
												} );
											</script>
										<!--end modal 2-->										
								</div>
			
							</div>
						</div>
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
										<li><a class="textcolor" href="index.jsp"><strong>Trang chủ</strong></a></li>
										<li><a class="textcolor" href="gioithieu.jsp"><strong>Giới Thiệu</strong></a></li>
										<li><a class="textcolor" href="quydinh_huongdan.jsp"><strong>Quy Định-Hướng Dẫn</strong></a></li>
										<li><a class="textcolor" href="lienhe.jsp"><strong>Liên Hệ</strong></a></li>
										<li><a class="textcolor" href="lienket.jsp"><strong>Liên Kết</strong></a></li>
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
											<li><a href="" style="font-weight:normal">Ban biên tập</a></li>
											<li><a href="" style="font-weight:normal" id="khcn">Bài viết</a></li>
										</ul>
								<li class="list-group-item" data-id="journal1673"> 
								  <a href="#" class="list-group-item"><strong>Khoa học xã hội và nhân văn</strong></a>
								  		<ul id="journal1673" style="display: none;">
											<li><a href="" style="font-weight:normal">Ban biên tập</a></li>
											<li><a href="" style="font-weight:normal" id="khxh">Bài viết</a></li>
										</ul>
								 <li class="list-group-item" data-id="journal1674"> 
								  <a href="#" class="list-group-item"><strong>Khoa học giáo dục</strong></a>
								  		<ul id="journal1674" style="display: none;">
											<li><a href="" style="font-weight:normal">Ban biên tập</a></li>
											<li><a href="" style="font-weight:normal" id="khgd">Bài viết</a></li>
										</ul>
								 <li class="list-group-item" data-id="journal1675"> 
								  <a href="#" class="list-group-item"><strong>Khoa học môi trường</strong></a>
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
							 $('#tknc').load('timkiemnangcao.jsp #ndtk1');
							 });
							 });

							 $(document).ready(function() {
							 $('#khxh').click(function(e) {
							 e.preventDefault();
							 $('#tknc').load('timkiemnangcao.jsp #ndtk2');
							 });
							 });

							 $(document).ready(function() {
							 $('#khgd').click(function(e) {
							 e.preventDefault();
							 $('#tknc').load('timkiemnangcao.jsp #ndtk3');
							 });
							 });

							 $(document).ready(function() {
							 $('#khmt').click(function(e) {
							 e.preventDefault();
							 $('#tknc').load('timkiemnangcao.jsp #ndtk4');
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
				<div id="ndtk-canlay">
					<!--cột giữa-->
						<div class="col-md-7 line" id="ndlh-canlay">
						<div id="tknc">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><strong>TẠP CHÍ</strong></h3>
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
							</div>
						</div>
					<!--end cột giữa-->

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
				</div>
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
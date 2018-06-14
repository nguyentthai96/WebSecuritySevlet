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
		<div class="col-md-12 well">
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
			<div id="Main">	
					<div class="row">
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
						<div class="col-md-7 line" id="nd">
							 <div class="tab-content">
						<!-- tab Info -->
							 	<div class="tab-pane fade in active" id="info">
								 	<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title"><strong>Thông Tin Cá Nhân</strong></h3>
									</div>
									<div class="panel-body">
									<c:choose>
										<c:when test="${not empty sessionScope['loginUser']}">
										
									      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                  							 url="${sessionScope['url']}" user="${sessionScope['userdb']}" 
                  							 password="${sessionScope['passdb']}" />
                  							 								                       
										 <sql:query dataSource="${ds}" var="selectQ">
									        select * from taikhoan
									        where Username='${sessionScope['loginUser']}'
									      </sql:query>
									 
									      <c:forEach items="${selectQ.rows}" var="r">
									        <c:choose>
									          <c:when test="${r.Username != NULL}">
									          	
									          		<div class="col-sm-3">	
									          <!-- ảnh đại diện -->
									          			<script type="text/javascript">
														function file_change(f){
															var reader = new FileReader();
															reader.onload = function (e) {
																var img = document.getElementById("img");
																img.src = e.target.result;
																img.style.display = "inline";
															};
															reader.readAsDataURL(f.files[0]);
														}
														</script>						          		
									          			<img id="img" src="GetImage"  
									          			class="img-rounded" style="border-color:Navy;border-width:1px;border-style:Dashed;height:140px;width:120px;"/>	          						          									
									          			<br>
									          			<br>
														<form method="post" action="FileUploadDBServlet" enctype="multipart/form-data">													
		                									<input id="f" type="file" name="photo" onchange="file_change(this)" style="display: none" />
															<input class="btn btn-default" type="button" value="Chọn ảnh" onclick="document.getElementById('f').click()" />	
		                									<br>
		                									<br>
															<button class="btn btn-default" type="submit">Save</button>
														</form>	
												<!-- end ảnh đại diện -->										
													</div>
												<form class="form-horizontal" method="post" action="edit_trangcanhan.jsp" >	
													<div class="col-sm-9">													    			
										    		<!-- Thông Báo -->								    
												        <font color="green"><c:if test="${not empty param.susMsg}">
												            <c:out value="${param.susMsg}" />										            									           
												        </c:if></font>		
										    	 	<!-- Họ Tên -->									    				
														  <div class="form-group" >	  
															  <div class="tab-content">
															  	<div class="tab-pane fade in active" id="edten">
																  	<label class="col-sm-3 control-label">Tên</label>
																    <div class="col-sm-8" >
																      <p class="form-control-static"><c:out value="${r.first_name}"/> </p>
																    </div>
																    <a href="#edit_ten" data-toggle="tab"  class="glyphicon glyphicon-edit"></a>
															  	</div>
															  
																  <div class="tab-pane fade" id="edit_ten">
																	  	<label class="col-sm-3 control-label">Tên</label>
																	    <div class="col-sm-8" >
																	      <input type="text" value="${r.first_name}" name="tencn"/>
																	    </div>
																	    <button type="submit" class="glyphicon glyphicon-floppy-save col-sm-offset-3 btn"></button>
																	    <a href="#edten" data-toggle="tab"  class="glyphicon glyphicon-floppy-remove btn btn-default"></a>															    														    
																  </div>														  
															  </div>							 
														   </div>
													<!-- Họ -->	  
															 <div class="form-group" >	  
															  <div class="tab-content">
															  	<div class="tab-pane fade in active" id="edho">
																  	<label class="col-sm-3 control-label">Họ</label>
																    <div class="col-sm-8" >
																      <p class="form-control-static"><c:out value="${r.last_name}"/> </p>
																    </div>
																    <a href="#edit_ho" data-toggle="tab"  class="glyphicon glyphicon-edit"></a>
															  	</div>
															  
																  <div class="tab-pane fade" id="edit_ho">
																	  	<label class="col-sm-3 control-label">Họ</label>
																	    <div class="col-sm-8" >
																	      <input type="text" value="${r.last_name}" name="hocn"/>
																	    </div>
																	    <button type="submit"  class="glyphicon glyphicon-floppy-save col-sm-offset-3 btn"></button>
																	    <a href="#edho" data-toggle="tab"  class="glyphicon glyphicon-floppy-remove btn btn-default"></a>	
																  </div>														  
															  </div>							 
														   </div> 
													<!-- Email -->  
															<div class="form-group" >	  
															  <div class="tab-content">
															  	<div class="tab-pane fade in active" id="edemail">
																  	<label class="col-sm-3 control-label">Email</label>
																    <div class="col-sm-8" >
																      <p class="form-control-static"><c:out value="${r.email}"/></p>
																    </div>
																    <a href="#tab_email" data-toggle="tab"  class="glyphicon glyphicon-edit"></a>
															  	</div>
															  
																  <div class="tab-pane fade" id="tab_email">
																	  	<label class="col-sm-3 control-label">Email</label>
																	    <div class="col-sm-8" >
																	      <input type="text" value="${r.email}" name="emailcn"/>
																	    </div>
																	    <button type="submit"  class="glyphicon glyphicon-floppy-save col-sm-offset-3 btn"></button>
																	    <a href="#edemail" data-toggle="tab"  class="glyphicon glyphicon-floppy-remove btn btn-default"></a>	
																  </div>														  
																  </div>							 
															   </div>
													<!-- User -->
																<div class="form-group" >	  													  
																  	<label class="col-sm-3 control-label">Username</label>
																    <div class="col-sm-8" >
																      <p class="form-control-static"><c:out value="${r.Username}"/></p>
																    </div>														    											  								 
															   </div>
													<!-- Pass -->		
															<div class="form-group" >	  
																	<label class="col-sm-3 control-label">Password</label>
																    <div class="col-sm-8" >
																      <p class="form-control-static">***********</p>
																    </div>
																    <a href="#resetpass" data-toggle="tab"  class="glyphicon glyphicon-edit"></a>												  							 
															  </div>	
													<!-- Cơ Quan -->	
																
																<div class="form-group" >	  
																  <div class="tab-content">
																  	<div class="tab-pane fade in active" id="edcq">
																	  	<label class="col-sm-3 control-label">Cơ Quan</label>
																	    <div class="col-sm-8" >
																	      <p class="form-control-static"><c:out value="${r.CoQuan}"/></p>
																	    </div>
																	    <a href="#tab_coquan" data-toggle="tab"  class="glyphicon glyphicon-edit"></a>
																  	</div>
																  
																	  <div class="tab-pane fade" id="tab_coquan">
																		  	<label class="col-sm-3 control-label">Cơ Quan</label>
																		    <div class="col-sm-8" >
																		      <input type="text" value="${r.CoQuan}" name="coquancn"/>
																		    </div>
																		    <button type="submit"  class="glyphicon glyphicon-floppy-save col-sm-offset-3 btn"></button>
																	    	<a href="#edcq" data-toggle="tab"  class="glyphicon glyphicon-floppy-remove btn btn-default"></a>	
																	  </div>														  
																	  </div>							 
																   </div>
													<!-- Thông tin -->	
																	<div class="form-group" >	  
																	  <div class="tab-content">
																	  	<div class="tab-pane fade in active" id="edtt">
																		  	<label class="col-sm-3 control-label">Info</label>
																		    <div class="col-sm-8" >
																		      <p class="form-control-static"><c:out value="${r.ThongTinLienlac}"/></p>
																		    </div>
																		    <a href="#tab_tt" data-toggle="tab"  class="glyphicon glyphicon-edit"></a>
																	  	</div>
																	  
																		  <div class="tab-pane fade" id="tab_tt">
																			  	<label class="col-sm-3 control-label">Info</label>
																			    <div class="col-sm-8" >
																			      <input type="text" value="${r.ThongTinLienlac}" name="ttllcn"/>
																			    </div>
																			    <button type="submit"  class="glyphicon glyphicon-floppy-save col-sm-offset-3 btn"></button>
																	    		<a href="#edtt" data-toggle="tab"  class="glyphicon glyphicon-floppy-remove btn btn-default"></a>	
																		  </div>														  
																		  </div>							 
																	   </div>
													<!-- Ngày Đk -->
																	<div class="form-group" >	  															  	
																		  	<label class="col-sm-3 control-label">RegDate</label>
																		    <div class="col-sm-8" >
																		      <p class="form-control-static"><c:out value="${r.regdate}"/></p>
																		    </div>																     
																	 </div>		
														<a href="thongtincanhan.jsp" class="btn btn-primary col-md-offset-3" role="button">Refresh</a>	
													
													</div>															  												  
												</form>	
												</c:when>
												 <c:otherwise>
													<font color='red'>Không Tồn Tại Người Này! </font>
												 </c:otherwise>
											</c:choose>										 
										</c:forEach>
									  </c:when>
									   <c:otherwise>
											<font color='red'>Không Tồn Tại Người Này! </font>
										</c:otherwise>
									</c:choose>					  								    							
									</div>
									</div>	
							 	</div>
						<!-- tab reset password -->
								<div class="tab-pane fade" id="resetpass">
									<div class="panel">
										<div class="panel-heading">
											<h3 class="panel-title"><strong>Reset PassWord</strong></h3>
										</div>
										<div class="panel-body">
											<form id="FormChangePass" method="post" class="form-horizontal" action="change_pass.jsp">
															<div class="form-group">
																<label class="col-sm-4 control-label" for="password">Old Password </label> 
																<div class="col-sm-5">
																	<input type="password" class="form-control" id="oldpassword" name="oldpassword" placeholder="Old Password">
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-4 control-label" for="password">New Password </label> 
																<div class="col-sm-5">
																	<input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="New Password">
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-4 control-label" for="confirm">Confirm </label> 
																<div class="col-sm-5">
																	<input type="password" class="form-control" id="confirm" name="confirm" placeholder="Confirm New Password">
																</div>
															</div>

															<button type="submit" class="btn btn-primary col-md-offset-5">OK</button>
															<a href="#info" data-toggle="tab"  class="btn btn-default">Cancel </a>															
														</form>	
												<script>
												$( document ).ready( function () {
													$( "#FormChangePass" ).validate( {
														rules: {
															
															oldpassword: {
																required: true,
																minlength: 5
															},
															newpassword: {
																required: true,
																minlength: 5
															},
															confirm: {
																required: true,
																minlength: 5,
																equalTo: "#newpassword"
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
									</div>	
									
								</div>
								
							</div>
								
									
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
										<div class="media">
										  <a class="pull-left" href="xemnoidung.jsp">
										    <img class="media-object" src="images/3.jpg" alt="...">
										  </a>
										  <div class="media-body">
										    <h6 class="media-heading"><a href="xemnoidung.jsp">Nhà Giáo VN</a></h6>
										    chào mừng ngày nahf giáo việt nam......
										  </div>
										</div>
										<!--continute-->
										<div class="media">
										  <a class="pull-left" href="xemnoidung.jsp">
										    <img class="media-object" src="images/3.jpg" alt="...">
										  </a>
										  <div class="media-body">
										    <h6 class="media-heading"><a href="xemnoidung.jsp">University</a></h6>
										    cẩn thận số khi nghe.............
										  </div>
										</div>
										<!--continute-->
										<div class="media">
										  <a class="pull-left" href="xemnoidung.jsp">
										    <img class="media-object" src="images/3.jpg" alt="...">
										  </a>
										  <div class="media-body">
										    <h6 class="media-heading"><a href="xemnoidung.jsp"> HCMUTE</a></h6>
										    nhà trường tăng học phí gấp 5 lần......
										  </div>
										</div>

										<div class="media">
										  <a class="pull-left" href="xemnoidung.jsp">
										    <img class="media-object" src="images/3.jpg" alt="...">
										  </a>
										  <div class="media-body">
										    <h6 class="media-heading"><a href="xemnoidung.jsp">University</a></h6>
										    cẩn thận số khi nghe.............
										  </div>
										</div>
										<div class="media">
										  <a class="pull-left" href="xemnoidung.jsp">
										    <img class="media-object" src="images/3.jpg" alt="...">
										  </a>
										  <div class="media-body">
										    <h6 class="media-heading"><a href="xemnoidung.jsp">University</a></h6>
										    cẩn thận số khi nghe.............
										  </div>
										</div>
										<div class="media">
										  <a class="pull-left" href="xemnoidung.jsp">
										    <img class="media-object" src="images/3.jpg" alt="...">
										  </a>
										  <div class="media-body">
										    <h6 class="media-heading"><a href="xemnoidung.jsp">University</a></h6>
										    cẩn thận số khi nghe.............
										  </div>
										</div>

										
									</marquee>
								</div>
							</div><!--end panel-->
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

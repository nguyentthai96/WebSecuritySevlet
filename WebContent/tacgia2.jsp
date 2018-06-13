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
									<h3 class="panel-title"><strong>Gửi Bài</strong></h3>
								</div>
								<div class="panel-body">
									<div>
										<ul class="nav nav-tabs">
											<li class="active"><a href="#guibaionline" data-toggle="tab">Gửi Bài Online</a></li>
										    <li><a href="#dsbaidaviet" data-toggle="tab">Danh Sách Bài Đã Viết</a></li>
										</ul>
										<br>
										<div class="tab-content">
											<div class="tab-pane fade in active" id="guibaionline">
												<!--cot trái-->
											<form id="FormGuiBai" method="post" class="form-horizontal" action="GuibaiServlet" enctype="multipart/form-data" accept-charset="UTF-8">
												<div class="col-md-8">											
														<div class="form-group">
															<label for="tieude" class="col-sm-2">Tiêu Đề</label>
															<div class="col-sm-10">
																<input type="text" value="" class="form-control" id="tieude" name="tieude" placeholder="Nhập tiêu đề">
															</div>
														</div>
														<div class="form-group">
															<label for="tieude" class="col-sm-2">Lĩnh Vực</label>
															<div class="col-sm-10">
																<select class="form-control" name="danhmuc">
																<option value="Khoa hoc tu nhien va cong nghe">Khoa học tự nhiên và công nghệ</option>
																<option value="Khoa hoc xa hoi va nhan van">Khoa học xã hội và nhân văn</option>
																<option value="Khoa hoc giao duc">Khoa học giáo dục</option>
																<option value="Khoa hoc moi truong">Khoa học môi trường</option>
														</select>
															</div>
														</div>
														<div class="form-group">
															<label for="tieude" class="col-sm-2">Nội Dung</label>
															<div class="col-sm-10">
																<input type="text" value="" class="form-control" id="noidung" name="noidung" placeholder="Nhập nội dung">
															</div>
														</div>
														<div class="form-group">
															<label for="noidung" class="col-sm-2">File</label>
															<div class="col-sm-10">
																<input type="file" class="form-control" id="file" name="file">
															</div>
														</div>
														<div class="form-group">
															<label for="tieude" class="col-sm-2">Tác Giả</label>
															<div class="col-sm-10">
																<input type="text" value="" class="form-control" id="tacgia" name="tentacgia" placeholder="Tên các tác giả">
															</div>
														</div>
														<div class="form-group">
															<label for="tieude" class="col-sm-2">Cơ Quan</label>
															<div class="col-sm-10">
																<input type="text" value="" class="form-control" id="coquan" name="coquan" placeholder="Nhập cơ quan">
															</div>
														</div>
														<div class="form-group">
															<label for="tieude" class="col-sm-2">Thông tin liên lạc</label>
															<div class="col-sm-10">
																<input type="text" value="" class="form-control" id="ttlc" name="ttll" placeholder="Nhập thông tin">
															</div>
														</div>
														<div class="form-group">
															<label for="dstukhoa" class="col-sm-2">Danh Sách Từ Khóa (nếu có)</label>
															<div class="col-sm-10">
																<textarea  type="text" value=""  class="form-control" id="dstukhoa" name="dstukhoa" rows="10" placeholder="Nhập danh sách từ khóa"></textarea>
															</div>
														</div>
														<div class="col-sm-offset-2">
															<button type="submit" id="guibai" class="btn btn-primary">Gửi Bài</button>
															
															<font color="red"><c:if test="${not empty param.errMsg}">
													            <c:out value="${param.errMsg}" />
		
													        </c:if></font>
													        <font color="green"><c:if test="${not empty param.susMsg}">
													            <c:out value="${param.susMsg}" />
													       
													        </c:if></font>
														</div>
														<script>
														
														function validateText(id)
														{
															if($("#"+id).val()==null || $("#"+id).val()=="")
															{
																var div=$("#"+id).closest("div");
																div.removeClass("has-success");
																div.addClass("has-error has-feedback");
																$("#glypcn"+id).remove();
																div.append('<span id="glypcn'+id+'" class="glyphicon glyphicon-remove form-control-feedback"></span>');
																return false;
															}
															else
															{
																var div=$("#"+id).closest("div");
																div.removeClass("has-error");
																div.addClass("has-success has-feedback");
																$("#glypcn"+id).remove();
																div.append('<span id="glypcn'+id+'" class="glyphicon glyphicon-ok form-control-feedback"></span>');
																return true;
															};
														}
														$(document).ready(
															function()
															{
																$("#guibai").click(function()
																{
																	
																	if(!validateText("tieude"))
																		return false;
																	
																	if(!validateText("noidung"))
																		return false;
																	
																	if(!validateText("file"))
																		return false;
																	
																	if(!validateText("tacgia"))
																		return false;
																	
																	if(!validateText("coquan"))
																		return false;
																	
																	if(!validateText("ttlc"))
																		return false;
																	
																	if(!validateText("dstukhoa"))
																		return false;
																	
																	$("form#FormGuiBai").submit();
																});
															});
													</script>
													
											</div>
											<!--end cột nội dung-->

											<!--cot ảnh bìa-->
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
												<div class="col-md-4">
													<img id="img"  class="img-rounded" 
													style="border-color:Navy;border-width:1px;border-style:Dashed;height:140px;width:120px;"/>
													<br>
													<br>
													<label>Ảnh Bìa</label>
													<input id="f" type="file" name="anhbia" onchange="file_change(this)" style="display: none" />
													<input class="btn btn-default" type="button" value="Chọn" onclick="document.getElementById('f').click()" />														    
												</div>
											</form>
											<!--end cot ảnh bìa-->
											</div >
												<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" 
													url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
											<div class="tab-pane fade" id="dsbaidaviet">
											 <div class="tab-content">
											  <div class="tab-pane fade in active" id="dsbaiviet1">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<th>Tiêu Đề</th>
															<th>Nội Dung</th>
															<th>File</th>
															<th>DS Từ Khóa</th>
															<th>Trạng Thái</th>
															<th>Nhận Xét PB</th>
														</tr>
													</thead>
													<tbody>
												
													<sql:query dataSource="${con}" var="result">
														select *
														from taikhoan,ds_baiviet_dagui, trangthai_tg
														where taikhoan.Username=ds_baiviet_dagui.username_taikhoan 
														and trangthai_tg.ma_trangthai=ds_baiviet_dagui.trangthai
														and taikhoan.Username='${sessionScope['loginUser']}'
													</sql:query>
													<form method="get" action="DownloadFile_TBT">
													<c:forEach var="rows" items="${result.rows }">
														<tr>
															<td>${rows.tieude }</td>
															<td>${rows.noidung }</td>
															<td><button type="submit" value="${rows.ID_baiviet_dagui }" name="id"  class="btn btn-link">${rows.TenFile }</button></td>
															<td>${rows.dstukhoa }</td>
															<td>${rows.Ten_TrangThai }</td>
															<td><a  class="glyphicon glyphicon-eye-open detailX" data-id="${rows.ID_baiviet_dagui}"  data-toggle="tab" href="#xempb"></a></td>
														</tr>
													</c:forEach>
													</form>
													</tbody>
												</table>
												</div>
												
												<script type="text/javascript">
													$(document).ready(function(){
														$(".detailX").click(function(){
															var id = $(this).attr("data-id");
															$.post('LayThongTin',{id:id},function(response){
																var x = response.noidungabc;
																$('#txtTenPB').text(response.ngpb);
																$('#txtNoiDung').text(response.noidungpb);
																$('#txtNgayPB').text(response.ngaypb);
															});
														});
													});
												</script>
												
										<!-- tab xem phản biện -->		
												 <div class="tab-pane fade" id="xempb">
					
													<form class="form-horizontal" method="get" action="DownloadFile_TBT">
														
															<div class="form-group">
																<label class="col-sm-4 control-label">Tên Người Phản Biện: </label>
																<div class="col-sm-8">
																	<p type="text" id="txtTenPB" class="form-control-static"></p>
																</div>
															</div>
															
															<div class="form-group">
																<label class="col-sm-4 control-label">Nội Dung: </label>
																<div class="col-sm-8">
																	<p type="text" id="txtNoiDung" class="form-control-static"></p>
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-4 control-label">Ngày Phản Biện: </label>
																<div class="col-sm-8">
																	<p type="text" id="txtNgayPB" class="form-control-static"></p>
																</div>
															</div>																									
														<Center><a href="#dsbaiviet1" class="btn btn-default glyphicon glyphicon-arrow-left " data-toggle="tab"></a></Center>
													</form>
													
												 </div>
												 </div>
									<!-- end xem pb -->			 
												 
											</div>
										</div>
									</div>
										
								</div>
										<div class="row">
											<div class="col-md-offset-4">
												<!-- <button type="submit" id="guibai" class="btn btn-primary" data-toggle="modal" data-target="#myModal4">
												  Gửi Bài
												</button> -->
												<br><br>
												

												<!-- Modal -->
												<div class="modal" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header">
												        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												        <h4 class="modal-title" id="myModalLabel">Thông Báo!</h4>
												      </div>
												      <div class="modal-body">
													      	<div class="text-center">
													       		Gửi Bài Thành Công!!!
													        </div>
												      </div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
												        
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
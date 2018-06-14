<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	
	<!-- khoa học tự nhiên và công nghệ -->
				
						<div id="ndtk1">						
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><strong>Khoa Học Tự Nhiên & Công Nghệ</strong></h3>
								</div>
								<div class="panel-body">
								<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                  				 url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
 
								<sql:query dataSource="${dataSource}" var="rs" >
								        SELECT * FROM ds_noidung_bientap
								        Where 
								        trangthai_duocdang='2'
								        and danhmuc="Khoa hoc tu nhien va cong nghe"
								</sql:query>
										<div class="row">
									        <c:forEach items="${rs.rows}" var="row">
									                <div class="col-md-4" >
														<div class="col-sm-11 col-md-11" >
													    	<div class="thumbnail aa" >
													    	<em><font color="silver">Số:<c:out value="${row.NgayDang }"></c:out></font></em>
													      		<a href="xulyxembai.jsp?id=${row.ID_noidung_bientap }" class="thumbnail">
													      		<img src="GetAnhBT?id_bt=${row.ID_noidung_bientap }" style="border-width:1px;height:160px;width:155px;">
													      		</a>
													      	</div>								      														      		
													     		  <Center>
													        		<a href="xulyxembai.jsp?id=${row.ID_noidung_bientap }"><strong><c:out value="${row.tieude_bientap}"/></strong></a>										        												    										        
													      		  </Center>									      		
														</div>
													</div>																							
									        </c:forEach>
									 	 </div>														
								<!--end-->
								</div>
							</div>
						</div>
						
						
						
	<!-- khoa học xã hội và nhân văn -->
				
						<div id="ndtk2">						
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><strong>Khoa Học Xã Hội & Nhân Văn</strong></h3>
								</div>
								<div class="panel-body">
								<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                  				url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
 
								<sql:query dataSource="${dataSource}" var="rs" >
								        SELECT * FROM ds_noidung_bientap
								        Where 
								        trangthai_duocdang='2'
								        and danhmuc="Khoa hoc xa hoi va nhan van"
								</sql:query>
										<div class="row">
									        <c:forEach items="${rs.rows}" var="row">
									                <div class="col-md-4" >
														<div class="col-sm-11 col-md-11" >
													    	<div class="thumbnail aa" >
													    	<em><font color="silver">Số:<c:out value="${row.NgayDang }"></c:out></font></em>
													      		<a href="xulyxembai.jsp?id=${row.ID_noidung_bientap }" class="thumbnail">
													      		<img src="GetAnhBT?id_bt=${row.ID_noidung_bientap }" style="border-width:1px;height:160px;width:155px;">
													      		</a>
													      	</div>								      														      		
													     		  <Center>
													        		<a href="xulyxembai.jsp?id=${row.ID_noidung_bientap }"><strong><c:out value="${row.tieude_bientap}"/></strong></a>										        												    										        
													      		  </Center>									      		
														</div>
													</div>																							
									        </c:forEach>
									 	 </div>														
								<!--end-->
								</div>
							</div>
						</div>
						
						
						
			<!-- khoa học giáo dục -->
				
						<div id="ndtk3">						
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><strong>Khoa Học Giáo Dục</strong></h3>
								</div>
								<div class="panel-body">
								<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                  				 url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
 
								<sql:query dataSource="${dataSource}" var="rs" >
								        SELECT * FROM ds_noidung_bientap
								        Where 
								        trangthai_duocdang='2'
								        and danhmuc="Khoa hoc giao duc"
								</sql:query>
										<div class="row">
									        <c:forEach items="${rs.rows}" var="row">
									                <div class="col-md-4" >
														<div class="col-sm-11 col-md-11" >
													    	<div class="thumbnail aa" >
													    	<em><font color="silver">Số:<c:out value="${row.NgayDang }"></c:out></font></em>
													      		<a href="xulyxembai.jsp?id=${row.ID_noidung_bientap }" class="thumbnail">
													      		<img src="GetAnhBT?id_bt=${row.ID_noidung_bientap }" style="border-width:1px;height:160px;width:155px;">
													      		</a>
													      	</div>								      														      		
													     		  <Center>
													        		<a href="xulyxembai.jsp?id=${row.ID_noidung_bientap }"><strong><c:out value="${row.tieude_bientap}"/></strong></a>										        												    										        
													      		  </Center>									      		
														</div>
													</div>																						
									        </c:forEach>
									 	 </div>														
								<!--end-->
								</div>
							</div>
						</div>
					
	
	
	<!-- khoa học môi trường -->
				
						<div id="ndtk4">						
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><strong>Khoa Học Môi Trường</strong></h3>
								</div>
								<div class="panel-body">
								<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                  				 url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
 
								<sql:query dataSource="${dataSource}" var="rs" >
								        SELECT * FROM ds_noidung_bientap
								        Where 
								        trangthai_duocdang='2'
								        and danhmuc="Khoa hoc moi truong"
								</sql:query>
										<div class="row">
									        <c:forEach items="${rs.rows}" var="row">
									                <div class="col-md-4" >
														<div class="col-sm-11 col-md-11" >
													    	<div class="thumbnail aa" >
													    	<em><font color="silver">Số:<c:out value="${row.NgayDang }"></c:out></font></em>
													      		<a href="xulyxembai.jsp?id=${row.ID_noidung_bientap }" class="thumbnail">
													      		<img src="GetAnhBT?id_bt=${row.ID_noidung_bientap }" style="border-width:1px;height:160px;width:155px;">
													      		</a>
													      	</div>								      														      		
													     		  <Center>
													        		<a href="xulyxembai.jsp?id=${row.ID_noidung_bientap }"><strong><c:out value="${row.tieude_bientap}"/></strong></a>										        												    										        
													      		  </Center>									      		
														</div>
													</div>																						
									        </c:forEach>
									 	 </div>														
								<!--end-->
								</div>
							</div>
						</div>
	
	
	
</body>
</html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phân Công</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
 
 		<sql:query dataSource="${dbsource}" var="count">
			SELECT count(*) as kount, ID_baiviet_phanbien from ds_baiviet_phanbien
			where ID_baiviet_dagui='${param.idbaiviet}'													    
		</sql:query>
 	
 		<c:forEach var="row" items="${count.rows }">
	 		<c:if test="${row.kount eq 0 }">
		        <sql:update dataSource="${dbsource}" var="result">
		            INSERT INTO ds_baiviet_phanbien(ngaygiaophanbien, trangthai_phanbien, ID_baiviet_dagui, username_taikhoan) VALUES (CURDATE(),'Chua Phan Bien',?,?);		            
		            <sql:param value="${param.idbaiviet}" />
					<sql:param value="${param.idnguoiphanbien}" />
		        </sql:update>
	        
	  		 <!-- cập nhật trạng thái cho tác giải -->
		       <sql:update dataSource="${dbsource}" var="result1">
			        UPDATE ds_baiviet_dagui SET phancong_PB='1'
			        WHERE ID_baiviet_dagui=?		        					
					<sql:param value="${param.idbaiviet}" />
				</sql:update>
				
	 		<!-- cập nhật trạng thái xử lý cho tác giải -->
		        <sql:update dataSource="${dbsource}" var="result1">
			        UPDATE ds_baiviet_dagui SET trangthai='1'
			        WHERE ID_baiviet_dagui=?		        					
					<sql:param value="${param.idbaiviet}" />
				</sql:update>
			</c:if>	
			
			<c:if test="${row.kount gt 0 }">
		         <sql:update dataSource="${dbsource}" var="result">
		         	UPDATE ds_baiviet_phanbien SET ngaygiaophanbien=CURDATE(), trangthai_phanbien='Chua Phan Bien',
		        	username_taikhoan=?
		        	WHERE ID_baiviet_dagui=?		        	
					<sql:param value="${param.idnguoiphanbien}" />				
					<sql:param value="${param.idbaiviet}" />
				</sql:update>
				
				<!-- cập nhật trạng thái xử lý cho tác giải -->
		        <sql:update dataSource="${dbsource}" var="result1">
			        UPDATE ds_baiviet_dagui SET trangthai='1'
			        WHERE ID_baiviet_dagui=?		        					
					<sql:param value="${param.idbaiviet}" />
				</sql:update>
				
				 <sql:update dataSource="${dbsource}" var="count1">
		            DELETE FROM ds_noidung_phanbien
		            WHERE ID_baiviet_phanbien='${row.ID_baiviet_phanbien}'
        		</sql:update>
         	</c:if>
		</c:forEach>	
		
						
        <c:if test="${result>=1}">
        <Center>
        	<font size="5" color='green'>Phan Cong Thanh Cong !!!</font>
        </Center>
            
 

        </c:if> 
 
 
    </body>
</html>
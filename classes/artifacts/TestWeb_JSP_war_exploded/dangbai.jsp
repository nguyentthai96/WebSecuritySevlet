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
        <title>ĐĂNG BÀI</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
 
 		<sql:query dataSource="${dbsource}" var="laydb">
 			SELECT *
            FROM ds_baiviet_bientap,ds_noidung_bientap, ds_baiviet_phanbien, ds_noidung_phanbien
            WHERE ds_baiviet_bientap.ID_baiviet_bientap=ds_noidung_bientap.ID_baiviet_bientap
            and ds_baiviet_phanbien.ID_baiviet_phanbien=ds_noidung_phanbien.ID_baiviet_phanbien
            and ds_baiviet_bientap.ID_baiviet_dagui='${param.idbaiviet}'
            and ds_baiviet_phanbien.ID_baiviet_dagui='${param.idbaiviet}'
 		</sql:query>
 		
 		<c:forEach var="row" items="${laydb.rows}">
 		
	        <sql:update dataSource="${dbsource}" var="result">	
	           UPDATE ds_noidung_bientap SET trangthai_duocdang ="2", danhmuc=?,  NgayDang= CURDATE()
               WHERE ID_noidung_bientap='${row.ID_noidung_bientap}'             
	         <sql:param value="${param.danhmuc}" />
	        </sql:update>
	        
	        <sql:update dataSource="${dbsource}" var="result1">		          
	           UPDATE ds_noidung_phanbien SET trangthai_duocdang ="2"
               WHERE ID_noidung_phanbien='${row.ID_noidung_phanbien}'  	        
	        </sql:update>
	        
        </c:forEach>
        <c:choose>
        	<c:when test="${result>=1 && result1>=1 }">
        	
        		<sql:update dataSource="${dbsource}" var="result1">	
		           UPDATE ds_baiviet_dagui SET trangthai ='2'
	               WHERE ID_baiviet_dagui='${param.idbaiviet}'                
	       		 </sql:update>
	       		 
        		<Center>
        			 <font size="5" color='green'>Dang Bai Thanh Cong!</font>
        		</Center> 
        		      		
        	</c:when>
        	<c:otherwise>
        		<Center>
        			 <font size="5" color='red'>Bài viết này không đủ điều kiện để đăng!</font>
        		</Center>     		
        	</c:otherwise>
        </c:choose>
        
           
        
 
 
    </body>
</html>
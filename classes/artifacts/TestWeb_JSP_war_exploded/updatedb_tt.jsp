
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <!-- update thông tin -->
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE taikhoan SET last_name =?, first_name=?, CoQuan=?, thongtinlienlac=?
            WHERE id='${param.id}'
            <sql:param value="${param.ho}" />
            <sql:param value="${param.ten}" />
            <sql:param value="${param.coquan}"/>
            <sql:param value="${param.ttll}" />
        </sql:update>
        <c:if test="${count>=1}">
            <font size="5" color='green'>Data updated
            successfully.</font>
            <br>
            <a href="admin2.jsp"class="btn btn-default">Back</a> 
        </c:if>
    </body>
</html>
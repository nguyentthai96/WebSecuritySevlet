
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
 		 <!-- update trang cá nhân -->
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
       	<sql:update dataSource="${dbsource}" var="count1">
            UPDATE taikhoan SET last_name =?, first_name=?, email=?, CoQuan=?, thongtinlienlac=?
            WHERE Username='${sessionScope['loginUser']}'
            <sql:param value="${param.hocn}" />
            <sql:param value="${param.tencn}" />
            <sql:param value="${param.emailcn}"/>
            <sql:param value="${param.coquancn}"/>
            <sql:param value="${param.ttllcn}" />
        </sql:update>
        <c:if test="${count1>=1}">        
            <c:redirect url="thongtincanhan.jsp" >
                <c:param name="susMsg" value="Data updated
            successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>
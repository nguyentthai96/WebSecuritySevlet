<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import ="MD5.MD5" %>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
  //old password
  String password = request.getParameter("oldpassword");
  String passmd5= MD5.encryptMD5(password);
  request.setAttribute("passwordmd5", passmd5);
  //new password
  String newpassword = request.getParameter("newpassword");
  String newpassmd5= MD5.encryptMD5(newpassword);
  request.setAttribute("newpasswordmd5", newpassmd5);
  %>
  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE taikhoan SET Password = '<%=request.getAttribute("newpasswordmd5")%>'
            WHERE Username='${sessionScope['loginUser']}' and Password ='<%=request.getAttribute("passwordmd5")%>'         
        </sql:update> 
        <c:choose>
	        <c:when test="${count>=1}">
	        	<font size="5" color='green'> Your PassWord updated
	            successfully.</font>
	 
	            <c:redirect url="thongtincanhan.jsp" >
	                <c:param name="susMsg" value="PassWord updated
	            successfully." />
	            </c:redirect>
	        </c:when>
	        <c:otherwise>
	        	 <font size="5" color='green'> PassWord Cũ Không Đúng </font>
		            <br>
		         <a href="thongtincanhan.jsp"class="btn btn-default">Back</a> 
	        </c:otherwise>
        </c:choose>
       
    </body>
</html>
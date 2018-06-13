<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import ="MD5.MD5" %>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
  String password = request.getParameter("password");
  String passmd5= MD5.encryptMD5(password);
  request.setAttribute("passwordmd5", passmd5);
 
  %>
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JINSERT Operation</title>
    </head>
    <body>
        <c:if test="${ empty param.Username or empty param.password or empty param.MaQuyen}">
            <c:redirect url="inserttk.jsp" >
                <c:param name="errMsg" value="Vui long nhap lai" />
            </c:redirect>
 
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
 
 
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO taikhoan(Username, Password, MaQuyen, regdate, trangthaihoatdong) VALUES (?,'<%=request.getAttribute("passwordmd5")%>',?,CURDATE(),1);
            
            <sql:param value="${param.Username}" />
			<sql:param value="${param.MaQuyen}" />
        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
            <c:redirect url="inserttk.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if> 
 
 
    </body>
</html>
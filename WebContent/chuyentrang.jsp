<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	 		<c:if test="${sessionScope['qUser']==0}">
             	<c:redirect url="admin2.jsp"/>
             	
             </c:if>
             <c:if test="${sessionScope['qUser']==1}">
             	<c:redirect url="tongbientap2.jsp"/>
             	
             </c:if>
             <c:if test="${sessionScope['qUser']==2}">
             	<c:redirect url="bientapvien2.jsp"/>
             	
             </c:if>
             <c:if test="${sessionScope['qUser']==3}">
             	<c:redirect url="phanbien2.jsp"/>
             	
             </c:if>
             <c:if test="${sessionScope['qUser']==4}">
             	<c:redirect url="tacgia2.jsp"/>
             </c:if>
</body>
</html>
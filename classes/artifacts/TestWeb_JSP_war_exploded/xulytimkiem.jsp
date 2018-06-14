<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

			
			<c:choose>
				<c:when test="${not empty sessionScope['loginUser']}">
					<c:redirect url="ketquatimkiem2.jsp?keys=${param.key}&date=${param.date } "/>
				</c:when>
				<c:otherwise>
					<c:redirect url="ketquatimkiem.jsp?keys=${param.key }&date=${param.date }"/>
				</c:otherwise>
			</c:choose>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="MD5.MD5" %>


 <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
  String password = request.getParameter("pass");
  String passmd5= MD5.encryptMD5(password);
  request.setAttribute("passwordmd5", passmd5);
  %>
   

    <c:if test="${not empty param.uname and not empty param.pass}">
    
    	<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                   url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
 
		<sql:query dataSource="${dataSource}" var="selectQ">
		       	select count(*) as kount from taikhoan
		        where Username='${param.uname}'
		        and Password='<%=request.getAttribute("passwordmd5")%>'
		        and MaQuyen ='${param.q}' 
		        and Trangthaihoatdong='1'
		</sql:query>
      
      
 
      <c:forEach items="${selectQ.rows}" var="r">
        <c:choose>
          <c:when test="${r.kount gt 0}">     	    	
            <c:set scope="session"
                   var="loginUser"
                   value="${param.uname}"/>
            <c:set scope="session"
                   var="qUser"
                   value="${param.q}"/>
                   
             <c:if test="${param.q==0}">
             	 <c:set scope="session"
                   var="phanquyen"
                   value="Quản Lý Tài Khoản"/>
             	<c:redirect url="trangchu.jsp"/>
             		
             </c:if>
             <c:if test="${param.q==1}">
             	<c:set scope="session"
                   var="phanquyen"
                   value="Quản Lý Bài Viết"/>
             	<c:redirect url="trangchu.jsp"/>
             		
             </c:if>
             <c:if test="${param.q==2}">
             	<c:set scope="session"
                   var="phanquyen"
                   value="Biên Tập Bài"/>
             	<c:redirect url="trangchu.jsp"/>
             		
             </c:if>
             <c:if test="${param.q==3}">
             	<c:set scope="session"
                   var="phanquyen"
                   value="Phản Biện Bài Viết"/>
             	<c:redirect url="trangchu.jsp"/>
             		
             </c:if>
             <c:if test="${param.q==4}">
             	<c:set scope="session"
                   var="phanquyen"
                   value="Gửi Bài Viết"/>
             	<c:redirect url="trangchu.jsp"/>            		
             </c:if>
            
          </c:when>
          <c:otherwise>
          	<font color='red'>UserName/PassWord Does Not Match! </font> <a href='index.jsp'>Try again</a>
          </c:otherwise>
        </c:choose>
 
      </c:forEach>
 
    </c:if>
 
 
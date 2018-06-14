<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                   url="${sessionScope['url']}" user="${sessionScope['userdb']}" password="${sessionScope['passdb']}" />
 
<sql:query dataSource="${dataSource}" var="categories" scope="session">
        SELECT * FROM ds_noidung_bientap
        Where trangthai_duocdang='2'
</sql:query>
 
<c:import url="trangchu2.jsp?pageNumber=1"/>

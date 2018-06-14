<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String message = null;
    String noidung_comment = request.getParameter("noidung_comment");    
    int danhgia = 6 - Integer.parseInt(request.getParameter("danhgia"));
    String ID_baiviet = request.getParameter("ID_baiviet");
    String username_nguoi_comment = request.getParameter("username_nguoi_comment");
    String dbURL = (String) session.getAttribute("url");
    String dbUser = (String) session.getAttribute("userdb");
    String dbPass = (String) session.getAttribute("passdb");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into comment(noidung_comment, danhgia, ID_baiviet, username_nguoi_comment) values ('"+ noidung_comment +"','"+ danhgia +"','"+ ID_baiviet +"','"+ username_nguoi_comment +"')");
    if (i > 0) {
    	message = "Bình Luận Thành Công!";
       //	session.setAttribute("Message", message);
        //response.sendRedirect("welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    	request.setAttribute("Message", message);
    	getServletContext().getRequestDispatcher("/xemnoidung2.jsp?id="+ID_baiviet+"").forward(request, response);
    } else {
    	message = "Lỗi!";
    	request.setAttribute("Message", message);
    	getServletContext().getRequestDispatcher("/xemnoidung2.jsp?id="+ID_baiviet+"").forward(request, response);
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String message = null;
    String noidung_comment = request.getParameter("noidung_comment");
    int danhgia = 6 - Integer.parseInt(request.getParameter("danhgia"));
    String ID_baiviet = request.getParameter("ID_baiviet");
    String username_nguoi_comment = request.getParameter("username_nguoi_comment");

    // TODO NTT fixed XSS
    String regex = "[\\s\\w-,]*";
    String stringToValidate = String.format("%s%d%s%s", noidung_comment, danhgia, ID_baiviet, username_nguoi_comment);
    Pattern pattern = Pattern.compile(regex);
    Matcher matcher = pattern.matcher(stringToValidate);
    if (!matcher.matches()) {
        message = "Nội dung nhập vào không hợp lệ";
        request.setAttribute("Messagess", message);
        request.getServletContext().getRequestDispatcher(String.format("/xemnoidung.jsp?id=%s", ID_baiviet)).forward(request, response);
    } else {
        String dbURL = (String) session.getAttribute("url");
        String dbUser = (String) session.getAttribute("userdb");
        String dbPass = (String) session.getAttribute("passdb");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);
        Statement st = con.createStatement();
        //ResultSet rs;
        int i = st.executeUpdate("insert into comment(noidung_comment, danhgia, ID_baiviet, username_nguoi_comment) values ('" + noidung_comment + "','" + danhgia + "','" + ID_baiviet + "','" + username_nguoi_comment + "')");
        if (i > 0) {
            message = "Bình Luận Thành Công!";
            //	session.setAttribute("Message", message);
            //response.sendRedirect("welcome.jsp");
            // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
            request.setAttribute("Message", message);
            request.getServletContext().getRequestDispatcher("/xemnoidung2.jsp?id=" + ID_baiviet + "").forward(request, response);
        } else {
            message = "Lỗi!";
            request.setAttribute("Message", message);
            request.getServletContext().getRequestDispatcher("/xemnoidung2.jsp?id=" + ID_baiviet + "").forward(request, response);
        }
    }
%>
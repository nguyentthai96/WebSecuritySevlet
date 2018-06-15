package GetAnhTG;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import javax.websocket.Session;

@SuppressWarnings("serial")
@WebServlet("/GetAnhTG")
public class GetAnhTG extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,
      ServletException {
	  
	request.setCharacterEncoding("UTF-8");
  	response.setCharacterEncoding("UTF-8");
    
  	Blob photo = null;
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    HttpSession session = request.getSession();
    String dbURL = (String) session.getAttribute("url");
    String dbUser = (String) session.getAttribute("userdb");
    String dbPass = (String) session.getAttribute("passdb");
   
    String id_tg= request.getParameter("id_tg");
    
    String query = "select anh from ds_baiviet_dagui where  ID_baiviet_dagui = ?;";
    ServletOutputStream out = response.getOutputStream();

    try {
    	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
    } catch (Exception e) {
      response.setContentType("text/html");
      out.println("<html><head><title>Person Photo</title></head>");
      out.println("<body><h1>Database Connection Problem.</h1></body></html>");
      return;
    }

    try {
      stmt = conn.prepareStatement(query);
      stmt.setString(1,id_tg);
      rs = stmt.executeQuery();
      if (rs.next()) {
        photo = rs.getBlob(1);
      } else {
        response.setContentType("text/html");
        out.println("<html><head><title>Person Photo</title></head>");
        out.println("<body><h1>No photo found for this user </h1></body></html>");
        return;
      }

      response.setContentType("image/jpg/png");
      InputStream in = photo.getBinaryStream();
      int length = (int) photo.length();

      int bufferSize = 1024;
      byte[] buffer = new byte[bufferSize];

      while ((length = in.read(buffer)) != -1) {
        System.out.println("writing " + length + " bytes");
        out.write(buffer, 0, length);
      }

      in.close();
      out.flush();
    } catch (SQLException e) {
      response.setContentType("text/html");
      out.println("<html><head><title>Error: Person Photo</title></head>");
      out.println("<body><h1>Error=" + e.getMessage() + "</h1></body></html>");
      return;
    } finally {
      try {
        rs.close();
        stmt.close();
        conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }

 
  
}

           
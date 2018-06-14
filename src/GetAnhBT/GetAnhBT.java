package GetAnhBT;

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
@WebServlet("/GetAnhBT")
public class GetAnhBT extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,
            ServletException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        Blob photo = null;
        Connection conn = null;
        // NTT TODO SQL Injection    Statement stmt = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        HttpSession session = request.getSession();
        String dbURL = (String) session.getAttribute("url");
        String dbUser = (String) session.getAttribute("userdb");
        String dbPass = (String) session.getAttribute("passdb");

        String id_bt = request.getParameter("id_bt");

        // NTT TODO SQL Injection String query = "select anh_bientap from ds_noidung_bientap where  ID_noidung_bientap ="+id_bt;
        String query = "select anh_bientap from ds_noidung_bientap where ID_noidung_bientap = ?;";
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
            // NTT          stmt = conn.createStatement();
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, new Integer(id_bt));
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
            System.err.println("GetAnhBT.doGet error SQLException ::: " + e);
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

           
package viduDetail;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
//import com.sun.javafx.collections.MappingChange.Map;

/**
 * Servlet implementation class LayThongTin
 */
@SuppressWarnings({ "serial", "unused" })
@WebServlet("/LayThongTin")
public class LayThongTin extends HttpServlet {
	
       
	 // database connection settings
	   
	   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
    	String dbURL = (String) session.getAttribute("url");
        String dbUser = (String) session.getAttribute("userdb");
        String dbPass = (String) session.getAttribute("passdb");
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");		
		Connection conn = null; 		
		java.util.Map<String, String> map = new LinkedHashMap<String,String>();
		        
		try {
			 DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
	            // queries the database
	            String sql ="SELECT * from ds_baiviet_phanbien,ds_noidung_phanbien,taikhoan,ds_baiviet_dagui "
	            		+ "where ds_baiviet_phanbien.username_taikhoan=taikhoan.Username and "
	            		+ "ds_baiviet_phanbien.ID_baiviet_dagui=ds_baiviet_dagui.ID_baiviet_dagui and "
	            		+ "ds_baiviet_phanbien.ID_baiviet_phanbien=ds_noidung_phanbien.ID_baiviet_phanbien and "
	            		+ "ds_baiviet_dagui.ID_baiviet_dagui="+id;
	            PreparedStatement statement = conn.prepareStatement(sql);	
	            ResultSet result = statement.executeQuery();
			
			while(result.next()){			
				map.put("ngpb", result.getString("first_name"));
				map.put("noidungpb", result.getString("noidung_phanbien"));
				map.put("ngaypb", result.getString("ngayphanbien"));
			}
		
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(new Gson().toJson(map));
		} catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().print("SQL Error: " + ex.getMessage());
        } catch (IOException ex) {
            ex.printStackTrace();
            response.getWriter().print("IO Error: " + ex.getMessage());
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }          
        }
	}

}

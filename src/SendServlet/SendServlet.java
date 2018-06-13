package SendServlet;
 
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import SendEmail.SendEmail;
import MD5.MD5;

@SuppressWarnings("serial")
@WebServlet("/SendServlet")

public class SendServlet extends HttpServlet {
     
    // database connection settings
   
    
    //random
    protected String getSaltString() {
        String SALTCHARS = "abcdefghijkmnopqrsuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 10) {
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	HttpSession session = request.getSession();
    	String dbURL = (String) session.getAttribute("url");
        String dbUser = (String) session.getAttribute("userdb");
        String dbPass = (String) session.getAttribute("passdb");
    	String Email = request.getParameter("email");
    	Connection conn = null;
    	String message = null;
    	try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "select * from taikhoan where Email=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, Email);
            
            ResultSet result = statement.executeQuery();
             
            if (result.next()) {
            	String User = result.getString("Username");            	
            	//create a new password
            	String newpass= getSaltString();
            	//send new password
            	
            	boolean flag= SendEmail.Send(Email, User, newpass);
            	if(flag==true)
            	{
            		//MD5
                	String newpassword= MD5.encryptMD5(newpass); 	
                	//update new password into database
                	String sql1 = "UPDATE taikhoan SET Password=? where Email=?";
                    PreparedStatement statement1 = conn.prepareStatement(sql1);
                    statement1.setString(1, newpassword);
                    statement1.setString(2, Email);
                    //message
                    int row = statement1.executeUpdate();
                    if (row > 0) {
                        message = "Password đã được reset! kiểm tra email của bạn! ";
                    }
            	}
            	else
            	{
            		 message = "Vui lòng kiểm tra kết nối internet";
            	}
            	
            }
            else{
            	 message = "Email Doesn't Match!";
            }
            
            
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/welcome.jsp").forward(request, response);
        }    
    }
}
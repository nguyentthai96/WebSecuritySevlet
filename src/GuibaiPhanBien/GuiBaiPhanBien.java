package GuibaiPhanBien;
 
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
 
@SuppressWarnings({ "serial", "unused" })
@WebServlet("/GuiBaiPhanBien")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class GuiBaiPhanBien extends HttpServlet {
     
    // database connection settings
    
    
    //get only File's name
    private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException { 
    	
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	HttpSession session = request.getSession();
    	String dbURL = (String) session.getAttribute("url");
        String dbUser = (String) session.getAttribute("userdb");
        String dbPass = (String) session.getAttribute("passdb");
    	// gets values of text fields
    	String id_baiviet_phanbien = request.getParameter("id_baiviet_phanbien");
        String noidung_phanbien = request.getParameter("noidung_phanbien");
        
        // input stream of the upload file picture
        InputStream inputFile=null; //input file
        //get file
        Part filePart = request.getPart("file_phanbien");
        
        //get file's name
	   	String fileName = extractFileName(filePart);
	   	if (fileName != null && fileName.length() > 0) {
            // File data
	   		inputFile = filePart.getInputStream();
         }
	   	//get picture's name............
       
        
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType()); 
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO ds_noidung_phanbien(noidung_phanbien, file_phanbien, tenfile_phanbien, ngayphanbien, trangthai_duocdang, ID_baiviet_phanbien) "
            		+ "values (?, ?, ?, CURDATE(),'0', ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, noidung_phanbien);
            statement.setString(3, fileName);
            statement.setString(4, id_baiviet_phanbien);
             
            if (inputFile !=null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(2, inputFile);
            }
            String updatetrangthai="update ds_baiviet_phanbien "
            		+ "set trangthai_phanbien='Da Phan Bien' "
            		+ "where ID_baiviet_phanbien=?";
            PreparedStatement statement2 = conn.prepareStatement(updatetrangthai);
            statement2.setString(1, id_baiviet_phanbien);
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            int row2 = statement2.executeUpdate();
            if (row > 0 && row2 > 0) {
                message = "Phản Biện Đã Được Gửi!";
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
            getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
        }
    }
}
package GuibaiBienTap;
 
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
@WebServlet("/GuibaiBienTap")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class GuibaiBienTap extends HttpServlet {
     
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
        String id_baiviet_bientap = request.getParameter("id_baiviet_bientap");
        String tieude = request.getParameter("tieude_bientap");
        String noidung = request.getParameter("noidung_bientap");
        String dstukhoa = request.getParameter("dstukhoa_bientap");
        
        // input stream of the upload file picture
        InputStream inputanh = null; //input picture
        InputStream inputFile=null; //input file
        InputStream inputFile_pdf=null; //input file
        //get file
        Part anhbia=request.getPart("anhbia"); 
        Part filePart = request.getPart("file_bientap");
        Part filePart_pdf = request.getPart("file_bientap_PDF");
        
        //get file's name
	   	String fileName = extractFileName(filePart);
		String fileName_pdf = extractFileName(filePart_pdf);
		
	   	if (fileName != null && fileName.length() > 0 && fileName_pdf!=null && fileName_pdf.length()>0) {
            // File data
	   		inputFile = filePart.getInputStream();
	   		inputFile_pdf = filePart_pdf.getInputStream();
         }
	   	//get picture's name............
       
        
        if (filePart != null&& anhbia !=null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            
            System.out.println(anhbia.getName());
            System.out.println(anhbia.getSize());
            System.out.println(anhbia.getContentType());
            
            System.out.println(filePart_pdf.getName());
            System.out.println(filePart_pdf.getSize());
            System.out.println(filePart_pdf.getContentType());
             
            // obtains input stream of the upload file
            inputanh  = anhbia.getInputStream();   
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO ds_noidung_bientap(tieude_bientap, noidung_bientap, file_bientap, tenfile_bientap, File_PDF, tenfile_PDF, dstukhoa_bientap, anh_bientap, ngaybientap, ID_baiviet_bientap, trangthai_duocdang) "
            		+ "values (?, ?, ?, ?, ?, ?, ?, ?, CURDATE(), ?, '0')";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, tieude);
            statement.setString(2, noidung);
            statement.setString(4, fileName);
            statement.setString(6, fileName_pdf);
            statement.setString(7, dstukhoa);
            statement.setString(9, id_baiviet_bientap);
             
            if (inputanh != null && inputFile !=null && inputFile_pdf!=null ) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(3, inputFile);
                statement.setBlob(5, inputFile_pdf);
                statement.setBlob(8,  inputanh);
                
            }
 
            String updatetrangthai="update ds_baiviet_bientap "
            		+ "set trangthai_bientap='Da Bien Tap' "
            		+ "where ID_baiviet_bientap=?";
            PreparedStatement statement2 = conn.prepareStatement(updatetrangthai);
            statement2.setString(1, id_baiviet_bientap);
            
            // sends the statement to the database server
            int row = statement.executeUpdate();
            int row2 = statement2.executeUpdate();
            if (row > 0 && row2 >0) {
                message = "Bài Biên Tập Đã Được Gửi!";
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
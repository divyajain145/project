/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Smarty
 */
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

/**
 * Servlet implementation class guru_download
 */
@WebServlet("/Download_1")
public class Download extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/appdb", "root", "");

            PreparedStatement st1 = con.prepareStatement("select * from file_upload where Id='1'");
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {

                String fileName = rs.getString("Name");
                String fileType = fileName.substring(fileName.indexOf(".") + 1, fileName.length());
                if (fileType.trim().equalsIgnoreCase("txt")) {
                    response.setContentType("text/plain");

                } else if (fileType.trim().equalsIgnoreCase("docx") || fileType.trim().equalsIgnoreCase("doc")) {
                    response.setContentType("application/msword");

                } else if (fileType.trim().equalsIgnoreCase("xls")) {
                    response.setContentType("application/vnd.ms-excel");

                } else if (fileType.trim().equalsIgnoreCase("pdf")) {
                    response.setContentType("application/pdf");

                } else if (fileType.trim().equalsIgnoreCase("ppt")) {
                    response.setContentType("application/ppt");

                } else {
                    response.setContentType("application/octet-stream");

                }
                PrintWriter out = response.getWriter();
                String file = rs.getString("Name");
                String gurupath = rs.getString("path");
                response.setContentType("APPLICATION/OCTET-STREAM");
                response.setHeader("Content-Disposition", "attachment; filename=\""
                        + file + "\"");

                FileInputStream fileInputStream = new FileInputStream(gurupath);

                int i;
                while ((i = fileInputStream.read()) != -1) {
                    out.write(i);
                }
                fileInputStream.close();
                out.close();

            }
        
        /**
         * @see HttpServlet#doPost(HttpServletRequest request,
         * HttpServletResponse response)
         */
       }catch(Exception e){System.out.print(e);}
    }
    /**
     *
     * @param request
     * @see HttpServlet#doPost(HttpServletRequest, HttpServletResponse)
     */
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
    
}

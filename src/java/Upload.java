/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Smarty
 */
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/Control_Panel/Cp_UploadFile")
public class Upload extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public Upload() {
        super();
        // TODO Auto-generated constructor stub
    }
    String x = "", p = "", z = "", g = "", c = "",q="",hid1="",d_name="",domain_name="";
    int value=0;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
                    if(item.isFormField()){
                        q=(String) item.getFieldName();
                        if(q.equalsIgnoreCase("hid1")){
                            hid1=item.getFieldName();
                            value=Integer.parseInt(item.getString());
                        }
                    }
//                     Class.forName("com.mysql.jdbc.Driver");
//                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jpanelproject", "root", "");
//                Statement st = con.createStatement();
//                ResultSet rs=st.executeQuery("select * from hosting_register_master where Hosting_Register_Id="+value);
//                if(rs.next()){
//                    d_name = rs.getString("Domain_Name");
//                }
//                String s = request.getRealPath("/hosting/");
//                domain_name = s + "www." + d_name;
                
                    if (!item.isFormField()) {
                        z = (String) item.getFieldName();
                        String name = new File(item.getName()).getName();
                        if (z.equalsIgnoreCase("fname")) {
                            x = new File(item.getName()).getName();

                            item.write(new File(domain_name+"/" + name));
                        }

                    }

                }

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jpanelproject", "root", "");
                

                String format = "none";

                int index = x.lastIndexOf(".");
                if (index > 0) {
                    format = x.substring(index + 1);

                    PreparedStatement st = con.prepareStatement("insert into file_upload values(NULL,?,?,?)");
                    st.setString(1, x);
                    st.setString(2, "/Files/" + x);
                    st.setString(3, format);

                    st.executeUpdate();
                }
                //File uploaded successfully
                request.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
                request.setAttribute("message", "File Upload Failed due to " + ex);
            }
        } else {

            request.setAttribute("message", "No File found");
        }
        request.getRequestDispatcher("/Control_Panel/Cp_Master.jsp?page=Cp_Domain_Control.jsp").forward(request, response);

    }

}

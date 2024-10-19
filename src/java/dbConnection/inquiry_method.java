/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author bharat
 */
public class inquiry_method extends dbConnectionFile{
    
 public int employee_ClassInsert(String name, String email, String mob_number, String subject, String msg, String date) throws ClassNotFoundException, SQLException {
        
            st = myconParam("Insert into contact_info values(Null,?,?,?,?,?,?)");
            
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, mob_number);
            st.setString(4, subject);
            st.setString(5, msg);
            st.setString(6, date);
           
            return st.executeUpdate();
        
    }

   
public ResultSet inquiry_ClassSelect(int client_id) throws ClassNotFoundException, SQLException {
        if (client_id > 0) {
            st = myconParam("select * from contact_info Where Contact_Id=?");
            st.setInt(1, client_id);

        } else {
            st = myconParam("select * from contact_info");
        }
        return st.executeQuery();
    }
   
}


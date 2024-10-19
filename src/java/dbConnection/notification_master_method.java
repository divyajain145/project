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
public class notification_master_method extends dbConnectionFile{
    
 public int notification_masterClassInsert(int user_id,String noti_for, String noti_msg, int noti_status) throws ClassNotFoundException, SQLException {
        
            st = myconParam("Insert into notification_master values(Null,?,?,?,curdate(),?)");
            
            st.setInt(1, user_id);
            st.setString(2, noti_for);
            st.setString(3, noti_msg);
            st.setInt(4, noti_status);
           
            return st.executeUpdate();
        
    }
}
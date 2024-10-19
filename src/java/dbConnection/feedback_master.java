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
 * @author Acer
 */
public class feedback_master extends dbConnectionFile{
    public int feedback_masterInsert(int user_id,String name, String message) throws ClassNotFoundException, SQLException {
       return mycon().executeUpdate("Insert into feedback_master values(Null,"+user_id+",'"+name+"','"+message+"',curdate())");
    }
    public int feedback_ClassDelete(int feedback_id) throws ClassNotFoundException, SQLException {
        st = myconParam("Delete From feedback_master Where feedback_id=?");
        st.setInt(1, feedback_id);
        return st.executeUpdate();
    }
    public ResultSet feedback_ClassSelect(int feedback_id) throws ClassNotFoundException, SQLException {
        if (feedback_id > 0) {
            st = myconParam("select * from feedback_master Where feedback_id=?");
            st.setInt(1, feedback_id);
            
         
        } else {
            st = myconParam("select * from feedback_master");
        }
        return st.executeQuery();
    }
}

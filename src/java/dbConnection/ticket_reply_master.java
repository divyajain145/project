/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Acer
 */
public class ticket_reply_master extends dbConnectionFile{
    public int ticket_reply_master_ClassInsert(int ticket_id, int sender_id, int receiver_id, String msg) throws ClassNotFoundException, SQLException {
       
            st = myconParam("Insert into ticket_reply_master values(Null,?,?,?,?,curDate())");
            st.setInt(1, ticket_id);
            st.setInt(2, sender_id);
            st.setInt(3, receiver_id);
            st.setString(4, msg);
            return st.executeUpdate();
    }
    public ResultSet ticket_reply_masterClassSelect(int ticket_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("select * from ticket_reply_master where Ticket_Id="+ticket_id);
        
    }
}

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
 * @author bharat
 */
public class support_ticket_master_method extends dbConnectionFile {
    
     public int support_ticket_master_ClassInsert(int user_id, String department,int rel_support_id, String priority, String sub,String email,String msg, String file) throws ClassNotFoundException, SQLException {
       
            st = myconParam("Insert into support_ticket_master values(Null,?,?,?,?,?,?,?,?,curDate(),1)");
            st.setInt(1, user_id);
            st.setString(2, department);
            st.setInt(3, rel_support_id);
            st.setString(4, priority);
            st.setString(5, sub);
            st.setString(6, email);
            st.setString(7, msg);
            st.setString(8, file);
            return st.executeUpdate();
    }
     public ResultSet support_ticket_masterClassSelect1(int user_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("select * from support_ticket_master where User_id="+user_id);
        
    }
     public ResultSet support_ticket_masterClassSelect7(int user_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("SELECT * \n" +
"FROM support_ticket_master\n" +
"WHERE User_Id ="+user_id+"\n" +
"ORDER BY Support_Ticket_Id DESC \n" +
"LIMIT 0 , 3");
        
    }
     public ResultSet support_ticket_masterClassSelect() throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("select * from support_ticket_master");
        
    }
     public ResultSet support_ticket_masterClassSelect2(int ticket_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("select * from support_ticket_master where Support_Ticket_Id="+ticket_id);
        
    }
   
    public int support_ticket_master_count(int user_id) throws ClassNotFoundException, SQLException{
        Statement st=mycon();
        ResultSet rs=st.executeQuery("select * from support_ticket_master where User_Id="+user_id);
        int count=0;
        while(rs.next()){
            count++;
        }
       return count;
    }
}

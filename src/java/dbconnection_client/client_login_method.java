/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;
import java.sql.*;
/**
 *
 * @author BRIGHT
 */
public class client_login_method extends dbConnectionFile{
     public ResultSet client_loginClassSelect(String email,String password) throws ClassNotFoundException, SQLException {
        
            st = myconParam("select * from client_register Where Email=? and Password=?");
            st.setString(1, email);
            st.setString(2, password);

        
        return st.executeQuery();
     
    }
     public ResultSet getUserData(int Reg_Id) throws ClassNotFoundException, SQLException {
        
            st = myconParam("select * from client_register Where Reg_Id=?");
            st.setInt(1, Reg_Id);
        return st.executeQuery();
     
    }
     
   
}

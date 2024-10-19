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
public class subdomain_master extends dbConnectionFile{
      public int subdomain_masterInsert(int hosting_id,String title,int status) throws ClassNotFoundException, SQLException {
            st = myconParam("Insert into subdomain_master values(Null,?,?,?,curdate())");
            
            st.setInt(1, hosting_id);
            st.setString(2, title);
            st.setInt(3, status);
           
            return st.executeUpdate();
    }
    public ResultSet subdomain_masterMaxId() throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select max(Subdomain_Id) as sid from subdomain_master ");
    }
    public ResultSet subdomain_masterSelect(int hosting_id) throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("Select * from subdomain_master Where Hosting_Account_Id="+hosting_id);
    }
}

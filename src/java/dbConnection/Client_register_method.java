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
 * @author BRIGHT
 */
public class Client_register_method extends dbConnectionFile {

    public int registration_ClassInsert(String uname, String email, String password, String mob_number, String full_name, int gender, String country, String state, String city) throws ClassNotFoundException, SQLException {
        st = myconParam("Select * from client_register Where Username=? or Email=? or Mobile_Number=?");
        st.setString(1, uname);
        st.setString(2, email);
        st.setString(3, mob_number);
        rs = st.executeQuery();
        if (rs.next()) {
            if (rs.getString("Username").equals(uname)) {
                return 2;
            } else if (rs.getString("Email").equals(email)) {
                return 3;
            } else{
                return 4;
            }
        } else {
            st = myconParam("Insert into client_register values(Null,?,?,?,?,?,?,?,?,?)");
            st.setString(1, uname);
            st.setString(2, email);
            st.setString(3, password);
            st.setString(4, mob_number);
            st.setString(5, full_name);
            st.setInt(6, gender);
            st.setString(7, country);
            st.setString(8, state);
            st.setString(9, city);

            return st.executeUpdate();
        }
    }
    public ResultSet clientRegister_ClassSelect(int user_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("select * from client_register where Reg_Id="+user_id);
        
    }
    
     public ResultSet clientRegister_ClassCountry() throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("Select * from countries");
        
    }
     public ResultSet clientRegister_ClassState(int country_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("Select * from states where country_id="+country_id);
        
    }
     
     public ResultSet clientRegister_ClassCity(int city_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("Select * from cities where state_id="+city_id);
        
    }
    
}

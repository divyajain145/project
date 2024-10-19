/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;

import java.sql.SQLException;

/**
 *
 * @author bharat
 */
public class Client_contact_method extends dbConnectionFile{
    public int contact_ClassInsert(String name,String email,String mob_num,String Subject,String msg) throws ClassNotFoundException, SQLException{
        st = myconParam("Insert into contact_info values(null,?,?,?,?,?,curDate())");
        st.setString(1, name);
        st.setString(2, email);
        st.setString(3, mob_num);
        st.setString(4, Subject);
        st.setString(5, msg);
        return st.executeUpdate();
    }
}

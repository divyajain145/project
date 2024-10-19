/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;

import java.sql.*;

/**
 *
 * @author bharat
 */
public class role_method extends dbConnectionFile {

    public int role_listClassInsert(String name) throws ClassNotFoundException, SQLException {
        //   return 0;

        ResultSet rs = mycon().executeQuery("Select * from  role_list Where Role_Name='" + name + "'");
        if (rs.next()) {
            return 2;
        } else {
            return mycon().executeUpdate("Insert into role_list values( NULL , '"+name+"')");
        }
    }

    public ResultSet role_listClassSelect(int role_id) throws ClassNotFoundException, SQLException {

        Statement st = mycon();
        if (role_id > 0) {
            return st.executeQuery("Select * from role_list Where Role_Id=" + role_id);
        } else {
            return st.executeQuery("Select * from role_list");
        }
    }

    public int role_listClassUpdate(int role_id, String name) throws ClassNotFoundException, SQLException {
        ResultSet rs = mycon().executeQuery("Select * from  role_list Where Role_Name='" + name + "'");
        if (rs.next()) {
            return 2;
        }
        return mycon().executeUpdate("Update role_list set Role_Name='" + name + "' Where Role_Id=" + role_id);
    }

    public int role_listClassDelete(int role_id) throws ClassNotFoundException, SQLException {
        return mycon().executeUpdate("Delete From role_list Where Role_Id=" + role_id);
    }
}

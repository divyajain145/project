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
public class server_method extends dbConnectionFile {

    public int server_listClassInsert(String server, int status) throws ClassNotFoundException, SQLException {
        ResultSet rs = mycon().executeQuery("Select * from  server_list Where Server_Type='" + server + "'");
        if (rs.next()) {
            return 2;
        } else {
            return mycon().executeUpdate("Insert into server_list values(null,'" + server + "'," + status + ")");
        }

    }

    public ResultSet server_listClassSelect(int server_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
        if (server_id > 0) {
            return st.executeQuery("select * from Server_list where Server_Id = " + server_id);
        } else {
            return st.executeQuery("select * from Server_list");
        }
    }

    public int server_listClassUpdate(int server_id, String server, int status) throws ClassNotFoundException, SQLException {
        ResultSet rs = mycon().executeQuery("Select * from  server_list Where Server_Type='" + server + "'");
        if (rs.next()) {
            return 2;
        }
        return mycon().executeUpdate("update Server_list set Server_Type='" + server + "',Status='" + status + "'where Server_Id=" + server_id);
    }

    public int server_listClassDelete(int server_id) throws ClassNotFoundException, SQLException {
        return mycon().executeUpdate("Delete From server_list Where Server_Id=" + server_id);
    }
}

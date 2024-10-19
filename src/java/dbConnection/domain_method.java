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
public class domain_method extends dbConnectionFile {

    public int domain_listClassInsert(String domain, int status) throws ClassNotFoundException, SQLException {
        ResultSet rs = mycon().executeQuery("Select * from  domain_list Where Domain_Type='" + domain + "'");
        if (rs.next()) {
            return 2;
        } else {
            return mycon().executeUpdate("Insert into domain_list values(null,'" + domain + "'," + status + ")");
        }

    }

    public ResultSet domain_listClassSelect(int domain_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
        if (domain_id > 0) {
            return st.executeQuery("select * from domain_list where Domain_Id = " + domain_id);
        } else {
            return st.executeQuery("select * from domain_list");
        }
    }
    public ResultSet domain_listSelectd(int domain_id) throws ClassNotFoundException, SQLException{
        Statement st = mycon();
        return st.executeQuery("select * from domain_list where Domain_Id <>"+domain_id);
    }

    public int domain_listClassUpdate(int domain_id, String domain, int status) throws ClassNotFoundException, SQLException {
       ResultSet rs = mycon().executeQuery("Select * from  domain_list Where Domain_Type='" + domain + "'");
        if (rs.next()) {
            return 2;
        }
        return mycon().executeUpdate("update domain_list set Domain_Type='" + domain + "',Status='" + status + "'where Domain_Id=" + domain_id);
    }
    
    public int doamain_listClassDelete(int domain_id) throws ClassNotFoundException, SQLException {
        return mycon().executeUpdate("Delete From domain_list Where Domain_Id=" + domain_id);
    }
}

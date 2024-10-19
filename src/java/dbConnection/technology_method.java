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
public class technology_method extends dbConnectionFile {
 public int technology_listClassInsert(String technology, int status) throws ClassNotFoundException, SQLException {
     //   return 0;
     
     
      ResultSet rs = mycon().executeQuery("Select * from  technology_list Where Technology_Type='"+technology+"'");
      if(rs.next())
      {
          return 2;
      }
      else
      {
        return mycon().executeUpdate("Insert into technology_list values(NULL,'" + technology.trim() + "'," + status + ")");
      }
    }

    public ResultSet technology_listClassSelect(int tech_id) throws ClassNotFoundException, SQLException {
      
        Statement st = mycon();
        if(tech_id > 0)
        {
            return st.executeQuery("Select * from technology_list Where Technology_id="+tech_id);
        }
        else
        {
            return st.executeQuery("Select * from technology_list");
        }
    }

 public int technology_listClassUpdate(int tech_id, String technology, int status) throws ClassNotFoundException, SQLException
    {
        return mycon().executeUpdate("Update technology_list set Technology_Type='"+technology+"' , Status='"+status+"' Where Technology_Id="+tech_id);
    }

  public int technology_listClassDelete(int tech_id) throws ClassNotFoundException, SQLException
    {
        return  mycon().executeUpdate("Delete From technology_list Where Technology_Id="+tech_id);
    }
}

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
public class cart_method extends dbConnectionFile {
     public int cart_ClassInsert(int ref_id) throws ClassNotFoundException, SQLException {
      
            st = myconParam("Insert into cart_master values(NULL,1,'Hosting',?,'',1)");
            st.setInt(1, ref_id);
           
            return st.executeUpdate();
        }
    public int cart_listClaassInsert(String cart_type, int ref_id, String d_name , String year, String order_type) throws ClassNotFoundException, SQLException {
        return mycon().executeUpdate("insert into cart_master values(Null, 1, '"+cart_type+"', "+ref_id+", '"+d_name+"', '"+year+"','"+order_type+"')");
    }
    public ResultSet cart_listClassSelect() throws ClassNotFoundException, SQLException{
        Statement st = mycon();
        return st.executeQuery("select * from cart_master");
    }
    public int cart_countSelect() throws ClassNotFoundException, SQLException{
        Statement st=mycon();
        ResultSet rs=st.executeQuery("select * from cart_master");
        int count=0;
        while(rs.next()){
            count++;
        }
       // return st.executeQuery("SELECT COUNT(*) as totalcart FROM cart_master");
       return count;
    }
    public int cart_classDelete(int cart_id) throws ClassNotFoundException, SQLException {
        return mycon().executeUpdate("Delete From cart_master Where Cart_Id=" +cart_id);
    }
    
}

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
public class order_detail_master_method extends dbConnectionFile {
    public ResultSet orderDetailMaster_ClassSelect(int order_id) throws ClassNotFoundException, SQLException{
        Statement st = mycon();
        return st.executeQuery("select * from order_detail_master where Order_Id="+order_id);
    }
    public ResultSet orderDetailMaster1_ClassSelect() throws ClassNotFoundException, SQLException{
        Statement st=mycon();
        return st.executeQuery("select * from order_detail_master");
    }
    public ResultSet orderDetailMaster_ClassSelect1(int orderDetail_id) throws ClassNotFoundException, SQLException{
        Statement st = mycon();
        return st.executeQuery("select * from order_detail_master where Order_Detail_Id="+orderDetail_id);
    }
    public ResultSet orderDetail_masterClassSelect7(int order_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("SELECT * \n" +
"FROM order_detail_master\n" +
"WHERE Order_Id ="+order_id+"\n" +
"ORDER BY Order_Detail_Id DESC \n" +
"LIMIT 0 , 5");
        
    }
}

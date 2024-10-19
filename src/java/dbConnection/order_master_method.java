/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author bharat
 */
public class order_master_method extends dbConnectionFile{
    
     public int order_listClassInsert(int user_id, int sub_total,int total_gst,int total_amount,int order_status,int payment_status) throws ClassNotFoundException, SQLException {
       
           mycon().executeUpdate("Insert into order_master values(null," + user_id + "," + sub_total + "," + total_gst + "," + total_amount + ",curdate(),"+order_status+ "," +payment_status+")");
        ResultSet rs3 = mycon().executeQuery("Select MAX(Order_Id) as mid from order_master");
        String mid = "";
        if(rs3.next())
        {
            mid = rs3.getString("mid");
        }
           
           ResultSet rs = mycon().executeQuery("Select * from cart_master where Unique_Id ="+ 1);
        while(rs.next())
        {
            
            double TotalAmount = 0;
            if(rs.getString("Cart_Type").equals("domain"))
            {
                ResultSet rs1 = mycon().executeQuery("Select * from domain_pricing_master as dpm Where dpm.Domain_Pricing_Id = "+ rs.getString("Reference_Id"));
                if(rs1.next())
                {
                    TotalAmount = Double.parseDouble(rs1.getString("Pricing_Per_Year")) * Double.parseDouble(rs.getString("For_Year"));
                }
            }
           else
            {
                ResultSet rs2 = mycon().executeQuery("Select * from domain_pricing_master as dpm Where dpm.Domain_Pricing_Id = "+ rs.getString("Reference_Id"));
              if(rs2.next())
              {
                    TotalAmount = Double.parseDouble(rs2.getString("Pricing_Per_Year")) * Double.parseDouble(rs.getString("For_Year"));               
              }
            }
            
            
           mycon().executeUpdate("Insert into order_detail_master values(null,"+mid+",'" + rs.getString("Cart_Type") + "'," + rs.getInt("Reference_Id") + ",'" + rs.getString("Domain_Name") + "',"+rs.getInt("For_Year")+",'"+rs.getString("Domain_Order_Type")+ "'," +TotalAmount+")");
        }
        int del=mycon().executeUpdate("delete from cart_master where Unique_Id = "+1);
         return  1;
    }
     
     public ResultSet order_listClassSelect() throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("select * from order_master");
        
    }
      
     public ResultSet orderDetail_listClassSelect(int order_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
        return st.executeQuery("select * from order_detail_master where Order_Id="+order_id);
    }
     public ResultSet order_listClassSelect(int order_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("select * from order_master where Order_Id="+order_id);
        
    }
     public ResultSet order_listClassSelect1(int user_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("select * from order_master where User_id="+user_id);
        
    }
 
     public ResultSet OrderMaster_maxId() throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select max(Order_Id) as oid from order_master ");
    }
     public ResultSet OrderMaster_maxId(int user_id) throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select max(Order_Id) as oid from order_master where User_Id="+user_id);
    }
     public int orderMaster_count(int user_id) throws ClassNotFoundException, SQLException{
        Statement st=mycon();
        ResultSet rs=st.executeQuery("select * from order_master where User_Id="+user_id);
        int count=0;
        while(rs.next()){
            count++;
        }
       return count;
    }
    
}
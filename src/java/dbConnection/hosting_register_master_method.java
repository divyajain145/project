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
public class hosting_register_master_method extends dbConnectionFile{
    public int hostingRegisterMaster_classInsert(int user_id,int order_id,int hostingPlan_id, int domainReg_id, String dom_name, String hosReg_date, String hosEx_date, int hos_tim, int hos_status) throws ClassNotFoundException, SQLException{
        return mycon().executeUpdate("Insert into hosting_register_master values(Null,"+user_id+","+order_id+","+hostingPlan_id+","+domainReg_id+",'"+dom_name+"','"+hosReg_date+"','"+hosEx_date+"',"+hos_tim+","+hos_status+")");
    }  
    public ResultSet hostingRegisterMaster_maxId() throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select max(Hosting_Register_Id) as rid from hosting_register_master ");
    }
    public ResultSet hostingRegisterMaster_regId(int order_id) throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select Hosting_Register_Id from hosting_register_master where Order_Id="+order_id);
    }
    public ResultSet hostingRegisterMaster_hosregId(int reg_id) throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select * from hosting_register_master where Hosting_Register_Id="+reg_id);
    }
    public ResultSet hostingRegisterMaster_hosExDate(String date,int year) throws ClassNotFoundException, SQLException{
        if(year==1){
            return mycon().executeQuery("SELECT ADDDATE('"+date+"', 365) as date");
        }
        else if(year==2){
            return mycon().executeQuery("SELECT ADDDATE('"+date+"', 730) as date");
        }
        else{
            return mycon().executeQuery("SELECT ADDDATE('"+date+"', 1095) as date ");
        }
    }
    public ResultSet hostingRegisterMaster_select(int order_id) throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select * from hosting_register_master where Order_Id="+order_id);
    }
    public ResultSet hostingRegisterMaster_select1(int hos_id) throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select * from hosting_register_master where Hosting_Register_Id="+hos_id);
    }
    
     public ResultSet hostingRegisterMaster_dom_name(int reg_id) throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select * from hosting_register_master where Hosting_Register_Id="+reg_id);
    }
     
     public int hostingRegisterMaster_count(int user_id) throws ClassNotFoundException, SQLException{
        Statement st=mycon();
        ResultSet rs=st.executeQuery("select * from hosting_register_master where User_Id="+user_id);
        int count=0;
        while(rs.next()){
            count++;
        }
       return count;
    }
    
}

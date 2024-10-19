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
public class domain_register_master_method extends dbConnectionFile{
    public int domainRegMaster_classInsert(int user_id,int order_id,int type_id, int pricing_id, String dom_name, String regFor, String regDate, String exDate, int domSatus) throws ClassNotFoundException, SQLException{
        return mycon().executeUpdate("Insert into domain_register_master values(Null,"+user_id+","+order_id+","+type_id+","+pricing_id+",'"+dom_name+"','"+regFor+"','"+regDate+"','"+exDate+"',"+domSatus+")");
    } 
    public ResultSet domainRegMaster_classSelect(int order_id) throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select * from domain_register_master where Domain_Order_Id="+order_id);
    }
    public ResultSet domain_registerClassSelectd(String d_name) throws ClassNotFoundException, SQLException{
        Statement st=mycon();
        return st.executeQuery("select * from domain_register_master");
    }
    public ResultSet domain_registerSelectedDomainList(String d_name) throws ClassNotFoundException, SQLException{
        Statement st=mycon();
        return st.executeQuery("select * from domain_register_master Where Domain_Name = '"+d_name+"'");
    }
    public ResultSet domainRegisterMaster_maxId() throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select max(Domain_Reg_Id) as did from domain_register_master ");
    }
    public int domainRegisterMaster_count(int user_id) throws ClassNotFoundException, SQLException{
        Statement st=mycon();
        ResultSet rs=st.executeQuery("select * from domain_register_master where Domain_User_Id="+user_id);
        int count=0;
        while(rs.next()){
            count++;
        }
       return count;
    }
}

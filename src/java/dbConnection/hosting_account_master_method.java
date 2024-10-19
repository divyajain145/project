/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author bharat
 */
public class hosting_account_master_method extends dbConnectionFile{
    public int hostingAccountMaster_classInsert(String un,String password,String ht,int status) throws ClassNotFoundException, SQLException{
        ResultSet rs = mycon().executeQuery("Select * from  hosting_account_master Where Hosting_Username='" + un + "'");
        if (rs.next()) {
            return 2;
        } else {
            return 1;
        }
    } 
    public int hostingAccountMaster_classInsert1(int refId,String un,String password,String ht,int status) throws ClassNotFoundException, SQLException{
        return  mycon().executeUpdate("Insert into hosting_account_master values(null,"+refId+",'"+un+"','"+password+"','" + ht + "'," + status + ")");
    }   
    public ResultSet hostingAccountMaster_Status(int HosRef_Id) throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select Hosting_Account_Status from hosting_account_master where Hosting_Register_Id="+HosRef_Id);
    }
    public ResultSet hostingAccountMaster_Select(int HosRef_Id) throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select * from hosting_account_master where Hosting_Register_Id="+HosRef_Id);
    }
     public ResultSet hostingAccountMaster_Selectunmpsw(String unm) throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("select * from hosting_account_master where Hosting_Username='"+unm+"'");
    }
    
}

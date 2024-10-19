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
 * @author Acer
 */
public class mail_account_master extends dbConnectionFile{
    public int mail_account_masterInsert(int hosting_id,String mail, String name,String password,String limit, int status) throws ClassNotFoundException, SQLException {
        
      st = myconParam("Select * from mail_account_master Where Mail_Address=? or Mail_Username=?");
        st.setString(1, mail);
        st.setString(2, name);
        rs = st.executeQuery();
        if (rs.next()) {
            if(rs.getString("Mail_Address").equals(mail)){
                return 2;
            }
            else{
                return 3;
            }
        } else {
            st = myconParam("Insert into mail_account_master values(Null,?,?,?,?,?,?)");
            
            st.setInt(1, hosting_id);
            st.setString(2, mail);
            st.setString(3, name);
            st.setString(4, password);
            st.setString(5,limit);
            st.setInt(6,status);
           
            return st.executeUpdate();
        }
    }
    public ResultSet mail_account_masterClassSelect1(int hosting_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("select * from mail_account_master where Hosting_Id="+hosting_id);
        
    }
    public int mail_account_masterClassDelete(int mail_id) throws ClassNotFoundException, SQLException
    {
        return  mycon().executeUpdate("Delete From mail_account_master Where Mail_Account_Id="+mail_id);
    }
    public ResultSet mail_account_masterClassSelect2(int mail_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("select * from mail_account_master where Mail_Account_Id="+mail_id);
        
    }
    public int mail_account_masterClassUpdate(int mail_id,String mail, String name,String password,String limit) throws ClassNotFoundException, SQLException
    {
        return mycon().executeUpdate("Update mail_account_master set Mail_Address='"+mail+"' , Mail_Username='"+name+"', Mail_Password='"+password+"', Mail_Limit='"+limit+"' Where Mail_Account_Id="+mail_id);
    }
}

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
 * @author BRIGHT
 */
public class employee_method extends dbConnectionFile{
  public int employee_ClassInsert(int role_id, String name,String email,String mob_number,String password,int gender,int status) throws ClassNotFoundException, SQLException
  {
      st = myconParam("Select * from employee_list Where User_Name=?");
        st.setString(1, name);
        rs = st.executeQuery();
        if (rs.next()) {
            return 2;
        } else {
   st = myconParam("Insert into employee_list values(Null,?,?,?,?,?,?,curdate(),curdate(),?)");
   st.setInt(1,role_id);
   st.setString(2, name);
   st.setString(3, email);
   st.setString(4, mob_number);
   st.setString(5, password);
   st.setInt(6, gender);
   st.setInt(7, status);
   
   return st.executeUpdate();
  }
  }
        public ResultSet employee_loginClassSelect(String name,String password) throws ClassNotFoundException, SQLException {
        
            st = myconParam("select * from employee_list Where User_Name=? and Password=?");
            st.setString(1, name);
            st.setString(2, password);

        
        return st.executeQuery();
     
    }

   public int employee_ClassDelete(int employee_id) throws ClassNotFoundException, SQLException {
        st = myconParam("Delete From employee_list Where Employee_Id=?");
        st.setInt(1, employee_id);
        return st.executeUpdate();
    }
   
   public ResultSet employee_ClassSelect(int employee_id) throws ClassNotFoundException, SQLException {
        if (employee_id > 0) {
            st = myconParam("select * from employee_list Where Employee_Id=?");
            st.setInt(1, employee_id);
            
         
        } else {
            st = myconParam("select * from employee_list");
        }
        return st.executeQuery();
    }
   
     public int employee_ClassUpdate(int employee_id, int role_id, String name,String email,String mob_number,String password,int gender,int status) throws ClassNotFoundException, SQLException {
       st = myconParam("Select * from employee_list Where User_Name=?");
        st.setString(1, name);
        rs = st.executeQuery();
        if (rs.next()) {
            return 2;
        }
        st = myconParam("update employee_list set role_id = ?, User_Name = ?,Email =?, Mobile_Number =?,Password =?, Gender=?,Status =? where Employee_Id=?");
        st.setInt(1,role_id);
        st.setString(2,name);
        st.setString(3, email);
        st.setString(4, mob_number);
        st.setString(5, password);
        st.setInt(6, gender);
        st.setInt(7,status );
        st.setInt(8,employee_id);
        return st.executeUpdate();
    }
}



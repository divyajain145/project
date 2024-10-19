/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;

import  java.sql.*;
/**
 *
 * @author bharat
 */
public class dbConnectionFile {
       public PreparedStatement st;
      public ResultSet rs;
     public Statement mycon() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/JPanelProject", "root", "");
        return con.createStatement();
        
    }
    public PreparedStatement myconParam(String sql) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/JPanelProject", "root", "");
        return con.prepareStatement(sql);
    }
     
    
    
}

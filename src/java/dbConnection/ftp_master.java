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
 * @author Acer
 */
public class ftp_master extends dbConnectionFile{
    public int ftp_masterInsert(int subdomain_id,String type, String name,String password,int status) throws ClassNotFoundException, SQLException {
       return mycon().executeUpdate("Insert into ftp_master values(Null,"+subdomain_id+",'"+type+"','"+name+"','"+password+"',"+status+")");
    }
    public ResultSet ftp_masterSelect() throws ClassNotFoundException, SQLException{
        return mycon().executeQuery("Select * from ftp_master");
    }
}

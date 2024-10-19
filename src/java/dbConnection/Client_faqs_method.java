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
public class Client_faqs_method extends dbConnectionFile{
    
    public ResultSet showFaqs() throws ClassNotFoundException, SQLException{
       Statement st = mycon();
       return st.executeQuery("select * from faqs_master");
    }
}

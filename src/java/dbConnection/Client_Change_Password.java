
package dbConnection;

import java.sql.SQLException;


public class Client_Change_Password extends dbConnectionFile {
    public int change_passwordClassUpdate(String password, String email) throws ClassNotFoundException, SQLException{
        return mycon().executeUpdate("update client_register set Password='"+password+"' where Email='"+email+"'");
        
    }
   
}

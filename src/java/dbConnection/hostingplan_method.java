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
 * @author BRIGHT
 */
public class hostingplan_method extends dbConnectionFile {

    public int hostingplan_listClassInsert(int server_id, int technology_id, String plan_title, int disk_space, int bandwidth_space, String email_account, String tech_support, String database, String lang_support, int price_year, String sub_domain, String controlpanel_type, String ftp_account, int status) throws ClassNotFoundException, SQLException {
        ResultSet rs = mycon().executeQuery("Select * from  hosting_plan Where Plan_Title='" + plan_title + "'");
        if (rs.next()) {
            return 2;
        } else {
            return mycon().executeUpdate("Insert into hosting_plan values(null," + server_id + "," + technology_id + ",'" + plan_title + "'," + disk_space + "," + bandwidth_space + ",'" + email_account + "','" + tech_support + "','" + database + "','" + lang_support + "'," + price_year + ",'" + sub_domain + "','" + controlpanel_type + "','" + ftp_account + "'," + status + ")");
        }
    }

    public ResultSet hostingplan_listClassSelect(int hp_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
        if (hp_id > 0) {
            return st.executeQuery("Select * from hosting_plan Where HP_Id=" + hp_id);
        } else {
            return st.executeQuery("Select * from hosting_plan");
        }
    }

    public ResultSet hostingplan_listClassSelect(int tech_id, int server_id) throws ClassNotFoundException, SQLException {
        return mycon().executeQuery("select * from hosting plan where Technology_Id="+tech_id+" and Server_Id="+server_id+"");
    }
    
    public int hostingplan_listClassUpdate(int hp_id, int server_id, int technology_id, String plan_title, int disk_space, int bandwidth_space, String email_account, String tech_support, String database, String lang_support, int price_year, String sub_domain, String controlpanel_type, String ftp_account, int status) throws ClassNotFoundException, SQLException {
        ResultSet rs = mycon().executeQuery("Select * from  hosting_plan Where Plan_Title='" + plan_title + "'");
        if (rs.next()) {
            return 2;
        }
        return mycon().executeUpdate("Update hosting_plan set Server_Id=" + server_id + ",Technology_Id=" + technology_id + ",Plan_Title = '" + plan_title + "',Disk_Space = '" + disk_space + "',Bandwidth_Space = '" + bandwidth_space + "',Email_Account = '" + email_account + "',Technical_Support = '" + tech_support + "',Database_Name = '" + database + "',Language_Support = '" + lang_support + "',Price_Per_Year = '" + price_year + "',Sub_Domains  = '" + sub_domain + "',Control_Panel_Type = '" + controlpanel_type + "',FTP_Account = '" + ftp_account + "',Status = '" + status + "' where HP_Id=" + hp_id);
    }

    public int hostingplan_listClassDelete(int hp_id) throws ClassNotFoundException, SQLException {
        return mycon().executeUpdate("Delete From hosting_plan Where HP_Id=" + hp_id);
    }
}

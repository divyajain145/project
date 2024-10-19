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
public class domain_pricing_method extends dbConnectionFile {

    public int domain_PriceListClassInsert(int domain_type_id,String domain_price,String pricing_per_year, int status) throws ClassNotFoundException, SQLException {
        ResultSet rs = mycon().executeQuery("Select * from  domain_pricing_master Where Domain_Type_Id='" + domain_type_id + "'");
        if (rs.next()) {
            return 2;
        } else {
            return mycon().executeUpdate("Insert into domain_pricing_master values(null," + domain_type_id + ",'" + domain_price + "','" + pricing_per_year + "'," + status + ")");
        }

    }

    public ResultSet domain_PricelistClassSelect(int domain_pricing_id) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
        if (domain_pricing_id > 0) {
            return st.executeQuery("select * from domain_pricing_master where Domain_Pricing_Id = " + domain_pricing_id);
        } else {
            return st.executeQuery("select * from domain_pricing_master");
        }
    }
    
     public ResultSet domain_PricelistByDomainClassSelect(int domianTypeId) throws ClassNotFoundException, SQLException {
        Statement st = mycon();
       
            return st.executeQuery("select * from domain_pricing_master where Domain_Type_Id = " + domianTypeId);
     
    }

    public int domain_PricelistClassUpdate(int domain_pricing_id,int domain_type_id,String domain_price,String pricing_per_year, int status) throws ClassNotFoundException, SQLException {
        ResultSet rs = mycon().executeQuery("Select * from  domain_pricing_master Where Domain_Type_Id='" + domain_type_id + "'");
        if (rs.next()) {
            return 2;
        } else {
        return mycon().executeUpdate("update domain_pricing_master set Domain_Type_Id=" + domain_type_id + ",Domain_Price='"+domain_price+"',Pricing_Per_Year='"+pricing_per_year+"', Status='" + status + "'where Domain_Pricing_Id=" + domain_pricing_id);
    }
    }
    
    public int doamain_PricelistClassDelete(int domain_pricing_id) throws ClassNotFoundException, SQLException {
        return mycon().executeUpdate("Delete From domain_pricing_master Where Domain_Pricing_Id=" + domain_pricing_id);
    }
    
}

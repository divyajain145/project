/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;

import java.sql.*;

/**
 *
 * @author BRIGHT
 */
public class FAQs_method extends dbConnectionFile {

    public int faqs_ClassInsert(String question, String answer) throws ClassNotFoundException, SQLException {
        st = myconParam("Select * from faqs_master Where FAQ_Question=?");
        st.setString(1, question);
        rs = st.executeQuery();
        if (rs.next()) {
            return 2;
        } else {
            st = myconParam("Insert into faqs_master values(NULL,?,?)");
            st.setString(1, question);
            st.setString(2, answer);
            return st.executeUpdate();
        }
    }

    public ResultSet faqs_ClassSelect(int faq_id) throws ClassNotFoundException, SQLException {
        if (faq_id > 0) {
            st = myconParam("select * from faqs_master Where FAQ_Id=?");
            st.setInt(1, faq_id);
            
         
        } else {
            st = myconParam("select * from faqs_master");
        }
        return st.executeQuery();
    }
    
    public int faqs_ClassUpdate(int faq_id, String question, String answer) throws ClassNotFoundException, SQLException {
        st = myconParam("Select * from faqs_master Where FAQ_Question=?");
        st.setString(1, question);
        rs = st.executeQuery();
        if (rs.next()) {
            return 2;
        } 
        st = myconParam("update faqs_master set FAQ_Question = ?,FAQ_Answer = ? where FAQ_Id=?");
        st.setString(1,question);
        st.setString(2, answer);
        st.setInt(3, faq_id);
        return st.executeUpdate();
    }
    
    public int faqs_ClassDelete(int faq_id) throws ClassNotFoundException, SQLException {
        st = myconParam("Delete From faqs_master Where FAQ_Id=?");
        st.setInt(1, faq_id);
        return st.executeUpdate();
    }
}


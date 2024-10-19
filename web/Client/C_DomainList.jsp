<%-- 
    Document   : C_DomainList
    Created on : 13 Feb, 2019, 12:53:46 PM
    Author     : BRIGHT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.order_detail_master_method" %>
<%@page import="dbConnection.order_master_method" %>
<%@page import="dbConnection.hosting_register_master_method" %>
<%@page import="dbConnection.domain_register_master_method" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int order_id=0,domain_id=0,year=0;
            String date="";
            int user_id=(Integer)session.getAttribute("user");
        %>
       <div>
                    <div class="uk-width-large-1-1 dbtitle" >
                        <div class="hdb">
                            Dashboard / Domain
                        </div>
                    </div>
                </div>
                
            
        <div class="dbtable">
            
                <div>
                    <div class="uk-width-large-1-1 dbtitle" >
                        <div class="hdb1">
                            Domain List :
                        </div>
                    </div>
                </div>
            
            <div class="dblisttable">
                
              <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 170px;">Domain</th>
                        <th style="width: 150px;">Reg date</th>
                        <th style="width: 150px;">Next Due</th>
                        <th style="width: 200px;">Status</th>
                        <th style="width: 200px;"></th>
                        
                    </tr>
                   
                   <%  order_master_method om=new order_master_method();
                       ResultSet r7=om.order_listClassSelect1(user_id);
                       while(r7.next()){
                        order_id=r7.getInt("Order_Id"); 
                       order_detail_master_method odm=new order_detail_master_method();
                       ResultSet rs=odm.orderDetailMaster_ClassSelect(order_id);
                       while(rs.next()){
                           if(rs.getString("Order_Type").equals("domain")){
                               order_id=rs.getInt("Order_Id");
                               domain_id=rs.getInt("Reference_Id");
                            
                    %>
                    <tr>
                        <td><%=rs.getString("Domain_Name")%></td>
                        <%
                            year=rs.getInt("For_Year");
                          ResultSet r2=om.order_listClassSelect(order_id);
                          if(r2.next()){
                              date=r2.getString("Order_Date");
                          }
                        %>
                        <td><%=date%></td>
                        <%
                        hosting_register_master_method hm1=new hosting_register_master_method();
                          ResultSet r3=hm1.hostingRegisterMaster_hosExDate(date, year);
                          if(r3.next()){
                        %>
                        <td><%=r3.getString("date")%></td>
                        <%
                            }
                            domain_register_master_method dm=new domain_register_master_method();
                            ResultSet r76=dm.domainRegMaster_classSelect(order_id);
                            if(r76.next()){
                        %>
                        <td>Active</td>
                        <%}
                        else{
                        %>
                        <td>Inactive</td>
                        <%}%>
                        <td>
                        <a href=""><i class="fa fa-edit btnsize" ></i></a>
                            <a href=""><i class="fa fa-trash btnsize"></i></a>
                            <a href=""><i class="fa fa-eye btnsize"></i></a>
                                        
                        </td>
                    </tr>
                    <% 
                        }
                    }       
                    }    
                    %>
                </table>
            </div>
        
              
            
        </div>
            
           
    </body>
</html>

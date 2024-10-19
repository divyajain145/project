<%-- 
    Document   : C_HostingList
    Created on : 13 Feb, 2019, 12:03:27 PM
    Author     : BRIGHT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.order_detail_master_method" %>
<%@page import="dbConnection.hostingplan_method" %>
<%@page import="dbConnection.order_master_method" %>
<%@page import="dbConnection.hosting_register_master_method" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    int hosting_id=0,year=0,order_id=0;
    String date="";
    int user_id=(Integer)session.getAttribute("user");
    out.print(user_id);
%>
        <div>
            <div class="uk-width-large-1-1 dbtitle" >
                <div class="hdb">
                    Dashboard / Hosting
                </div>
            </div>
        </div>


        <div class="dbtable">

            <div>
                <div class="uk-width-large-1-1 dbtitle" >
                    <div class="hdb1">
                        Hosting List :
                    </div>
                </div>
            </div>

            <div class="dblisttable">

                
              <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 250px;">Product | Service
                        </th>
                        <th style="width: 100px;">Pricing</th>
                        <th style="width: 120px;">Next Due Date</th>
                        <th style="width: 80px;">Status</th>
                        <th style="width: 50px;"> </th>
                    </tr>
                   <%
                       order_master_method om=new order_master_method();
                       ResultSet r7=om.order_listClassSelect1(user_id);
                       while(r7.next()){
                        order_id=r7.getInt("Order_Id"); 
                        order_detail_master_method odm=new order_detail_master_method();
                        ResultSet rs=odm.orderDetailMaster_ClassSelect(order_id);
                        while(rs.next()){
                           if(rs.getString("Order_Type").equals("hosting")){
                               order_id=rs.getInt("Order_Id");
                               hosting_id=rs.getInt("Reference_Id");
                               hostingplan_method hpm=new hostingplan_method();
                               ResultSet r1=hpm.hostingplan_listClassSelect(hosting_id);
                               while(r1.next()){
                               
                   %>
                    <tr>
                        <td><%=r1.getString("Plan_Title")%></td>
                        <td><%=rs.getString("Total_Amount")%></td>
                        <%
                          year=rs.getInt("For_Year"); 
                          ResultSet r2=om.order_listClassSelect(order_id);
                          if(r2.next()){
                              date=r2.getString("Order_Date");
                          }
                          hosting_register_master_method hm1=new hosting_register_master_method();
                          ResultSet r3=hm1.hostingRegisterMaster_hosExDate(date, year);
                          if(r3.next()){
                        %>
                        <td><%=r3.getString("date")%></td>
                        <%
                            }
                            ResultSet r4=hm1.hostingRegisterMaster_regId(order_id);
                            if(r4.next()){
                        %>
                        <td>Active</td>
                        <%
                            }
                            else{%>
                        <td>Inactive</td>
                            <%}%>
                            
                            <td><a style="padding: 10px;" href="Client.jsp?page=C_Master.jsp?page1=C_HostingInformation.jsp?oder_id=<%=rs.getInt("Order_Id")%>"><i class="fa fa-eye">View</i></a></td>
                    </tr>
                   <%
                                }
                           }
                       }
                       }
                   %>
                </table>
            </div>
        </div>


    </body>
</html>

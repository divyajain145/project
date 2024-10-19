<%-- 
    Document   : C_OrderList
    Created on : 13 Feb, 2019, 12:57:32 PM
    Author     : BRIGHT
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.order_master_method" %>
<%@page import="dbConnection.order_detail_master_method" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int order_id=0;
            int user_id=(Integer)session.getAttribute("user");
        %>
       <div>
                    <div class="uk-width-large-1-1 dbtitle" >
                        <div class="hdb">
                            Dashboard / Order
                        </div>
                    </div>
                </div>
        <div class="dbtable">
                <div>
                    <div class="uk-width-large-1-1 dbtitle" >
                        <div class="hdb1">
                            Order List :
                        </div>
                    </div>
                </div>
            <div class="dblisttable">
                
              <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 70px;">Invoice</th>
                        <th style="width: 100px;">Invoice Date</th>
                        <th style="width: 100px;">Due Date</th>
                        <th style="width: 200px;">Total</th>
                        <th style="width: 200px;">Status</th>
                    </tr>
                    <%
                        order_master_method om=new order_master_method();
                        ResultSet rs=om.order_listClassSelect1(user_id);
                        while(rs.next()){
                            order_id=rs.getInt("Order_Id");
                    %>
                    <tr>
                        <td><%=order_id%></td>
                        
                        <td><%=rs.getString("Order_Date")%></td>
                        <%
                            order_detail_master_method odm=new order_detail_master_method();
                            ResultSet r1=odm.orderDetailMaster_ClassSelect(order_id);
                            if(r1.next()){
                        %>
                        <td><%=rs.getString("Order_Date")%></td>
                        <%
                            }
                        %>
                        <td><%=rs.getInt("Total_Amount")%></td>
                        <%
                            ResultSet rs1=om.order_listClassSelect(order_id);
                            if(rs1.next()){
                        %>
                        <td>Active</td>
                        <%  }
                        else{
                        %>
                        <td>Inactive</td>
                        <%}%>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
    </body>
</html>

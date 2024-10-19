<%-- 
    Document   : A_TechnologyList
    Created on : 26 Oct, 2018, 3:41:11 PM
    Author     : bharat
--%>


<%@page import="dbConnection.order_master_method" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            td{
                text-transform: uppercase;
                font-size: 14px;
            }

        </style>
    </head>
    <body>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Order List</li>
        </ol>

        <!-- Page Content -->
        <h4 class="clearfix">
            Order List
        </h4>
        <hr>
        <div class="card">
            <div class="card-header">
                Order List
            </div>
            <div class="card-body table-responsive">
                <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 100px;">View</th>
                       
                        <th style="width: 70px;">User_ID</th>
                        <th>Sub Total</th>
                        <th>Total GST</th>
                        <th>Total Amount</th>
                        <th>Order Date</th>
                        <th>Order Status</th>
                        <th>Payment Status</th>
                        
                    </tr>
                    <%
                      order_master_method om = new order_master_method();
                      ResultSet rs = om.order_listClassSelect();
                      while (rs.next()) {                              
                              
                          
                    %>
                    <tr>
                        <td><a href="Admin.jsp?page=A_OrderDetailList.jsp?order_id=<%=rs.getString("Order_Id")%>"><i class="fa fa-user"></i></a></td>
                
                        <td><%=rs.getInt("User_Id")%></td>
                        <td><%=rs.getInt("Sub_Total")%></td>
                        <td><%=rs.getInt("Total_GST")%></td>
                        <td><%=rs.getInt("Total_Amount")%></td>
                        <td><%=rs.getString("Order_Date")%></td>
                        <td><%=rs.getInt("Order_Status")%></td>
                        <td><%=rs.getInt("Payment_Status")%></td>
                        
                    </tr>
                    <%
                    }
                    %>
                    


                </table>
            </div>
        </div>



    </body>
</html>

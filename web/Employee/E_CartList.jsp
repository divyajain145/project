<%-- 
    Document   : A_TechnologyList
    Created on : 26 Oct, 2018, 3:41:11 PM
    Author     : bharat
--%>


<%@page import="dbConnection.cart_method"%>
<%@page import="java.sql.*"%>
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
            <li class="breadcrumb-item active">Cart List</li>
        </ol>

        <!-- Page Content -->
        
        <hr>
        <div class="card">
            <div class="card-header">
                Cart List
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 100px;">ID</th>
                        <th style="width: 200px;">Type</th>
                        <th style="width: 200px;">Domain Name</th>
                        <th style="width: 100px;">For Year</th>
                        <th style="width: 200px;">Domain Order Type</th>
                        
                    </tr>
                    <%
                       cart_method rc = new cart_method();
                       ResultSet rs = rc.cart_listClassSelect();
                       while(rs.next())
                       {
                    %>
                    <tr>
                        <td><%=rs.getString("Cart_Id")%></td>
                        <td><%=rs.getString("Cart_Type")%></td>
                        <td><%=rs.getString("Domain_Name")%></td>
                        <td><%=rs.getString("For_Year")%></td>
                        <td><%=rs.getString("Domain_Order_Type")%></td>
                       
                    </tr>
                    <%
                    
                    }
                    %>
                    
                </table>
            </div>
        </div>
        
        
        
    </body>
</html>

<%-- 
    Document   : A_HelpTicket
    Created on : Mar 22, 2019, 10:36:20 AM
    Author     : Acer
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.support_ticket_master_method" %>
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
            <li class="breadcrumb-item active">Inquiry</li>
        </ol>

        <!-- Page Content -->
        <h4 class="clearfix">
           Inquiry
           
        </h4>
        <hr>
        <div class="card">
            <div class="card-header">
                Inquiry
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <tr>
                        
                        <th style="width: 100px;">User ID</th>
                        <th style="width: 200px;">Type</th>
                        <th style="width: 200px;">Subject</th>
                        <th style="width: 200px;">Email</th>
                        <th style="width: 200px;">Message</th>
                        <th style="width: 200px;">File</th>
                        <th style="width: 400px;">Date</th>
                        <th style="width: 400px;">View</th>
                        
                    </tr>
                        <%
                    support_ticket_master_method sm=new support_ticket_master_method();
                    ResultSet rs=sm.support_ticket_masterClassSelect();
                    while(rs.next())
                    {
                       
                    %>
                    <tr>
                        <td style="width: 100px;"><%=rs.getInt("User_Id")%></td>
                        <td style="width: 200px;"><%=rs.getString("Support_Type")%></td>
                        <td style="width: 200px;"><%=rs.getString("Subject")%></td>
                        <td style="width: 200px;"><%=rs.getString("Email")%></td>
                        <td style="width: 200px;"><%=rs.getString("Message")%></td>
                        <td style="width: 200px;"><%=rs.getString("File")%></td>
                        <td style="width: 200px;"><%=rs.getString("Support_Date")%></td>
                        <td style="width: 70px;"><a href="Employee.jsp?page=E_HelpTicketReply.jsp" ><i class="fa fa-eye"></i></a></td>
                    </tr>
                        
                  <%
                  }
                  %>
                    
                    
                </table>
            </div>
        </div>
        
       
    </body>
</html>

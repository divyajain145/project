<%-- 
    Document   : A_Inquiry
    Created on : 18 Dec, 2018, 1:47:08 PM
    Author     : bharat
--%>
<%@page import="dbConnection.inquiry_method"%>
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
                        
                        <th style="width: 100px;">ID</th>
                        <th style="width: 200px;">Name</th>
                        <th style="width: 200px;">Email</th>
                        <th style="width: 200px;">Mobile No.</th>
                        <th style="width: 200px;">Subject</th>
                        <th style="width: 200px;">Message</th>
                        <th style="width: 400px;">Date</th>
                        <th style="width: 400px;">Reply</th>
                        
                    </tr>
                        <%
                    inquiry_method im = new inquiry_method();
                    ResultSet rs = im.inquiry_ClassSelect(0);
                    while(rs.next())
                    {
                       
                    %>
                    <tr>
                        <td style="width: 100px;"><%=rs.getInt(1)%></td>
                        <td style="width: 200px;"><%=rs.getString(2)%></td>
                        <td style="width: 200px;"><%=rs.getString(3)%></td>
                        <td style="width: 200px;"><%=rs.getString(4)%></td>
                        <td style="width: 200px;"><%=rs.getString(5)%></td>
                        <td style="width: 200px;"><%=rs.getString(6)%></td>
                        <td style="width: 200px;"><%=rs.getString(7)%></td>
                        <td style="width: 70px;"><a href="mailto:<%=rs.getString("email")%>" ><i class="fa fa-reply"></i></a></td>
                    </tr>
                        
                  <%
                  }
                  %>
                    
                    
                </table>
            </div>
        </div>
        
       
    </body>
</html>

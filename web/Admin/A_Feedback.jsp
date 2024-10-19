<%-- 
    Document   : A_Feedback
    Created on : Apr 3, 2019, 10:21:24 AM
    Author     : Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.feedback_master" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if(request.getParameter("Delete") != null)
        {
        int feedback_id = Integer.parseInt(request.getParameter("Delete"));
        feedback_master fm = new feedback_master();
        
        int val = fm.feedback_ClassDelete(feedback_id);
        if(val>0)
        {
         out.print("<script>alert('successfully delete your data');window.location.href='Admin.jsp?page=A_Feedback.jsp';</script>");
        }
        }
        %>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Feedback List</li>
        </ol>

        <!-- Page Content -->
        <h4 class="clearfix">
            Feedback
            
        </h4>
        <hr>
        <div class="card">
            <div class="card-header">
               Feedback
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <tr>
                        
                        <th style="width: 100px;">Delete</th>
                        <th style="width: 100px;">ID</th>
                        <th style="width: 200px;">Name</th>
                        <th style="width: 200px;">Message</th>
                    </tr>
                    <%
                    feedback_master fm = new feedback_master();
                    ResultSet rs = fm.feedback_ClassSelect(0);
                    while(rs.next())
                    {
                       
                    %>
                    <tr>
                        
                        <td><a href="Admin.jsp?page=A_Feedback.jsp?Delete=<%=rs.getString("feedback_id")%>" onclick="return confirm('Are you sure you want to delete data?')"><i class="fa fa-trash"></i></a></td>
                        <td><%=rs.getInt("user_id")%></td>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("message")%></td>
                        
                    </tr>
                  
                    <%
                    }
                    %>
                    
                </table>
            </div>
        </div>
        
        
        
    </body>
</html>

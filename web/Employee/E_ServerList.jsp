<%-- 
    Document   : A_ServerList
    Created on : 26 Oct, 2018, 7:53:50 PM
    Author     : bharat
--%>
<%
 if(request.getParameter("Delete") != null)
        {
         int server_id = Integer.parseInt(request.getParameter("Delete"));
         server_method sm = new server_method();
         int val = sm.server_listClassDelete(server_id);
         if(val>0)
         {
         out.print("<script>alert('successfully delete your data');window.location.href='Employee.jsp?page=E_ServerList.jsp';</script>");
         }
        }
%>
<%@page import="dbConnection.server_method"%>
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
            <li class="breadcrumb-item active">Server Type</li>
        </ol>

        <!-- Page Content -->
        <h4 class="clearfix">
            Server
            <a href="Employee.jsp?page=E_ServerForm.jsp" class="btn btn-primary float-right"><i class="fa fa-plus"></i> Add</a>
        </h4>
        <hr>
        <div class="card">
            <div class="card-header">
                Server List
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 70px;">Edit</th>
                        <th style="width: 100px;">Delete</th>
                        <th style="width: 100px;">ID</th>
                        <th style="width: 200px;">Server</th>
                        <th style="width: 200px;">Status</th>
                    </tr>
                    <%
                     server_method sm = new server_method();
                     ResultSet rs = sm.server_listClassSelect(0);
                     while(rs.next())
                     {
                    %>
                    <tr>
                        <td><a href="Employee.jsp?page=E_ServerForm.jsp?edit=<%=rs.getString("server_id")%>"><i class="fa fa-pen"></i></a></td>
                        <td><a href="Employee.jsp?page=E_ServerList.jsp?Delete=<%=rs.getString("server_id")%>" onclick="return confirm('Are you sure you want to delete data?')"><i class="fa fa-trash"></i></a></td>
                        <td><%=rs.getString("Server_Id")%></td>
                        <td><%=rs.getString("Server_Type")%></td>
                        <td><%
                            if(rs.getString("Status").equals("0"))
                            {
                            out.print("Active");
                            }
                            else{
                            out.print("Inactive");
                            }
                            
                            %></td>
                    </tr>
                       <%
                    }
                    %>
                </table>
            </div>
        </div>
        
        
        
    </body>
</html>

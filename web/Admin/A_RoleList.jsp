<%-- 
    Document   : A_RoleList
    Created on : 26 Oct, 2018, 3:41:11 PM
    Author     : bharat
--%>

<%
    if (request.getParameter("Delete") != null) {
        int role_id = Integer.parseInt(request.getParameter("Delete"));
        role_method rl = new role_method();
        int val = rl.role_listClassDelete(role_id);
        if(val > 0)
        {
            out.print("<script>alert('Succesfully Delete Your Data.'); window.location.href='Admin.jsp?page=A_RoleList.jsp';</script>");
        }
    }

%>
<%@page import="dbConnection.role_method"%>
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
            <li class="breadcrumb-item active">Role List</li>
        </ol>

        <!-- Page Content -->
        <h4 class="clearfix">
            Role
            <a href="Admin.jsp?page=A_RoleForm.jsp" class="btn btn-primary float-right"><i class="fa fa-plus"></i> Add</a>
        </h4>
        <hr>
        <div class="card">
            <div class="card-header">
                Role List
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 70px;">Edit</th>
                        <th style="width: 100px;">Delete</th>
                        <th style="width: 100px;">Role Id</th>
                        <th style="width: 200px;">Name</th>
                    </tr>
                    <%
                       role_method rc = new role_method();
                       ResultSet rs = rc.role_listClassSelect(0);
                       while(rs.next())
                       {
                    %>
                    <tr>
                        <td><a href="Admin.jsp?page=A_RoleForm.jsp?edit=<%=rs.getString("role_id")%>"><i class="fa fa-pen"></i></a></td>
                        <td><a href="Admin.jsp?page=A_RoleList.jsp?Delete=<%=rs.getString("role_id")%>" onclick="return confirm('Are you sure you want to delete data?')"><i class="fa fa-trash"></i></a></td>
                        
                        <td><%=rs.getString("Role_Id")%></td>
                        <td><%=rs.getString("Role_Name")%></td>
                    </tr>
                    <%
                    
                    }
                    %>
                    
                </table>
            </div>
        </div>
        
        
        
    </body>
</html>

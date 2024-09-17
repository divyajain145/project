<%-- 
    Document   : A_TechnologyList
    Created on : 26 Oct, 2018, 3:41:11 PM
    Author     : bharat
--%>

<%
    if (request.getParameter("Delete") != null) {
        int tech_id = Integer.parseInt(request.getParameter("Delete"));
        technology_method rc = new technology_method();
        int val = rc.technology_listClassDelete(tech_id);
        if(val > 0)
        {
            out.print("<script>alert('Succesfully Delete Your Data.'); window.location.href='Admin.jsp?page=A_TechnologyList.jsp';</script>");
        }
    }

%>
<%@page import="dbConnection.technology_method"%>
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
            <li class="breadcrumb-item active">Technology</li>
        </ol>

        <!-- Page Content -->
        <h4 class="clearfix">
            Technology
            <a href="Admin.jsp?page=A_TechnologyForm.jsp" class="btn btn-primary float-right"><i class="fa fa-plus"></i> Add</a>
        </h4>
        <hr>
        <div class="card">
            <div class="card-header">
                Technology List
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 70px;">Edit</th>
                        <th style="width: 100px;">Delete</th>
                        <th style="width: 100px;">ID</th>
                        <th style="width: 200px;">Technology</th>
                        <th style="width: 200px;">Status</th>
                    </tr>
                    <%
                       technology_method rc = new technology_method();
                       ResultSet rs = rc.technology_listClassSelect(0);
                       while(rs.next())
                       {
                    %>
                    <tr>
                        <td><a href="Admin.jsp?page=A_TechnologyForm.jsp?edit=<%=rs.getString("technology_id")%>"><i class="fa fa-pen"></i></a></td>
                        <td><a href="Admin.jsp?page=A_TechnologyList.jsp?Delete=<%=rs.getString("technology_id")%>" onclick="return confirm('Are you sure you want to delete data?')"><i class="fa fa-trash"></i></a></td>
                        
                        <td><%=rs.getString("Technology_Id")%></td>
                        <td><%=rs.getString("Technology_Type")%></td>
                        <td><%
                            if(rs.getString("Status").equals("0"))
                            {
                                out.print("Active");
                            }
                            else
                            {
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

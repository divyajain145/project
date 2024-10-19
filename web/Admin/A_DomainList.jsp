<%-- 
    Document   : A_DomainList
    Created on : 26 Oct, 2018, 8:20:34 PM
    Author     : bharat
--%>
<%
    if (request.getParameter("Delete") != null) {
        int domain_id = Integer.parseInt(request.getParameter("Delete"));
        domain_method dm = new domain_method();
        int val = dm.doamain_listClassDelete(domain_id);
        if (val > 0) {
            out.print("<script>alert('successfully delete your data');window.location.href='Admin.jsp?page=A_DomainList.jsp';</script>");
        }
    }
%>
<%@page import="dbConnection.domain_method"%>
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
            <li class="breadcrumb-item active">Domain Type</li>
        </ol>

        <!-- Page Content -->
        <h4 class="clearfix">
            Domain
            <a href="Admin.jsp?page=A_DomainForm.jsp" class="btn btn-primary float-right"><i class="fa fa-plus"></i> Add</a>
        </h4>
        <hr>
        <div class="card">
            <div class="card-header">
                Domain List
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 70px;">Edit</th>
                        <th style="width: 100px;">Delete</th>
                        <th style="width: 100px;">ID</th>
                        <th style="width: 200px;">Domain</th>
                        <th style="width: 200px;">Status</th>
                    </tr>
                    <%
                        domain_method dm = new domain_method();
                        ResultSet rs = dm.domain_listClassSelect(0);
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><a href="Admin.jsp?page=A_DomainForm.jsp?edit=<%=rs.getString("domain_id")%>"><i class="fa fa-pen"></i></a></td>
                        <td><a href="Admin.jsp?page=A_DomainList.jsp?Delete=<%=rs.getString("domain_id")%>" onclick="return confirm('Are you sure you want to delete data?')"><i class="fa fa-trash"></i></a></td>
                        <td><%=rs.getString("Domain_Id")%></td>
                        <td><%=rs.getString("Domain_Type")%></td>
                        <td><%
                            if (rs.getString("Status").equals("0")) {
                                out.print("Active");
                            } else {
                                out.print("Inactive");
                            }

                            %></td>
                    </tr>
                    <%                        }
                    %>

                </table>
            </div>
        </div>



    </body>
</html>

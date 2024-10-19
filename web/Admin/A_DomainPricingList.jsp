<%-- 
    Document   : A_DomainPricingList
    Created on : 22 Dec, 2018, 10:50:25 AM
    Author     : BRIGHT
--%>
<%
    if (request.getParameter("Delete") != null) {
        int domain_pricing_id = Integer.parseInt(request.getParameter("Delete"));
        domain_pricing_method pm = new domain_pricing_method();
        int val = pm.doamain_PricelistClassDelete(domain_pricing_id);
        if (val > 0) {
            out.print("<script>alert('successfully delete your data');window.location.href='Admin.jsp?page=A_DomainPricingList.jsp';</script>");
        }
    }
%>
<%@page import="dbConnection.domain_pricing_method"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            <a href="Admin.jsp?page=A_DomainPricingForm.jsp" class="btn btn-primary float-right"><i class="fa fa-plus"></i> Add</a>
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
                        <th style="width: 200px;">Domain_Type_Id</th>
                        <th style="width: 200px;">Domain_Price</th>
                        <th style="width: 200px;">Price_Per_Year</th>
                        <th style="width: 200px;">Status</th>
                    </tr>
                    <%
                        domain_pricing_method pm = new domain_pricing_method();
                        ResultSet rs = pm.domain_PricelistClassSelect(0);
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><a href="Admin.jsp?page=A_DomainPricingForm.jsp?edit=<%=rs.getString("domain_pricing_id")%>"><i class="fa fa-pen"></i></a></td>
                        <td><a href="Admin.jsp?page=A_DomainPricingList.jsp?Delete=<%=rs.getString("domain_pricing_id")%>" onclick="return confirm('Are you sure you want to delete data?')"><i class="fa fa-trash"></i></a></td>
                        <td><%=rs.getInt("Domain_Pricing_Id")%></td>
                        <td><%=rs.getInt("Domain_Type_Id")%></td>
                        <td><%=rs.getString("Domain_Price")%></td>
                        <td><%=rs.getString("Pricing_Per_Year")%></td>
                        
                        <td><%
                            if (rs.getString("Status").equals("0")) {
                                out.print("Active");
                            } else {
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

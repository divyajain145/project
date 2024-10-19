<%-- 
    Document   : A_DomainPricingForm
    Created on : 22 Dec, 2018, 10:50:54 AM
    Author     : BRIGHT
--%>
<%@page import="dbConnection.domain_pricing_method"%>
<%@page import="dbConnection.domain_method"%>
<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String domain_price = "",pricing_per_year="";
            int domain_type_id=0,status = 0,domain_id=0;
            if (request.getParameter("btn1") != null) {
                domain_pricing_method pm = new domain_pricing_method();

                int val = 0;
                if (request.getParameter("edit") != null) {
                    val = pm.domain_PricelistClassUpdate(Integer.parseInt(request.getParameter("edit")), Integer.parseInt(request.getParameter("dropStatus1")),request.getParameter("txtPrice"),request.getParameter("txtPricePerYear"), Integer.parseInt(request.getParameter("dropStatus")));
                } else {
                   
                    val = pm.domain_PriceListClassInsert(Integer.parseInt(request.getParameter("dropStatus1")),request.getParameter("txtPrice"),request.getParameter("txtPricePerYear"), Integer.parseInt(request.getParameter("dropStatus")));
                }
                if (val > 0) {
                    if (request.getParameter("edit") != null) {
                         if (val == 2) {
                            String a = request.getParameter("dropStatus1") + " already Exists";
                            out.print("<script>alert('" + a + "');</script>");
                        } else {
                        out.print("<script>alert('Successfully Update Your Data.');window.location.href='Admin.jsp?page=A_DomainPricingForm.jsp';</script>");
                    }
                    }else {
                        if (val == 2) {
                            String a = request.getParameter("dropStatus1") + " already Exists";
                            out.print("<script>alert('" + a + "');</script>");
                        } else {
                            out.print("<script>alert('Succesfully Store Your Data.')</script>");
                        }

                    }
                } else {
                    out.print("<script>('Some Thing is Wrong in Your Code.'')</script>");
                }
            }
            if (request.getParameter("edit") != null) {
              int  domain_pricing_id = Integer.parseInt(request.getParameter("edit"));
                domain_pricing_method dm = new domain_pricing_method();
                ResultSet rs = dm.domain_PricelistClassSelect(domain_pricing_id);
                while (rs.next()) {
                    domain_type_id = rs.getInt("Domain_Type_Id");
                    domain_price = rs.getString("Domain_Price");
                    pricing_per_year = rs.getString("Pricing_Per_Year");
                    status = rs.getInt("Status");
                }
            }

        %>

         <form action="A_DomainPricingForm.jsp <% if (request.getParameter("edit") != null) {
                out.print("?edit=" + request.getParameter("edit"));
            }
              %>" method="post">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Domain Pricing</li>
            </ol>

            <!-- Page Content -->
            <h4 class="clearfix">
                Domain Pricing
                <a href="Admin.jsp?page=A_DomainPricingList.jsp" class="btn btn-primary float-right"><i class="fa fa-angle-left"></i> Back</a>
            </h4>
            <hr>
            <div class="card">
                <div class="card-header">
                    Domain Pricing
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="dropStatus">Domain Type</label>
                       
                        <select class="form-control" id="dropStatus1" name="dropStatus1">
                                <option value="0">---Select Server---</option>
                                <%
                                    domain_method sm = new domain_method();
                                    ResultSet rs = sm.domain_listClassSelect(0);
                                    while (rs.next()) {


                                %>
          <option <%if(domain_type_id==rs.getInt("Domain_Id")){out.print("selected");}%> value="<%=rs.getInt("Domain_Id")%>"><%=rs.getString("Domain_Type")%></option>

                                <%
                                    }
                                %>
                            </select>

                    </div>
                    <div class="form-group">
                        <label for="txtTech">Domain Price</label>
                    
                        <input type="text" class="form-control" name="txtPrice" id="txtTech" value="<%=domain_price%>" placeholder="Enter Domain Price">

                    </div>
                         <div class="form-group">
                        <label for="txtTech">Pricing Per Year</label>
                    
                        <input type="text" class="form-control" name="txtPricePerYear" id="txtTech" value="<%=pricing_per_year%>" placeholder="Enter Domain Pricing Per Year">

                    </div>
                    <div class="form-group">
                        <label for="dropStatus">Status</label>
                        <select class="form-control" id="dropStatus" name="dropStatus">
                                <option <%if (status == 0) {
                                    out.print("selected");
                                }%> value="0">Active</option>
                                <option <%if (status == 1) {
                                    out.print("selected");
                                }%> value="1">Inactive</option>
                        </select>

                    </div>
                </div>
                <div class="card-footer">
                    <input type="submit" name="btn1" id="btn1" value="Save" class="btn btn-success btn-lg" />
                </div>
            </div>
        </form>
    </body>
</html>

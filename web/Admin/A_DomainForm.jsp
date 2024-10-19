<%-- 
    Document   : A_DomainForm.jsp
    Created on : 26 Oct, 2018, 8:23:34 PM
    Author     : bharat
--%>

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
            String domain = "";
            int status = 0;
            if (request.getParameter("btn1") != null) {
                domain_method dm = new domain_method();

                int val = 0;
                if (request.getParameter("edit") != null) {
                    val = dm.domain_listClassUpdate(Integer.parseInt(request.getParameter("edit")), request.getParameter("txtTech"), Integer.parseInt(request.getParameter("dropStatus")));
                } else {
                   
                    val = dm.domain_listClassInsert(request.getParameter("txtTech"), Integer.parseInt(request.getParameter("dropStatus")));
                }
                if (val > 0) {
                    if (request.getParameter("edit") != null) {
                        if (val == 2) {
                            String a = request.getParameter("txtTech") + " already Exists";
                            out.print("<script>alert('" + a + "');</script>");
                        } 
                        else
                        out.print("<script>alert('Successfully Update Your Data.');window.location.href='Admin.jsp?page=A_DomainForm.jsp';</script>");
                    } else {
                        if (val == 2) {
                            String a = request.getParameter("txtTech") + " already Exists";
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
                int domain_id = Integer.parseInt(request.getParameter("edit"));
                domain_method dm = new domain_method();
                ResultSet rs = dm.domain_listClassSelect(domain_id);
                while (rs.next()) {
                    domain = rs.getString("Domain_Type");
                    status = rs.getInt("Status");
                }
            }

        %>

        <form action="A_DomainForm.jsp <% if (request.getParameter("edit") != null) {
                out.print("?edit=" + request.getParameter("edit"));
            }
              %>" method="post">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Domain</li>
            </ol>

            <!-- Page Content -->
            <h4 class="clearfix">
                Domain
                <a href="Admin.jsp?page=A_DomainList.jsp" class="btn btn-primary float-right"><i class="fa fa-angle-left"></i> Back</a>
            </h4>
            <hr>
            <div class="card">
                <div class="card-header">
                    Domain
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtTech">Domain</label>
                    
                        <input type="text" class="form-control" name="txtTech" id="txtTech" value="<%=domain%>" placeholder="Enter Domain">

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

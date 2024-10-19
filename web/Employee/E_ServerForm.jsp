<%-- 
    Document   : A_ServerForm
    Created on : 26 Oct, 2018, 8:01:30 PM
    Author     : bharat
--%>

<%@page import="dbConnection.server_method"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String server = "";
            int status = 0;
            if (request.getParameter("btn1") != null) {
                server_method sm = new server_method();

                int val = 0;
                if (request.getParameter("edit") != null) {
                    val = sm.server_listClassUpdate(Integer.parseInt(request.getParameter("edit")), request.getParameter("txtTech"), Integer.parseInt(request.getParameter("dropStatus")));
                } else {
                    val = sm.server_listClassInsert(request.getParameter("txtTech"), Integer.parseInt(request.getParameter("dropStatus")));
                }
                if (val > 0) {
                    if (request.getParameter("edit") != null) {
                        if (val == 2) {
                            String a = request.getParameter("txtTech") + " already Exists";
                            out.print("<script>alert('" + a + "');</script>");
                        } 
                        else {
                            out.print("<script>alert('Successfully Updated Your Data.');window.location.href='Employee.jsp?page=E_ServerForm.jsp';</script>");
                        }
                    } else {
                        if (val == 2) {
                            String a = request.getParameter("txtTech") + " already Exists";
                            out.print("<script>alert('" + a + "');</script>");
                        } else {
                            out.print("<script>alert('Successfully Stored Your Data.')</script>");
                        }
                    }
                } else {
                    out.print("<script>('Some Thing is Wrong in Your Code.'')</script>");
                }
            }
            if (request.getParameter("edit") != null) {
                int server_id = Integer.parseInt(request.getParameter("edit"));
                server_method sm = new server_method();
                ResultSet rs = sm.server_listClassSelect(server_id);
                while (rs.next()) {
                    server = rs.getString("Server_Type");
                    status = rs.getInt("Status");
                }
            }

        %>

        <form action="E_ServerForm.jsp <% if (request.getParameter("edit") != null) {
                out.print("?edit=" + request.getParameter("edit"));
            }
              %>" method="post">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Server</li>
            </ol>

            <!-- Page Content -->
            <h4 class="clearfix">
                Server
                <a href="Employee.jsp?page=E_ServerList.jsp" class="btn btn-primary float-right"><i class="fa fa-angle-left"></i> Back</a>
            </h4>
            <hr>
            <div class="card">
                <div class="card-header">
                    Server
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtTech">Server</label>
                        <input type="text" class="form-control" name="txtTech" id="txtTech" value="<%=server%>" placeholder="Enter Server">

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

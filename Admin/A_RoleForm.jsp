<%-- 
    Document   : A_FAQForm
    Created on : Nov 1, 2018, 7:55:53 AM
    Author     : Trojan
--%>


<%@page import="dbConnection.role_method"%>
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
     
            String name = "";

            if (request.getParameter("btn1") != null) {
                role_method rl = new role_method();
                int val = 0;
                if (request.getParameter("edit") != null) {
                    
                    val = rl.role_listClassUpdate(Integer.parseInt(request.getParameter("edit")), request.getParameter("txtRole1"));
                } else {
                   val = rl.role_listClassInsert(request.getParameter("txtRole1"));
                }

                if (val > 0) {
                    if (request.getParameter("edit") != null) {
                        if (val == 2) {
                            String a = request.getParameter("txtRole1") + " already Exists";
                            out.print("<script>alert('" + a + "');</script>");
                        } else {
                            out.print("<script>alert('Successfully Updated Your Data.');window.location.href='Admin.jsp?page=A_RoleForm.jsp';</script>");
                        }
                    } else {
                        if (val == 2) {
                            String a = request.getParameter("txtRole1") + " already Exists";
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
                int role_id = Integer.parseInt(request.getParameter("edit"));
                role_method rl = new role_method();
                ResultSet rs = rl.role_listClassSelect(role_id);
                if (rs.next()) {
                    name = rs.getString("Role_Name");
                }
            }


        %>
        <form action="A_RoleForm.jsp <% if (request.getParameter("edit") != null) {
                out.print("?edit=" + request.getParameter("edit"));
            }
              %>" method="post">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Role</li>
            </ol>

            <!-- Page Content -->
            <h4 class="clearfix">
                Role
                <a href="Admin.jsp?page=A_RoleList.jsp" class="btn btn-primary float-right"><i class="fa fa-angle-left"></i> Back</a>
            </h4>
            <hr>
            <div class="card">
                <div class="card-header">
                    Role                </div>
                <div class="card-body">
                   

                    <div class="form-group">
                        <label for="txtTech">Role Name</label>
                        <input type="text" class="form-control" name="txtRole1" id="txtRole1" value="<%=name%>" placeholder="Enter Plan Title">     
                    </div>


                </div>
                <div class="card-footer">
                    <input type="submit" name="btn1" id="btn1" value="Save" class="btn btn-success btn-lg" />
                </div>
            </div>
        </form>
    </body>
</html>

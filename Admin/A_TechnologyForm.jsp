<%-- 
    Document   : A_TechnologyForm
    Created on : 26 Oct, 2018, 4:12:05 PM
    Author     : bharat
--%>

<%@page import="dbConnection.technology_method"%>
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
            String technology = "";
            int status = 0;

            if (request.getParameter("btn1") != null) {
                technology_method rc = new technology_method();
                int val = 0;
                if (request.getParameter("edit") != null) {
                    val = rc.technology_listClassUpdate(Integer.parseInt(request.getParameter("edit")), request.getParameter("txtTech"), Integer.parseInt(request.getParameter("dropStatus")));
                } else {

                    val = rc.technology_listClassInsert(request.getParameter("txtTech"), Integer.parseInt(request.getParameter("dropStatus")));
                }

                if (val > 0) {
                    if (request.getParameter("edit") != null) {
                        if (val == 2) {
                            String a = request.getParameter("txtTech") + " already Exists";
                            out.print("<script>alert('" + a + "');</script>");
                        } else {
                            out.print("<script>alert('Successfully Updated Your Data.');window.location.href='Admin.jsp?page=A_TechnologyForm.jsp';</script>");
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
                int tech_id = Integer.parseInt(request.getParameter("edit"));
                technology_method rc = new technology_method();
                ResultSet rs = rc.technology_listClassSelect(tech_id);
                if (rs.next()) {
                    technology = rs.getString("Technology_Type");
                    status = rs.getInt("Status");
                }
            }


        %>
        <form action="A_TechnologyForm.jsp<% if (request.getParameter("edit") != null) {
                out.print("?edit=" + request.getParameter("edit"));
            }
              %>" method="post">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Technology</li>
            </ol>

            <!-- Page Content -->
            <h4 class="clearfix">
                Technology
                <a href="Admin.jsp?page=A_TechnologyList.jsp" class="btn btn-primary float-right"><i class="fa fa-angle-left"></i> Back</a>
            </h4>
            <hr>
            <div class="card">
                <div class="card-header">
                    Technology
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtTech">Technology</label>
                        <input type="text" class="form-control" name="txtTech" id="txtTech" value="<%=technology%>" placeholder="Enter Technology">

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

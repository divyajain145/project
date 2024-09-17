<%-- 
    Document   : A_EmployeeForm
    Created on : Nov 1, 2018, 8:37:39 AM
    Author     : Trojan
--%>
<%@page import="dbConnection.employee_method" %>
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
            String name = "", email = "", password = "", mob_number = "";
            int gender = 0, status = 0, user_id = 0, role_id = 0, last_date = 0, register_date = 0;
            if (request.getParameter("btn1") != null) {
                employee_method em = new employee_method();
                int val = 0;

                if (request.getParameter("edit") != null) {
                    val = em.employee_ClassUpdate(Integer.parseInt(request.getParameter("edit")),Integer.parseInt(request.getParameter("role")), request.getParameter("text1"), request.getParameter("text2"), request.getParameter("mobile"), request.getParameter("password"), Integer.parseInt(request.getParameter("radio").toString()), Integer.parseInt(request.getParameter("dropStatus")));
                } else {
                    val = em.employee_ClassInsert(Integer.parseInt(request.getParameter("role")),request.getParameter("text1"), request.getParameter("text2"), request.getParameter("mobile"), request.getParameter("password"), Integer.parseInt(request.getParameter("radio").toString()), Integer.parseInt(request.getParameter("dropStatus")));
                }
                if (val > 0) {
                    if (request.getParameter("edit") != null) {
                        if (val == 2) {
                            String a = request.getParameter("text1") + " already Exists";
                            out.print("<script>alert('" + a + "');</script>");
                        } else {
                            out.print("<script>alert('Successfully Updated Your Data.');window.location.href='Admin.jsp?page=A_EmployeeForm.jsp';</script>");
                        }
                    } else {
                        if (val == 2) {
                            String a = request.getParameter("text1") + " already Exists";
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
                int employee_id = Integer.parseInt(request.getParameter("edit"));
                employee_method em = new employee_method();
                ResultSet rs = em.employee_ClassSelect(employee_id);
                while (rs.next()) {

                    user_id = rs.getInt(1);
                    role_id = rs.getInt(2);
                    name = rs.getString(3);
                    email = rs.getString(4);
                    mob_number = rs.getString(5);
                    password = rs.getString(6);
                    gender = rs.getInt(7);
                    status = rs.getInt(10);
                }
            }
        %>
        <form action="A_EmployeeForm.jsp <% if (request.getParameter("edit") != null) {
                out.print("?edit=" + request.getParameter("edit"));
            }
              %>"  method="post">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Employee Account</li>
            </ol>

            <!-- Page Content -->
            <h4 class="clearfix">
                Employee Account
                <a href="Admin.jsp?page=A_EmployeeList.jsp" class="btn btn-primary float-right"><i class="fa fa-angle-left"></i> Back</a>
            </h4>
            <hr>
            <div class="card">
                <div class="card-header">
                    Employee Account
                </div>

                <div class="card-body">
                        <div class="form-group">
                        <label for="dropStatus">Role List</label>

                        <select class="form-control" id="role" name="role">

                            <option <%if (role_id == 5) {
                                    out.print("selected");
                                }%> value="5">Employee</option>

                        </select>

                    </div>
                    <div class="row">
                        <div class="col-4 form-group">
                            <label for="txtTech">User Name</label>
                            <input type="text" class="form-control" name="text1" id="text1" value="<%=name%>"  placeholder="Enter User Name">    
                        </div>

                        <div class="col-4 form-group">
                            <label for="txtTech">User Email</label>
                            <input type="email" class="form-control" name="text2" id="text2" value="<%=email%>"   placeholder="Enter User's Email Address">    
                        </div>

                        <div class="col-4 form-group">
                            <label for="txtTech">Mobile Number</label>
                            <input type="number" class="form-control" name="mobile" id="mobile"  value="<%=mob_number%>" placeholder="Enter User Mobile Number">    
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6 form-group">
                            <label for="txtTech">Password</label>
                            <input type="password" class="form-control" name="password" id="pass"  value="<%=password%>" placeholder="Enter User Password">    
                        </div>

                        <div class="col-6 form-group">
                            <label for="txtTech">Gender</label><br>
                            <div class="row">
                                <div class="col-3 form-group">

                                           <input type="radio" name="radio" id="radio1"  name="radio" <%if (gender == 0) {
                                                   out.print("Checked");
                                               }%> value="0" checked>Male<br>
                                </div> 
                                <div class="col-3 form-group">
                                       <input type="radio" name="radio" id="radio2"  name="radio" <%if (gender == 1) {
                                               out.print("checked");
                                           }%> value="1">Female<br>
                                </div>  

                            </div>
                        </div>
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

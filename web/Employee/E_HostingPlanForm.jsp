<%-- 
    Document   : A_HostingPlan.jsp
    Created on : 29 Oct, 2018, 1:05:27 PM
    Author     : bharat
--%>
<%@page import="dbConnection.hostingplan_method"%>
<%@page import="dbConnection.server_method" %>
<%@page import="dbConnection.technology_method" %>
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
            String server_id = "", tech_id = "", server_type = "", technology_type = "", plan_title = "", email_account = "", tech_support = "", database = "", lang_support = "", sub_domain = "", controlpanel_type = "", ftp_account = "";
            int disk_space = 0, bandwidth_space = 0, price_year = 0;
            int status = 0;
            if (request.getParameter("btn1") != null) {
                hostingplan_method hm = new hostingplan_method();
                int val = 0;
                if (request.getParameter("edit") != null) {
                    val = hm.hostingplan_listClassUpdate(Integer.parseInt(request.getParameter("edit")), Integer.parseInt(request.getParameter("dropStatus1")), Integer.parseInt(request.getParameter("dropStatus2")), request.getParameter("txtTech1"), Integer.parseInt(request.getParameter("number1")), Integer.parseInt(request.getParameter("number2")), request.getParameter("txtTech2"), request.getParameter("txtTech3"), request.getParameter("txtTech4"), request.getParameter("txtTech5"), Integer.parseInt(request.getParameter("number3")), request.getParameter("txtTech6"), request.getParameter("txtTech7"), request.getParameter("txtTech8"), Integer.parseInt(request.getParameter("dropStatus")));
                } else {
                    val = hm.hostingplan_listClassInsert(Integer.parseInt(request.getParameter("dropStatus1")), Integer.parseInt(request.getParameter("dropStatus2")), request.getParameter("txtTech1"), Integer.parseInt(request.getParameter("number1")), Integer.parseInt(request.getParameter("number2")), request.getParameter("txtTech2"), request.getParameter("txtTech3"), request.getParameter("txtTech4"), request.getParameter("txtTech5"), Integer.parseInt(request.getParameter("number3")), request.getParameter("txtTech6"), request.getParameter("txtTech7"), request.getParameter("txtTech8"), Integer.parseInt(request.getParameter("dropStatus")));
                }
                if (val > 0) {
                    if (request.getParameter("edit") != null) {
                        if (val == 2) {
                            String a = request.getParameter("txtTech1") + " already Exists";
                            out.print("<script>alert('" + a + "');</script>");
                        } else {
                            out.print("<script>alert('Successfully Updated Your Data.');window.location.href='Employee.jsp?page=E_HostingPlanForm.jsp';</script>");
                        }
                    } else {
                        if (val == 2) {
                            String a = request.getParameter("txtTech1") + " already Exists";
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
                int hp_id = Integer.parseInt(request.getParameter("edit"));
                hostingplan_method hm = new hostingplan_method();
                ResultSet rs = hm.hostingplan_listClassSelect(hp_id);
                if (rs.next()) {
                    server_id = rs.getString("Server_Id");
                    tech_id = rs.getString("Technology_Id");
                    plan_title = rs.getString("Plan_Title");
                    disk_space = rs.getInt("Disk_Space");
                    bandwidth_space = rs.getInt("Bandwidth_Space");
                    email_account = rs.getString("Email_Account");
                    tech_support = rs.getString("Technical_Support");
                    database = rs.getString("Database_Name");
                    lang_support = rs.getString("Language_Support");
                    price_year = rs.getInt("Price_Per_Year");
                    sub_domain = rs.getString("Sub_Domains");
                    controlpanel_type = rs.getString("Control_Panel_Type");
                    ftp_account = rs.getString("FTP_Account");
                    status = rs.getInt("Status");
                }
            }
        %>
        <form action="E_HostingPlanForm.jsp<% if (request.getParameter("edit") != null) {
                out.print("?edit=" + request.getParameter("edit"));
            }
              %>" method="post">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Hosting Plan</li>
            </ol>

            <!-- Page Content -->
            <h4 class="clearfix">
                Hosting Plan
                <a href="Employee.jsp?page=E_HostingPlanList.jsp" class="btn btn-primary float-right"><i class="fa fa-angle-left"></i> Back</a>
            </h4>
            <hr>
            <div class="card">
                <div class="card-header">
                    Hosting Plan
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-6 form-group">
                            <label for="dropStatus">Server</label>
                            <select class="form-control" id="dropStatus1" name="dropStatus1">
                                <option value="0">---Select Server---</option>
                                <%
                                    server_method sm = new server_method();
                                    ResultSet rs = sm.server_listClassSelect(0);
                                    while (rs.next()) {

                                %>
                                <option <%if (server_id.equals(rs.getString("Server_Id"))) {
                                        out.print("selected");
                                    }%> value="<%=rs.getString("Server_Id")%>"><%=rs.getString("server_type")%></option>
                                <%
                                    }
                                %>
                            </select>

                        </div>
                        <div class="col-6 form-group">
                            <label for="dropStatus">Technology</label>
                            <select class="form-control" id="dropStatus2" name="dropStatus2">
                                <option value="0">---Select Technology---</option>
                                <%
                                    technology_method tm = new technology_method();
                                    ResultSet rs1 = tm.technology_listClassSelect(0);
                                    while (rs1.next()) {

                                %>
                                <option <%if (tech_id.equals(rs1.getString("Technology_Id"))) {
                                        out.print("selected");
                                    }%> value="<%=rs1.getString("Technology_Id")%>"><%=rs1.getString("technology_type")%></option>
                                <%
                                    }
                                %>
                            </select>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtTech">Plan Title</label>
                        <input type="text" class="form-control" name="txtTech1" id="txtTech1" value="<%=plan_title%>" placeholder="Enter Plan Title">     
                    </div>

                    <div class="row">
                        <div class="col-4 form-group">
                            <label for="txtTech">Disk Space</label>
                            <input type="number" class="form-control" name="number1" id="number1" value="<%=disk_space%>"  placeholder="Enter Disk Space">    
                        </div>

                        <div class="col-4 form-group">
                            <label for="txtTech">Bandwidth Space</label>
                            <input type="number" class="form-control" name="number2" id="number2" value="<%=bandwidth_space%>" placeholder="Enter Disk Space">    
                        </div>

                        <div class="col-4 form-group">
                            <label for="txtTech">Email Account</label>
                            <input type="email" class="form-control" name="txtTech2" id="txtTech2" value="<%=email_account%>" placeholder="Enter Email Account">    
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="txtTech">Technical Support</label>
                        <input type="text" class="form-control" name="txtTech3" id="txtTech3" value="<%=tech_support%>" placeholder="Enter Technical Support ">    
                    </div>
                    <div class="row">
                        <div class="col-4 form-group">
                            <label for="txtTech">Database Name</label>
                            <input type="text" class="form-control" name="txtTech4" id="txtTech4" value="<%=database%>" placeholder="Enter Database Name ">    
                        </div>

                        <div class="col-4 form-group">
                            <label for="txtTech">Language Support</label>
                            <input type="text" class="form-control" name="txtTech5" id="txtTech5" value="<%=lang_support%>"  placeholder="Enter Language Support ">    
                        </div>

                        <div class="col-4 form-group">
                            <label for="txtTech">Price Per Year</label>
                            <input type="number" class="form-control" name="number3" id="number3" value="<%=price_year%>" placeholder="Enter Price per year">    
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4 form-group">
                            <label for="txtTech">Sub_Domains</label>
                            <input type="text" class="form-control" name="txtTech6" id="txtTech6" value="<%=sub_domain%>" placeholder="Enter Subdomains ">    
                        </div>

                        <div class="col-4 form-group">
                            <label for="txtTech">Control Panel Type</label>
                            <input type="text" class="form-control" name="txtTech7" id="txtTech7" value="<%=controlpanel_type%>" placeholder="Enter Control Panel Type">    
                        </div>

                        <div class="col-4 form-group">
                            <label for="txtTech">FTP Account</label>
                            <input type="text" class="form-control" name="txtTech8" id="txtTech8" value="<%=ftp_account%>" placeholder="Enter FTP Account">    
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="dropStatus">Status</label>

                        <select class="form-control" id="dropStatus" name="dropStatus" value="<%=bandwidth_space%>">

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

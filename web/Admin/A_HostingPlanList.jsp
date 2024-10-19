<%-- 
    Document   : A_TechnologyList
    Created on : 26 Oct, 2018, 3:41:11 PM
    Author     : bharat
--%>

<%
   
    if (request.getParameter("Delete") != null) {
        int hp_id = Integer.parseInt(request.getParameter("Delete"));
        hostingplan_method hm = new hostingplan_method();
        int val = hm.hostingplan_listClassDelete(hp_id);
        if(val > 0)
        {
            out.print("<script>alert('Succesfully Delete Your Data.'); window.location.href='Admin.jsp?page=A_HostingPlanList.jsp';</script>");
        }
    }

%>
<%@page import="dbConnection.hostingplan_method"%>
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
            <li class="breadcrumb-item active">Hosting Plan</li>
        </ol>

        <!-- Page Content -->
        <h4 class="clearfix">
            Hosting Plan
            <a href="Admin.jsp?page=A_HostingPlanForm.jsp" class="btn btn-primary float-right"><i class="fa fa-plus"></i> Add</a>
        </h4>
        <hr>
        <div class="card">
            <div class="card-header">
                Hosting Plan List
            </div>
            <div class="card-body table-responsive">
                <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 100px;">Edit</th>
                        <th style="width: 70px;">Delete</th>
                        <th style="width: 70px;">HP_ID</th>
                        <th>Server Id</th>
                        <th>Technology Id</th>
                        <th>Plan_Title</th>
                        <th>Disk_Space</th>
                        <th>Bandwidth_Space</th>
                        <th>Email_Account</th>
                        <th>Technical_Support</th>
                        <th>Database</th>
                        <th>Language_Support</th>
                        <th>Price_Year</th>
                        <th>Subdomains</th>
                        <th>ControlPanel_Type</th>
                        <th>FTP_Account</th>
                        <th>Status</th>
                    </tr>
                    <%

                        hostingplan_method hm = new hostingplan_method();
                        ResultSet rs = hm.hostingplan_listClassSelect(0);
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><a href="Admin.jsp?page=A_HostingPlanForm.jsp?edit=<%=rs.getString("hp_id")%>"><i class="fa fa-pen"></i></a></td>
                        <td><a href="Admin.jsp?page=A_HostingPlanList.jsp?Delete=<%=rs.getString("hp_id")%>" onclick="return confirm('Are you sure you want to delete data?')"><i class="fa fa-trash"></i></a></td>
                        <td><%=rs.getString("HP_Id")%></td>
                        <td><%=rs.getString("Server_Id")%></td>
                        <td><%=rs.getString("Technology_Id")%></td>
                        <td><%=rs.getString("Plan_Title")%></td>
                        <td><%=rs.getString("Disk_Space")%></td>
                        <td><%=rs.getString("Bandwidth_Space")%></td>
                        <td><%=rs.getString("Email_Account")%></td>
                        <td><%=rs.getString("Technical_Support")%></td>
                        <td><%=rs.getString("Database_Name")%></td>
                        <td><%=rs.getString("Language_Support")%></td>
                        <td><%=rs.getString("Price_Per_Year")%></td>
                        <td><%=rs.getString("Sub_Domains")%></td>
                        <td><%=rs.getString("Control_Panel_Type")%></td>
                        <td><%=rs.getString("FTP_Account")%></td>
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

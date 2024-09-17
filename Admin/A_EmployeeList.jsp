<%-- 
    Document   : A_EmployeeList
    Created on : Nov 1, 2018, 7:41:11 AM
    Author     : Trojan
--%>
<%@page import="dbConnection.employee_method"%>

<%@page import="java.sql.*"%>
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
       <%
        if(request.getParameter("Delete") != null)
        {
        int employee_id = Integer.parseInt(request.getParameter("Delete"));
        employee_method em = new employee_method();
        int val = em.employee_ClassDelete(employee_id);
        if(val>0)
        {
         out.print("<script>alert('successfully delete your data');window.location.href='Admin.jsp?page=A_EmployeeList.jsp';</script>");
        }
        }
       %>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Employee Account</li>
        </ol>

        <!-- Page Content -->
        <h4 class="clearfix">
            Employee Account
            <a href="Admin.jsp?page=A_EmployeeForm.jsp" class="btn btn-primary float-right"><i class="fa fa-plus"></i> Add</a>
        </h4>
        <hr>
        <div class="card">
            <div class="card-header">
               Employee Account
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 70px;">Edit</th>
                        <th style="width: 100px;">Delete</th>
                        <th style="width: 100px;">ID</th>
                        <th style="width: 200px;">Role Id</th>
                        <th style="width: 200px;">User Name</th>
                        <th style="width: 200px;">Email</th>
                        <th style="width: 200px;">Mobile No.</th>
                        <th style="width: 200px;">Password</th>
                        <th style="width: 200px;">Gender</th>
                        <th style="width: 400px;">Last Login Date</th>
                        <th style="width: 400px;">Register Date</th>
                        <th style="width: 200px;">Status</th>
                    </tr>
                        <%
                    employee_method em = new employee_method();
                    ResultSet rs = em.employee_ClassSelect(0);
                    while(rs.next())
                    {
                       
                    %>
                    <tr>
                        <td style="widtd: 70px;"><a href="Admin.jsp?page=A_EmployeeForm.jsp?edit=<%=rs.getString("employee_id")%>"><i class="fa fa-pen"></i></a></td>
                        <td style="widtd: 100px;"><a href="Admin.jsp?page=A_EmployeeList.jsp?Delete=<%=rs.getString("employee_id")%>" onclick="return confirm('Are you sure you want to delete data?')"><i class="fa fa-trash"></i></a></td>
                        <td style="widtd: 100px;"><%=rs.getInt(1)%></td>
                        <td style="widtd: 200px;"><%=rs.getInt(2)%></td>
                        <td style="widtd: 200px;"><%=rs.getString(3)%></td>
                        <td style="widtd: 200px;"><%=rs.getString(4)%></td>
                        <td style="widtd: 200px;"><%=rs.getString(5)%></td>
                        <td style="widtd: 200px;"><%=rs.getString(6)%></td>
                        <td style="widtd: 200px;"><%
                            if (rs.getString("Gender").equals("0")) {
                                out.print("Male");
                            } else {
                                out.print("Female");
                            }

                            %></td>
                        <td style="widtd: 400px;"><%=rs.getString(8)%></td>
                        <td style="widtd: 400px;"><%=rs.getString(9)%></td>
                        <td style="widtd: 200px;"><%
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



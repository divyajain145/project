<%-- 
    Document   : A_FAQList
    Created on : Nov 1, 2018, 7:40:49 AM
    Author     : Trojan
--%>


<%@page import="dbConnection.FAQs_method"%>
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
        int faq_id = Integer.parseInt(request.getParameter("Delete"));
        FAQs_method fm = new FAQs_method();
        
        int val = fm.faqs_ClassDelete(faq_id);
        if(val>0)
        {
         out.print("<script>alert('successfully delete your data');window.location.href='Admin.jsp?page=A_FAQList.jsp';</script>");
        }
        }
        %>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">FAQ's</li>
        </ol>

        <!-- Page Content -->
        <h4 class="clearfix">
            FAQ's
            <a href="Admin.jsp?page=A_FAQForm.jsp" class="btn btn-primary float-right"><i class="fa fa-plus"></i> Add</a>
        </h4>
        <hr>
        <div class="card">
            <div class="card-header">
                FAQ's
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 70px;">Edit</th>
                        <th style="width: 100px;">Delete</th>
                        <th style="width: 100px;">ID</th>
                        <th style="width: 200px;">Question</th>
                        <th style="width: 200px;">Answer</th>
                    </tr>
                    <%
                    FAQs_method fm = new FAQs_method();
                    ResultSet rs = fm.faqs_ClassSelect(0);
                    while(rs.next())
                    {
                       
                    %>
                    <tr>
                        
                         <td><a href="Admin.jsp?page=A_FAQForm.jsp?edit=<%=rs.getString("faq_id")%>"><i class="fa fa-pen"></i></a></td>
                        <td><a href="Admin.jsp?page=A_FAQList.jsp?Delete=<%=rs.getString("faq_id")%>" onclick="return confirm('Are you sure you want to delete data?')"><i class="fa fa-trash"></i></a></td>
                        <td><%=rs.getInt(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        
                    </tr>
                  
                    <%
                    }
                    %>
                    
                </table>
            </div>
        </div>
        
        
        
    </body>
</html>


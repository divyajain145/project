<%-- 
    Document   : add_prac
    Created on : May 17, 2020, 9:14:43 AM
    Author     : divya
--%>

<%@page import="java.sql.*"%>
<%@page import="dbConnection.practical_method" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : A_EmployeeForm
    Created on : Nov 1, 2018, 8:37:39 AM
    Author     : Trojan
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .clearfix{
                margin-left: 50px;
                margin-right: 50px;   
            }
            .card{
                margin-left: 10px;
                margin-right: 10px;
            }
            .margin{
                margin-left: 10px;
                margin-right: 10px;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int user_id = (Integer)session.getAttribute("user");
            if(request.getParameter("btn1")!=null){
                practical_method pm = new practical_method();
                String title=request.getParameter("title");
                int hours=Integer.parseInt(request.getParameter("hours"));
                int clo=Integer.parseInt(request.getParameter("clo"));
                int val=0;
                int status=Integer.parseInt(request.getParameter("dropStatus"));
                val=pm.practical_insert(user_id, title, hours, clo,status);
                if(val>0){
                    out.print("<script>window.location.href='list_of_prac.jsp';</script>");
                }
            }
        %>
        <form action="add_prac.jsp" method="post">
              <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="list_of_prac.jsp">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Practicals</li>
            </ol>

            <!-- Page Content -->
            <h4 class="clearfix">
                Add Practical
                <a href="list_of_prac.jsp" class="btn btn-primary float-right"><i class="fa fa-angle-left"></i> Back</a>
            </h4>
            <hr>
            <div class="card">
                <div class="card-header">
                    Add Practical
                </div>

                <div class="row">
                    <div class="col-12 form-group">
                        <label style="margin-left:10px;" for="txtTech">Practical title</label>
                        <div class="margin">
                            <input type="text" class="form-control" name="title" id="pass"  value="" placeholder="Enter title of practical">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 form-group">
                        <label style="margin-left:10px;" for="txtTech">Hours</label>
                        <div class="margin">
                            <input type="number" class="form-control" name="hours" id="text1" value=""  placeholder="Enter required hours">  
                        </div>
                    </div>

                    <div class="col-6 form-group">
                        <label style="margin-left:10px;" for="txtTech">CLO</label>
                        <div class="margin">
                            <input type="number" class="form-control" name="clo" id="text2" value=""   placeholder="Enter clo">
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-6 form-group">
                        <label style="margin-left:10px;" for="txtTech">Status</label>
                        <div class="margin">
                            <select class="form-control" id="dropStatus" name="dropStatus">
                                <option  value="0">pending</option>
                                <option  value="1">Complete</option>
                        </select>
                           </div>
                    </div>
                </div>

                <div class="card-footer">
                    <input type="submit" name="btn1" id="btn1" value="Save" class="btn btn-success btn-lg" />
                </div>
            </div>
        </form>
    </body>
</html>


<%-- 
    Document   : add_prac
    Created on : May 17, 2020, 9:14:43 AM
    Author     : divya
--%>

<%@page import="java.sql.*"%>
<%@page import="dbConnection.lesson_method" %>
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
            String topic1 = "";
            int hours1 = 0, clo1 = 0, status1 = 0,lesson_id=0;
            int user_id = (Integer) session.getAttribute("user");
                
                lesson_id = Integer.parseInt(request.getParameter("edit"));
                lesson_method lm1 = new lesson_method();
                ResultSet rs = lm1.lesson_select1(lesson_id);
                while (rs.next()) {
                    topic1 = rs.getString("topic");
                    hours1 = rs.getInt("hours");
                    clo1 = rs.getInt("clo");
                    status1 = rs.getInt("status");
                }

            if (request.getParameter("btn1") != null) {
                lesson_method lm = new lesson_method();
                String topic = request.getParameter("topic");
                int hours = Integer.parseInt(request.getParameter("hours"));
                int clo = Integer.parseInt(request.getParameter("clo"));
                int val = 0;
                int status = Integer.parseInt(request.getParameter("dropStatus"));
                val = lm.lesson_Update(lesson_id, topic, hours, clo, status);
                if (val > 0) {
                    out.print("<script>window.location.href='lesson_planning.jsp';</script>");
                }
            }
            
        %>

        <form action="edit_lesson.jsp?edit=<%=lesson_id%>"" method="post">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="lesson_planning.jsp">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">lesson planning</li>
            </ol>

            <!-- Page Content -->
            <h4 class="clearfix">
                Add lesson
                <a href="lesson_planning.jsp" class="btn btn-primary float-right"><i class="fa fa-angle-left"></i> Back</a>
            </h4>
            <hr>
            <div class="card">
                <div class="card-header">
                    Add Lesson
                </div>

                <div class="row">
                    <div class="col-12 form-group">
                        <label style="margin-left:10px;" value="" for="txtTech">Topic</label>
                        <div class="margin">
                            <input type="text" class="form-control" name="topic" id="topic"  value="<%=topic1%>" placeholder="Enter topic">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 form-group">
                        <label style="margin-left:10px;" value="" for="txtTech">Hours</label>
                        <div class="margin">
                            <input type="number" class="form-control" name="hours" id="hours" value="<%=hours1%>"  placeholder="Enter required hours">  
                        </div>
                    </div>

                    <div class="col-6 form-group">
                        <label style="margin-left:10px;" value="" for="txtTech">CLO</label>
                        <div class="margin">
                            <input type="number" class="form-control" name="clo" id="clo" value="<%=clo1%>"   placeholder="Enter CLO">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 form-group">
                        <label style="margin-left:10px;" for="txtTech">Status</label>
                        <div class="margin">
                            <select class="form-control" id="dropStatus" name="dropStatus">
                                    <option <% if (status1 == 0) {
                                        out.print("selected");
                                    }%> value="0">Pending</option>
                                    <option <%if (status1 == 1) {
                                        out.print("selected");
                                    }%> value="1">Complete</option>
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


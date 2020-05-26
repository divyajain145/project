<%-- 
    Document   : home
    Created on : May 16, 2020, 8:09:22 PM
    Author     : divya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.practical_method" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                margin:0px;
            }
            .button{
                width:100%;
                text-align:left;
                background-color:inherit;
                color:inherit;
                padding:8px 16px;
            }
            .bar{
                width:100%;
                overflow:hidden;

            }
            .bar-item{
                padding:8px 16px;
                float:left;
                background-color:inherit;
                color:inherit;
                width:auto;
                border:none;
                outline:none;
                display:block
            }
            .black{
                color:#fff!important;
                background-color:#000!important
            }
            .center{
                display:block;
                text-align: center;
            }
            .float-r{
                float:right;
                margin-right: 50px;
            }
            .left{
                width:40%;
                background-color: red;
                height:100%;
                float:left;
                overflow: hidden;
            }
            .right{
                width: 50%;
                float : right;
            }
            .clearfix{
                margin-left: 50px;
                margin-right: 50px;   
            }
            .card{
                margin-left: 20px;
                margin-right: 20px;
            }
        </style>
    </head>
    <body>
        <%
            int user_id = (Integer) session.getAttribute("user");
            if(request.getParameter("Delete") != null)
        {
        int practical_id = Integer.parseInt(request.getParameter("Delete"));
        practical_method pm = new practical_method();        
        int val = pm.practical_delete(practical_id);
        if(val>0)
        {
         out.print("<script>alert('successfully deleted');window.location.href='list_of_prac.jsp';</script>");
        }
        }
        %>
        <!-- Navigation -->

        <nav class="bar black">
            <div class="center">
                <a href="lesson_planning.jsp" class="button bar-item">Lesson Planning</a>
                <a href="#" class="button bar-item">List of Practical</a>
            </div>
            <div class="float-r">
                <a href="logout.jsp" data-uk-modal class="button bar-item">Logout</a>
            </div>
        </nav>
        <br>


        <h4 class="clearfix">
            Practicals
            <a href="add_prac.jsp" class="btn btn-primary float-right">Add</a>
        </h4>
        <hr>
        <div class="card">
            <div class="card-header">
                Practical List
            </div>
            <div class="card-body table-responsive">
                <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 80px;">Edit</th>
                        <th style="width: 80px;">Delete</th>
                        <th style="width: 120px;">Practical No.</th>
                        <th>Practical Title</th>
                        <th style="width: 80px;">Hours</th>
                        <th style="width: 80px;">CLO</th>
                        <th style="width: 80px;">Status</th>
                    </tr>
                    <%
                        practical_method pm1 = new practical_method();
                        ResultSet rs = pm1.practical_select(user_id);
                        int i = 0;
                        String status="";
                       
                            while (rs.next()) {
                                i++;
                    %>
                    <tr>
                        <td><a href="edit_practical.jsp?edit=<%=rs.getString("practical_id")%>" >Edit</a></td>
                       
                        <td><a href="list_of_prac.jsp?Delete=<%=rs.getString("practical_id")%>" onclick="return confirm('Are you sure you want to delete data?')">Delete</a></td>
                        <td><%out.print(i);%></td>
                        <td><%=rs.getString("title")%></td>
                        <td><%=rs.getInt("hours")%></td>
                        <td><%=rs.getInt("clo")%></td>
                        <%
                            if((rs.getInt("status"))==0){
                                status="pending";
                            }
                            else{
                                status="complete";
                            }
                        %>
                        <td><%out.print(status);%></td>
                    </tr>
                    <%
                        }

                    %>


                </table>
                
            </div>
        </div>


    </body>
</html>



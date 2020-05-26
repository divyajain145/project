<%-- 
    Document   : login
    Created on : May 16, 2020, 8:08:35 PM
    Author     : divya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.user_login_method"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            h2{
                text-align: center;
            }

            form {
                border: 3px solid #f1f1f1;
                width: 500px;
                display:inline-block;
            }

            input[type=text], input[type=password] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            .button {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            button:hover {
                opacity: 0.8;
            }

            .container {
                padding: 16px;   
            }
            .main{
                display: block;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            if (request.getParameter("btn1") != null) {
                user_login_method um = new user_login_method();
            String a = request.getParameter("username");
            String b = request.getParameter("password");
            
//                out.print("<script>alert(hello);</script>");
            ResultSet rs = um.client_loginClassSelect(a,b);
            
            if (rs.next()) {
                session.setAttribute("user", rs.getInt("user_id"));

//                String s1 = "Successfully login. ";
                out.print("<script>window.location.href='lesson_planning.jsp';</script>");
            } else {
                out.print("<script>alert('Incorrect username or password.Please check Your email or password.')</script>");
            }
            }
            if(request.getParameter("btn2")!=null){
                out.print("<script>window.location.href='signup.jsp';</script>");
            }
        %>

        <br>
        <br>

        <h2>Login Form</h2>
        <br>
        <div class="main">
            <form action="login.jsp" method="post">


                <div class="container">
                    <label for="uname"><b>Username</b></label>
                    <input type="text" id="username" name="username" placeholder="Enter Username" >

                    <label for="psw"><b>Password</b></label>
                    <input type="password" id="password" name="password" placeholder="Enter Password">

                    <input type="submit" value="Login" id="btn1" name="btn1" Class="button" Text="">

                    <input type="submit" value="Sign Up" id="btn2" name="btn2" Class="button" Text="">
                </div>

            </form>
            <div
                </body>
                </html>

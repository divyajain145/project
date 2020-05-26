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
                    int val = 0;
                    val = um.user_registration(request.getParameter("username"), request.getParameter("password"), request.getParameter("subject"));
                    if (val == 2) {
                        String a = "This " + request.getParameter("username") + " is Already Exist";
                        out.print("<script>alert('" + a + "');</script>");
                    } else {

                        out.print("<script>alert('Succesfully registered.');window.location.href='login.jsp';</script>");
                    }
                }
        %>

        <br>
        <br>

        <h2>Sign Up Form</h2>
        <br>
        <div class="main">
            <form action="signup.jsp" method="post">


                <div class="container">
                    <label for="uname"><b>Username</b></label>
                    <input type="text" id="username" name="username" placeholder="Enter Username">

                    <label for="psw"><b>Password</b></label>
                    <input type="password" id="password" name="password" placeholder="Enter Password">

                    <label for="psw"><b>Subject</b></label>
                    <input type="text" id="subject" name="subject" placeholder="Enter subject you are interested in">

                    <input type="submit" value="Sign Up" id="btn1" name="btn1" Class="button" Text="">
                </div>

            </form>
            <div
                </body>
                </html>

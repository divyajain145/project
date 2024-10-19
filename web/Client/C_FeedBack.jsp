<%-- 
    Document   : C_FeedBack
    Created on : Apr 3, 2019, 9:58:11 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.feedback_master" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                box-sizing: border-box;
            }

            input[type=text], select, textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }

            label {
                padding: 12px 12px 12px 0;
                display: inline-block;
            }

            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                float: right;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            .container {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }

            .col-25 {
                float: left;
                width: 25%;
                margin-top: 6px;
            }

            .col-75 {
                float: left;
                width: 75%;
                margin-top: 6px;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
            @media screen and (max-width: 600px) {
                .col-25, .col-75, input[type=submit] {
                    width: 100%;
                    margin-top: 0;
                }
            }
        </style>
    </head>
    <body>
        <%
            int user_id = Integer.parseInt(session.getAttribute("user").toString());
            if(request.getParameter("btn1")!=null){
                String name=request.getParameter("name");
                String msg=request.getParameter("message");
                feedback_master fm=new feedback_master();
                if(user_id!=0){
                    int val=fm.feedback_masterInsert(user_id, name, msg);
                    out.print("<script>alert('FeedBack successfully inserted');</script>");
                }
                else{
                    out.print("<script>alert('Please Login first');</script>");
                }
            }
        %>
        <div class="container">
            <form action="/action_page.php">
                <div class="row">
                    <div class="col-25">
                        <label for="sub">Name</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="name" name="name" placeholder="Your Name..">
                    </div>
                </div>

                <div class="row">
                    <div class="col-25">
                        <label for="subject">Message</label>
                    </div>
                    <div class="col-75">
                        <textarea id="message" name="message" placeholder="Write something.." style="height:100px"></textarea>
                    </div>
                </div>
                <div class="row">
                <div class="col-50">
                    <input id="btn1" name="btn1" type="submit" value="Submit"></div>
                </div>
            </form>
        </div>
    </body>
</html>

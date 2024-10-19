<%-- 
    Document   : A_HelpTicketReply
    Created on : Mar 22, 2019, 10:51:40 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        %>
        <div class="container">
            <form action="/action_page.php">
                <div class="row">
                    <div class="col-25">
                        <label for="sub">Subject</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="sub" name="sub" placeholder="Your Subject..">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="lname">Email</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="email" name="email" placeholder="Email">
                    </div>
                </div><div class="row">
                    <div class="col-25">
                        <label for="">Department</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="type" name="type" placeholder="Support Type">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="">Priority</label>
                    </div>
                    <div class="col-75">
                        <select name="priority" id="priority" >
                            <option value="">Priority</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="subject">Message</label>
                    </div>
                    <div class="col-75">
                        <textarea id="subject" name="subject" placeholder="Write something.." style="height:100px"></textarea>
                    </div>
                </div>

                <div class="row">
                    <div class="col-25">
                        <label for="subject">Select File</label>
                    </div>

                    <div class="col-25">
                        <input type="file" name="myFile" multiple><br><br>
                    </div>
                    <div class="col-50">
                        <input id="btn1" name="btn1" type="submit" value="Submit"></div>
                </div>

            </form>

        </div>
    </body>
</html>

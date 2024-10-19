<%-- 
    Document   : A_HelpTicketReply
    Created on : Mar 22, 2019, 10:51:40 AM
    Author     : Acer
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.support_ticket_master_method" %>
<%@page import="dbConnection.ticket_reply_master" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
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

            .chat {
                list-style: none;
                margin: 0;
                padding: 0;
            }

            .chat li {
                margin-bottom: 10px;
                padding-bottom: 5px;
                border-bottom: 1px dotted #B3A9A9;
            }

            .chat li.left .chat-body {
                margin-left: 60px;
            }

            .chat li.right .chat-body {
                margin-right: 60px;
            }


            .chat li .chat-body p {
                margin: 0;
                color: #777777;
            }

            .panel .slidedown .glyphicon, .chat .glyphicon {
                margin-right: 5px;
            }

            .panel-body.panel-chat {
                overflow-y: scroll;
                height: 250px;
            }

            .panel-chat::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
                background-color: #F5F5F5;
            }

            .panel-chat::-webkit-scrollbar {
                width: 12px;
                background-color: #F5F5F5;
            }

            .panel-chat::-webkit-scrollbar-thumb {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
                background-color: #555;
            }
        </style>

        <style>
            body{
                margin-top:20px;
                background:#eee;
            }
            .box {
                position: relative;
                border-radius: 3px;
                background: #ffffff;
                border-top: 3px solid #d2d6de;
                margin-bottom: 20px;
                width: 100%;
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            }
            .box.box-primary {
                border-top-color: #3c8dbc;
            }
            .box.box-info {
                border-top-color: #00c0ef;
            }
            .box.box-danger {
                border-top-color: #dd4b39;
            }
            .box.box-warning {
                border-top-color: #f39c12;
            }
            .box.box-success {
                border-top-color: #00a65a;
            }
            .box.box-default {
                border-top-color: #d2d6de;
            }
            .box.collapsed-box .box-body, .box.collapsed-box .box-footer {
                display: none;
            }
            .box .nav-stacked>li {
                border-bottom: 1px solid #f4f4f4;
                margin: 0;
            }
            .box .nav-stacked>li:last-of-type {
                border-bottom: none;
            }
            .box.height-control .box-body {
                max-height: 300px;
                overflow: auto;
            }
            .box .border-right {
                border-right: 1px solid #f4f4f4;
            }
            .box .border-left {
                border-left: 1px solid #f4f4f4;
            }
            .box.box-solid {
                border-top: 0;
            }
            .box.box-solid>.box-header .btn.btn-default {
                background: transparent;
            }
            .box.box-solid>.box-header .btn:hover, .box.box-solid>.box-header a:hover {
                background: rgba(0, 0, 0, 0.1);
            }
            .box.box-solid.box-default {
                border: 1px solid #d2d6de;
            }
            .box.box-solid.box-default>.box-header {
                color: #444;
                background: #d2d6de;
                background-color: #d2d6de;
            }
            .box.box-solid.box-default>.box-header a, .box.box-solid.box-default>.box-header .btn {
                color: #444;
            }
            .box.box-solid.box-primary {
                border: 1px solid #3c8dbc;
            }
            .box.box-solid.box-primary>.box-header {
                color: #fff;
                background: #3c8dbc;
                background-color: #3c8dbc;
            }
            .box.box-solid.box-primary>.box-header a, .box.box-solid.box-primary>.box-header .btn {
                color: #fff;
            }
            .box.box-solid.box-info {
                border: 1px solid #00c0ef;
            }
            .box.box-solid.box-info>.box-header {
                color: #fff;
                background: #00c0ef;
                background-color: #00c0ef;
            }
            .box.box-solid.box-info>.box-header a, .box.box-solid.box-info>.box-header .btn {
                color: #fff;
            }
            .box.box-solid.box-danger {
                border: 1px solid #dd4b39;
            }
            .box.box-solid.box-danger>.box-header {
                color: #fff;
                background: #dd4b39;
                background-color: #dd4b39;
            }
            .box.box-solid.box-danger>.box-header a, .box.box-solid.box-danger>.box-header .btn {
                color: #fff;
            }
            .box.box-solid.box-warning {
                border: 1px solid #f39c12;
            }
            .box.box-solid.box-warning>.box-header {
                color: #fff;
                background: #f39c12;
                background-color: #f39c12;
            }
            .box.box-solid.box-warning>.box-header a, .box.box-solid.box-warning>.box-header .btn {
                color: #fff;
            }
            .box.box-solid.box-success {
                border: 1px solid #00a65a;
            }
            .box.box-solid.box-success>.box-header {
                color: #fff;
                background: #00a65a;
                background-color: #00a65a;
            }
            .box.box-solid.box-success>.box-header a, .box.box-solid.box-success>.box-header .btn {
                color: #fff;
            }
            .box.box-solid>.box-header>.box-tools .btn {
                border: 0;
                box-shadow: none;
            }
            .box.box-solid[class*='bg']>.box-header {
                color: #fff;
            }
            .box .box-group>.box {
                margin-bottom: 5px;
            }
            .box .knob-label {
                text-align: center;
                color: #333;
                font-weight: 100;
                font-size: 12px;
                margin-bottom: 0.3em;
            }
            .box>.overlay, .overlay-wrapper>.overlay, .box>.loading-img, .overlay-wrapper>.loading-img {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%}
            .box .overlay, .overlay-wrapper .overlay {
                z-index: 50;
                background: rgba(255, 255, 255, 0.7);
                border-radius: 3px;
            }
            .box .overlay>.fa, .overlay-wrapper .overlay>.fa {
                position: absolute;
                top: 50%;
                left: 50%;
                margin-left: -15px;
                margin-top: -15px;
                color: #000;
                font-size: 30px;
            }
            .box .overlay.dark, .overlay-wrapper .overlay.dark {
                background: rgba(0, 0, 0, 0.5);
            }
            .box-header:before, .box-body:before, .box-footer:before, .box-header:after, .box-body:after, .box-footer:after {
                content: " ";
                display: table;
            }
            .box-header:after, .box-body:after, .box-footer:after {
                clear: both;
            }
            .box-header {
                color: #444;
                display: block;
                padding: 10px;
                position: relative;
            }
            .box-header.with-border {
                border-bottom: 1px solid #f4f4f4;
            }
            .collapsed-box .box-header.with-border {
                border-bottom: none;
            }
            .box-header>.fa, .box-header>.glyphicon, .box-header>.ion, .box-header .box-title {
                display: inline-block;
                font-size: 18px;
                margin: 0;
                line-height: 1;
            }
            .box-header>.fa, .box-header>.glyphicon, .box-header>.ion {
                margin-right: 5px;
            }
            .box-header>.box-tools {
                position: absolute;
                right: 10px;
                top: 5px;
            }
            .box-header>.box-tools [data-toggle="tooltip"] {
                position: relative;
            }
            .box-header>.box-tools.pull-right .dropdown-menu {
                right: 0;
                left: auto;
            }
            .btn-box-tool {
                padding: 5px;
                font-size: 12px;
                background: transparent;
                color: #97a0b3;
            }
            .open .btn-box-tool, .btn-box-tool:hover {
                color: #606c84;
            }
            .btn-box-tool.btn:active {
                box-shadow: none;
            }
            .box-body {
                border-top-left-radius: 0;
                border-top-right-radius: 0;
                border-bottom-right-radius: 3px;
                border-bottom-left-radius: 3px;
                padding: 10px;
            }
            .no-header .box-body {
                border-top-right-radius: 3px;
                border-top-left-radius: 3px;
            }
            .box-body>.table {
                margin-bottom: 0;
            }
            .box-body .fc {
                margin-top: 5px;
            }
            .box-body .full-width-chart {
                margin: -19px;
            }
            .box-body.no-padding .full-width-chart {
                margin: -9px;
            }
            .box-body .box-pane {
                border-top-left-radius: 0;
                border-top-right-radius: 0;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 3px;
            }
            .box-body .box-pane-right {
                border-top-left-radius: 0;
                border-top-right-radius: 0;
                border-bottom-right-radius: 3px;
                border-bottom-left-radius: 0;
            }
            .box-footer {
                border-top-left-radius: 0;
                border-top-right-radius: 0;
                border-bottom-right-radius: 3px;
                border-bottom-left-radius: 3px;
                border-top: 1px solid #f4f4f4;
                padding: 10px;
                background-color: #fff;
            }
            .direct-chat .box-body {
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
                position: relative;
                overflow-x: hidden;
                padding: 0;
            }
            .direct-chat.chat-pane-open .direct-chat-contacts {
                -webkit-transform: translate(0,  0);
                -ms-transform: translate(0,  0);
                -o-transform: translate(0,  0);
                transform: translate(0,  0);
            }
            .direct-chat-messages {
                -webkit-transform: translate(0,  0);
                -ms-transform: translate(0,  0);
                -o-transform: translate(0,  0);
                transform: translate(0,  0);
                padding: 10px;
                height: 250px;
                overflow: auto;
            }
            .direct-chat-msg, .direct-chat-text {
                display: block;
            }
            .direct-chat-msg {
                margin-bottom: 10px;
            }
            .direct-chat-msg:before, .direct-chat-msg:after {
                content: " ";
                display: table;
            }
            .direct-chat-msg:after {
                clear: both;
            }
            .direct-chat-messages, .direct-chat-contacts {
                -webkit-transition: -webkit-transform .5s ease-in-out;
                -moz-transition: -moz-transform .5s ease-in-out;
                -o-transition: -o-transform .5s ease-in-out;
                transition: transform .5s ease-in-out;
            }
            .direct-chat-text {
                border-radius: 5px;
                position: relative;
                padding: 5px 10px;
                background: #d2d6de;
                border: 1px solid #d2d6de;
                margin: 5px 0 0 50px;
                color: #444;
            }
            .direct-chat-text:after, .direct-chat-text:before {
                position: absolute;
                right: 100%;
                top: 15px;
                border: solid transparent;
                border-right-color: #d2d6de;
                content: ' ';
                height: 0;
                width: 0;
                pointer-events: none;
            }
            .direct-chat-text:after {
                border-width: 5px;
                margin-top: -5px;
            }
            .direct-chat-text:before {
                border-width: 6px;
                margin-top: -6px;
            }
            .right .direct-chat-text {
                margin-right: 50px;
                margin-left: 0;
            }
            .right .direct-chat-text:after, .right .direct-chat-text:before {
                right: auto;
                left: 100%;
                border-right-color: transparent;
                border-left-color: #d2d6de;
            }
            .direct-chat-img {
                border-radius: 50%;
                float: left;
                width: 40px;
                height: 40px;
            }
            .right .direct-chat-img {
                float: right;
            }
            .direct-chat-info {
                display: block;
                margin-bottom: 2px;
                font-size: 12px;
            }
            .direct-chat-name {
                font-weight: 600;
            }
            .direct-chat-timestamp {
                color: #999;
            }
            .direct-chat-contacts-open .direct-chat-contacts {
                -webkit-transform: translate(0,  0);
                -ms-transform: translate(0,  0);
                -o-transform: translate(0,  0);
                transform: translate(0,  0);
            }
            .direct-chat-contacts {
                -webkit-transform: translate(101%,  0);
                -ms-transform: translate(101%,  0);
                -o-transform: translate(101%,  0);
                transform: translate(101%,  0);
                position: absolute;
                top: 0;
                bottom: 0;
                height: 250px;
                width: 100%;
                background: #222d32;
                color: #fff;
                overflow: auto;
            }
            .contacts-list>li {
                border-bottom: 1px solid rgba(0, 0, 0, 0.2);
                padding: 10px;
                margin: 0;
            }
            .contacts-list>li:before, .contacts-list>li:after {
                content: " ";
                display: table;
            }
            .contacts-list>li:after {
                clear: both;
            }
            .contacts-list>li:last-of-type {
                border-bottom: none;
            }
            .contacts-list-img {
                border-radius: 50%;
                width: 40px;
                float: left;
            }
            .contacts-list-info {
                margin-left: 45px;
                color: #fff;
            }
            .contacts-list-name, .contacts-list-status {
                display: block;
            }
            .contacts-list-name {
                font-weight: 600;
            }
            .contacts-list-status {
                font-size: 12px;
            }
            .contacts-list-date {
                color: #aaa;
                font-weight: normal;
            }
            .contacts-list-msg {
                color: #999;
            }
            .direct-chat-danger .right>.direct-chat-text {
                background: #dd4b39;
                border-color: #dd4b39;
                color: #fff;
            }
            .direct-chat-danger .right>.direct-chat-text:after, .direct-chat-danger .right>.direct-chat-text:before {
                border-left-color: #dd4b39;
            }
            .direct-chat-primary .right>.direct-chat-text {
                background: #3c8dbc;
                border-color: #3c8dbc;
                color: #fff;
            }
            .direct-chat-primary .right>.direct-chat-text:after, .direct-chat-primary .right>.direct-chat-text:before {
                border-left-color: #3c8dbc;
            }
            .direct-chat-warning .right>.direct-chat-text {
                background: #f39c12;
                border-color: #f39c12;
                color: #fff;
            }
            .direct-chat-warning .right>.direct-chat-text:after, .direct-chat-warning .right>.direct-chat-text:before {
                border-left-color: #f39c12;
            }
            .direct-chat-info .right>.direct-chat-text {
                background: #00c0ef;
                border-color: #00c0ef;
                color: #fff;
            }
            .direct-chat-info .right>.direct-chat-text:after, .direct-chat-info .right>.direct-chat-text:before {
                border-left-color: #00c0ef;
            }
            .direct-chat-success .right>.direct-chat-text {
                background: #00a65a;
                border-color: #00a65a;
                color: #fff;
            }
            .direct-chat-success .right>.direct-chat-text:after, .direct-chat-success .right>.direct-chat-text:before {
                border-left-color: #00a65a;
            }
        </style>
    </head>
    <body>
        <%
            int ticket_id = 0, user_id = 0;
            if (request.getParameter("ticket_id") != null) {
                ticket_id = Integer.parseInt(request.getParameter("ticket_id"));
            }

            if (request.getParameter("send") != null) {
                support_ticket_master_method st = new support_ticket_master_method();
                ResultSet rs = st.support_ticket_masterClassSelect2(ticket_id);
                if (rs.next()) {
                    user_id = rs.getInt("User_Id");
                }
                ticket_reply_master tm = new ticket_reply_master();
                int sender_id = 0;
                String msg = request.getParameter("message");
                int val = tm.ticket_reply_master_ClassInsert(ticket_id, sender_id, user_id, msg);
                if (val > 0) {
                    out.print("<script>alert('successfully reply sent');window.location.href='Admin.jsp?page=A_HelpTicketReply.jsp&ticket_id=" + request.getParameter("ticket_id") + "';</script>");

                }

            }
            support_ticket_master_method st = new support_ticket_master_method();
            ResultSet rs = st.support_ticket_masterClassSelect2(ticket_id);
            if (rs.next()) {

        %>
        <div class="container">
            <div class="row">
                <div class="col-25">
                    <label for="sub">Subject</label>
                </div>
                <div class="col-75">
                    <input type="text" id="sub" name="sub" value="<%=rs.getString("Subject")%>" disabled>
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="lname">Email</label>
                </div>
                <div class="col-75">
                    <input type="text" id="email" name="email" value="<%=rs.getString("Email")%>" disabled>
                </div>
            </div><div class="row">
                <div class="col-25">
                    <label for="">Department</label>
                </div>
                <div class="col-75">
                    <input type="text" id="type" name="type" value="<%=rs.getString("Support_Type")%>" disabled>
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="">Priority</label>
                </div>
                <div class="col-75">

                    <input type="text" id="type" name="type" value="<%=rs.getString("Priority")%>" disabled>
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="subject">Message</label>
                </div>
                <div class="col-75">
                    <textarea style="height:100px" id="subject" name="subject" disabled><%=rs.getString("Message")%></textarea>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <div class="row bootstrap snippets ">
            <div class="col-md-6" style="margin-top: 50px; margin-left: auto; margin-right: auto;">
                <!-- DIRECT CHAT PRIMARY -->
                <div class="box box-primary direct-chat direct-chat-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Direct Chat</h3>

                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <!-- Conversations are loaded here -->

                        <div class="direct-chat-messages">
                            <!-- Message. Default to the left -->
                            <%
                                support_ticket_master_method sm = new support_ticket_master_method();
                                ResultSet rs1 = sm.support_ticket_masterClassSelect2(ticket_id);
                                if (rs1.next()) {
                            %>
                            <div class="direct-chat-msg">

                                <!-- /.direct-chat-info -->
                                <img class="direct-chat-img" src="https://bootdey.com/img/Content/user_1.jpg" alt="Message User Image"><!-- /.direct-chat-img -->
                                <div class="direct-chat-text">
                                    <%=rs1.getString("Message")%>
                                </div>
                                <!-- /.direct-chat-text -->
                            </div>
                            <%
                                }
                            %>
                            <!-- /.direct-chat-msg -->

                            <!-- Message to the right -->
                            <%
                                ticket_reply_master tm = new ticket_reply_master();
                                ResultSet rs2 = tm.ticket_reply_masterClassSelect(ticket_id);
                                while (rs2.next()) {
                                    if (rs2.getInt("Sender_Id") == 0) {
                            %>
                            <div class="direct-chat-msg right">

                                <!-- /.direct-chat-info -->
                                <img class="direct-chat-img" src="https://bootdey.com/img/Content/user_2.jpg" alt="Message User Image"><!-- /.direct-chat-img -->
                                <div class="direct-chat-text">
                                    <%=rs2.getString("Message")%>
                                </div>
                                <!-- /.direct-chat-text -->
                            </div>
                            <%
                            } else {
                            %>
                            <div class="direct-chat-msg">

                                <!-- /.direct-chat-info -->
                                <img class="direct-chat-img" src="https://bootdey.com/img/Content/user_1.jpg" alt="Message User Image"><!-- /.direct-chat-img -->
                                <div class="direct-chat-text">
                                    <%=rs2.getString("Message")%>
                                </div>
                                <!-- /.direct-chat-text -->
                            </div>
                            <%
                                    }
                                }
                            %>
                            <!-- /.direct-chat-msg -->
                        </div>
                        <!--/.direct-chat-messages-->

                        <!-- Contacts are loaded here -->

                        <!-- /.direct-chat-pane -->
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <div action="#" method="post">
                            <div class="input-group">
                                <input type="text" name="message" id="message" placeholder="Type Message ..." class="form-control">
                                <span class="input-group-btn">
                                    <input type="submit" name="send" id="send" class="btn btn-primary btn-flat" value="Send"/>
                                </span>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-footer-->
                </div>
                <!--/.direct-chat -->
            </div>

        </div>

        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    </body>
</html>

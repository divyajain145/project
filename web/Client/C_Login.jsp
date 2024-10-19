<%-- 
    Document   : C_Login.jsp
    Created on : 14 Apr, 2019, 9:51:04 AM
    Author     : BRIGHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.client_login_method"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("btn1") != null) {

            client_login_method lm = new client_login_method();
            String a = request.getParameter("Textnewemail");
            String b = request.getParameter("Textnewpassword");
            ResultSet rs = lm.client_loginClassSelect(request.getParameter("Textnewemail"), request.getParameter("Textnewpassword"));
            if (rs.next()) {
                session.setAttribute("user", rs.getInt("Reg_Id"));

                String s1 = "Successfully login. ";
                out.print("<script>alert('" + s1 + "');window.location.href='Client.jsp?page=C_Master.jsp?page1=C_Dashboard.jsp';</script>");
            } else {
                out.print("<script>alert('Incorrect email or password.Please check Your email or password.')</script>");
            }
        }

    %>
        <div style="margin: auto; width: 50%">
            <div id="signin-account" class="uk-form">

                <legend style="text-align: center">Login</legend>

                <div class="uk-container uk-container-center">
                    <div id="" class="uk-form">
                        <fieldset>
                           

                            <div class="uk-form-icon">
                                <label><i class="uk-icon-envelope"></i>&nbsp;Email
                                    <input type="email" id="Textnewemail" name="Textnewemail" Style="display: block; width: 100%; padding-left: 38px!important; height: 44px; margin-bottom: 20px; padding: 4px 12px;">
                                </label>

                            </div>
                            <div class="uk-form-icon">

                                <label>
                                    <i class="uk-icon-key"></i>&nbsp;Password
                                    <input type="password" id="Textnewpassword" name="Textnewpassword" Style="display: block; width: 100%; padding-left: 38px!important; height: 44px; margin-bottom: 20px; padding: 4px 12px;">

                                </label>
                            </div>
                           <input type="submit" value="Login" id="btn1" name="btn1" Class="uk-button uk-button-large idz-button blue uk-width-large-1-1+" Text="Create account" OnClick="Button2_Click">

                                    </fieldset>
                                    </div>
                                    </div>
                                    </div>
                                    </div>

                                    <script src="jquery.js" type="text/javascript"></script>

                                    <script type="text/javascript">

    </body>
</html>

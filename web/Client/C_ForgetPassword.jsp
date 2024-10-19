<%-- 
    Document   : C_ForgetPassword
    Created on : Dec 12, 2018, 2:39:52 PM
    Author     : Trojan
--%>
<%@page import="dbconnection_client.client_OTP_method"%>
<%@page import="java.util.Random"%>
<%@page import="dbconnection_client.Mailer" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("btnSend") != null) {
                String Email = request.getParameter("TxtEmail");
                String Subject = "Verification OTP";
                client_OTP_method cm = new client_OTP_method();
                String Message = cm.generate_otp();
                if(Mailer.send("cksolutioninfo@gmail.com", "12345678@$$", Email, Subject, Message)) {
                     session.setAttribute("V_OTP", Message);
                     session.setAttribute("eml",Email);
                    out.print("<script>alert('Succesfully OTP sent.');window.location.href='Client.jsp?page=C_Verification.jsp';</script>");
                } else {
                    out.print("<script>alert('Something Wrong.')</script>");
                }
            }
        %>
        <div style="margin: auto; width: 50%">

            <div id="signin-account" class="uk-form">
                <fieldset>
                    <legend>Forgot Password?</legend>
                    <div class="uk-form-icon">
                        <label><i class="uk-icon-envelope"></i>&nbsp;Email<input type="email" name="TxtEmail" id="TxtEmail"></label>
                    </div>
                    <input type="submit" id="btnSend" name="btnSend" Class="uk-button uk-button-large idz-button blue uk-width-large-1-1"  Text="Submit"  />
                </fieldset>
            </div>
        </div>
    </body>
</html>

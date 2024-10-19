<%-- 
    Document   : C_ChangePassword
    Created on : 17 Dec, 2018, 2:52:01 PM
    Author     : BRIGHT
--%>
<%@page import="dbConnection.Client_Change_Password"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         if(request.getParameter("Button4") != null)
         {
         String a = request.getParameter("text1");
         String b = request.getParameter("text2");
         if(a.equals(b))
         {
             Client_Change_Password cm = new Client_Change_Password();
             cm.change_passwordClassUpdate(b, session.getAttribute("eml").toString());
             session.invalidate();
             out.print("<script>alert('successfully change password');window.location.href='Client.jsp';</script>");           
         }
         else
         {
         out.print("<script>alert('Please enter same password');</script>");
         }
         }
         
        %>
         <div style="margin: auto; width: 50%">

        <div id="signin-account" class="uk-form">
            <fieldset>
                <legend>Change Password</legend>
               
                <div class="uk-form-icon">
                    <label>
                        New Password
                    </label>
                    <input type="text" id="Textcurrentps" placeholder="Please enter new password" name="text1" >
                    
                </div>
                <div class="uk-form-icon">
                    <label>
                        Confirm Password
                        
                    </label>
                    <input type="text" id="Textconfirmps" placeholder="Re-enter new password" name="text2" >
                    

                </div>


                <input type="submit" id="Button4" name="Button4" class="uk-button uk-button-large idz-button blue uk-width-large-1-1"  value="Change Password" />
            </fieldset>
        </div>
    </div>


    </body>
</html>

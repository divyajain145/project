<%-- 
    Document   : C_Contact
    Created on : 10 Dec, 2018, 2:21:14 PM
    Author     : BRIGHT
--%>
<%@page import="dbconnection_client.Mailer" %>
<%@page import="dbConnection.Client_contact_method"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("btn8") != null) {
                Client_contact_method ci = new Client_contact_method();
                int val = 0;
                String Email = request.getParameter("email");
                String Subject = "Contacted Us";
                String Message = "We will contact you as soon as possible";
                String msg = "this person has tried to contacted you    " + Email;
                
              
                if (Mailer.send("cksolutioninfo@gmail.com", "12345678@$$", Email, Subject, Message)) {
                    
                   if ((Mailer.send("cksolutioninfo@gmail.com", "12345678@$$", "divyashah667@gmail.com", Subject, msg))) {
                        val = ci.contact_ClassInsert(request.getParameter("name"), request.getParameter("email"), request.getParameter("mobile"), request.getParameter("sub"), request.getParameter("message"));
                       if (val > 0) {
                            out.print("<script>alert('Succesfully Store Your Data.')</script>");
                      }
                    }
                }
                else{
                    out.print("<script>alert('Something Wrong.')</script>");
                }
            }
        %>

        <section id="idz-header-contact">
            <div id="idz-gmap"></div>
            <div class="idz-color-overlay"></div>

            <div class="idz-contact-overlay idz-padding-medium">
                <div class="uk-container uk-container-center">

                    <div class="uk-grid" data-uk-margin="">

                        <div class="uk-width-medium-1-1">
                            <h1 class="uk-text-contrast uppercase uk-margin-large-bottom">Meet Us</h1>
                        </div>

                        <div class="uk-width-medium-1-2 uk-margin-large-bottom uk-margin-small-top">
                            <div class="idz-contact-box">
                                <p class="idz-text-22px uk-text-contrast uk-margin-remove idz-margin-bottom-tiny">J-panel</p>
                                
                                <a href="tel:9033387254" style="text-decoration: none;"> <span class="idz-text-block">9033387254</span></a>
                                <a href="mailto:http://jpanel84@gmail.com"> <span class="idz-text-block">jpanel84@gmail.com</span></a>
                            </div>
                        </div>
                        <div class="uk-width-medium-1-1 uk-margin-small-top">
                            <p class="idz-text-18px uk-text-contrast">J-panel Hosting customer support is available free of charge. Connection charges can vary when calling from outside the area, abroad or from a mobile phone, depending on your specific phone plan.</p>
                        </div>

                    </div>

                </div>
            </div>
        </section>
        <section class="idz-padding">
            <div class="uk-container uk-container-center">
                <div class="uk-grid">

                    <div class="uk-width-large-1-2 uk-width-medium-1-1 uk-container-center">

                        <h1>Get in Touch</h1>
                        <p class="idz-text-18px idz-text-blue">For <strong>Billing</strong> or <strong>Support</strong> inquiries, please log in to the Customer Portal and use the "support" tab.</p>


                        <div id="contact-form-wrapper">
                            <div class="uk-form" id="signin-account">
                                <form>
                                    <div class="uk-form-icon">
                                        <label><i class="uk-icon-user"></i>&nbsp;Name <em class="required">*</em>
                                            <input type="text" id="name" name="name" class="textfield"></label>

                                    </div>
                                    <%--<input name="name" class="textfield" id="name" type="text" value="">--%>
                                    <div class="uk-form-icon">
                                        <label><i class="uk-icon-envelope"></i>&nbsp;E-mail <em class="required">*</em></label>
                                        <input type="email" id="email" name="email" class="textfield">
                                    </div>
                                    <%--  <input name="email" class="textfield" id="email" type="email" value="">--%>
                                    <div class="uk-form-icon">
                                        <label><i class="uk-icon-mobile"></i>&nbsp;Mobile No.<em class="required">*</em></label>
                                        <input type="text" id="mobile" name="mobile" class="textfield">
                                    </div>
                                    <%--  <input name="MobileNo" class="textfield" id="mobileno" type="text" value="">--%>
                                    <div class="uk-form-icon">
                                        <label><i class="uk-icon-question-circle"></i>&nbsp;Subject <em class="required">*</em></label>
                                        <input type="text" id="sub" name="sub" class="textfield">
                                    </div>
                                    <%-- <input name="subject" class="textfield" id="subject" type="text" value="">--%>
                                    <div class="uk-form-icon">
                                        <label><i class="uk-icon-envelope-square"></i>&nbsp;Message <em class="required">*</em></label>
                                        <textarea rows="6" cols="2" name="message" id="message" class="textfield">
                                        </textarea></div>
                                        <%-- <textarea name="message" class="textarea" id="message" rows="6" cols="2"></textarea>--%>
                                    <label>&nbsp;</label>
                                    <%-- <button name="submit" class="uk-button idz-button blue uk-align-right" id="buttonsend" type="submit" >Submit</button>--%>
                                    <input type="submit" name="btn8" id="btn8" value="Submit" class="uk-button idz-button blue uk-align-right" >

                                    <span class="loading" style="display: none;">Please wait..</span>
                                </form>
                            </div>
                        </div>

                    </div>



                </div>
            </div>
        </section>

    </body>
</html>

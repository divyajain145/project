<%-- 
    Document   : C_Verification
    Created on : 17 Dec, 2018, 1:52:02 PM
    Author     : bharat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String otp = "";
            if (request.getParameter("btn5") != null) {
                otp = request.getParameter("TextBox1") + request.getParameter("TextBox2") + request.getParameter("TextBox3") + request.getParameter("TextBox4");
                if (session.getAttribute("V_OTP").equals(otp)) {
                    out.print("<script>window.location.href='Client.jsp?page=C_ChangePassword.jsp';</script>");
                } 
                else{
                out.print("Incorrect otp");
                }
            }
        %>
        <div style="margin: auto; width: 50%">

            <div id="verify-account" class="uk-form">
                <form method="POST" action="C_Verification.jsp">
                    <label>Verify OTP</label>
                    <div class="uk-form-icon">
                        <div class="uk-grid">
                            <div class="uk-width-1-4 ">
                                <input type="text" name="TextBox1" id="TextBox1" MaxLength="1" class="uk-text-center" />
                            </div>

                            <div class="uk-width-1-4 ">
                                <input type="text" name="TextBox2" id="TextBox2" MaxLength="1" class="uk-text-center"/>
                            </div>

                            <div class="uk-width-1-4">
                                <input type="text" name="TextBox3" id="TextBox3" MaxLength="1" class="uk-text-center" />
                            </div>
                            <div class="uk-width-1-4 ">
                                <input type="text" name="TextBox4" id="TextBox4" MaxLength="1" class="uk-text-center" />
                            </div>
                        </div>

                    </div>
                    <input type="submit" onclick=""  id="btn" name="btn5" Class=" btn-click uk-button uk-button-large idz-button blue uk-width-large-1-1" value="verify" Text="Submit"  />



                    <h1 class="timer">0</h1>
                   
                    <script>


                        var timer_interval;
                        var timer = document.querySelector('.timer');
                        var btn = document.querySelector('.btn');

                       
                        var counter=121;
                        function timer_counter() {
                            counter--;
                            timer.innerHTML = counter;
                            if (counter == 0) {
                                clearInterval(timer_interval);
                        window.location.href="Client.jsp";
                            }
                        }

                        function timer_start() {
                            timer_interval = setInterval(timer_counter, 1000);

                        }
                        
                        window.onload = function ()
                        {
                          timer_start();  
                        };
                     
                    </script>

                </form>
            </div>
        </div>
    </body>
</html>

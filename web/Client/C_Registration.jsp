<%-- 
    Document   : C_Registration
    Created on : 11 Dec, 2018, 11:16:00 AM
    Author     : BRIGHT
--%>
<%@page import="dbConnection.Client_register_method"%>
<%@page import="java.sql.*"%>
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
    <body><%
        String username = "", email = "", password = "", mob_number = "", fullname = "", country = "", state = "", city = "";
        int gender = 0;
        if (request.getParameter("btn1") != null) {
            Client_register_method rg = new Client_register_method();
            int val = 0;
            val = rg.registration_ClassInsert(request.getParameter("Textnewusername"), request.getParameter("Textnewemail"), request.getParameter("Textnewpassword"), request.getParameter("Textnewmobile"), request.getParameter("Textfullname"), Integer.parseInt(request.getParameter("DropDowngender").toString()), request.getParameter("DropDowncountry"), request.getParameter("DropDownstate"), request.getParameter("DropDowncity"));
            if (val == 2) {
                String a ="This " + request.getParameter("Textnewusername") + " is Already Exist";
                out.print("<script>alert('" + a + "');</script>");
            } else if (val == 3) {
                String a ="This " + request.getParameter("Textnewemail") + " is Already Exist";
                out.print("<script>alert('" + a + "');</script>");
            } else if (val == 4) {
                String a = "This " + request.getParameter("Textnewmobile") + " is Already Exist";
                out.print("<script>alert('" + a + "');</script>");
            } else {
                
                String Email = request.getParameter("Textnewemail");
                String Subject = "Verification OTP";
                client_OTP_method cm = new client_OTP_method();
                String Message1 = cm.generate_otp();
                if(Mailer.send("cksolutioninfo@gmail.com", "12345678@$$", Email, Subject, Message1)) {
                     session.setAttribute("V_OTP_Reg", Message1);
                     session.setAttribute("eml_Reg",Email);
                    out.print("<script>alert('Succesfully OTP sent.');window.location.href='Client.jsp?page=C_Verification_Reg.jsp';</script>");
                } else {
                    out.print("<script>alert('Something Wrong.')</script>");
                }
            }
        }
        %>
        <div style="margin: auto; width: 50%">
            <div id="signin-account" class="uk-form">

                <legend style="text-align: center">Registration</legend>

                <div class="uk-container uk-container-center">
                    <div id="" class="uk-form">
                        <fieldset>
                            <div class="uk-form-icon">
                                <label><i class="uk-icon-user"></i>&nbsp;Username
                                    <input type="text" id="Textnewusername" name="Textnewusername"></label>


                            </div>

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
                            <div class="uk-form-icon">
                                <label>    <i class="uk-icon-mobile"></i>&nbsp;Mobile Number
                                    <input type="text" id="Textnewmobile" name="Textnewmobile"></label>

                            </div>
                            <div class="uk-form-icon">

                                <label><i class="uk-icon-user"></i>&nbsp;Full Name
                                    <input type="text" id="Textfullname" name="Textfullname"></label>


                            </div>
                            <div class="uk-form-icon">
                                <label><%-- <asp:RadioButton ID="Rdomale" runat="server" GroupName="1" />&nbsp;Male
                                            &nbsp;&nbsp;
                                        <asp:RadioButton ID="Rdofemale" runat="server" GroupName="1" />&nbsp;Female
                                    --%>
                                    Gender<br/>
                                    <div>
                                        <lable style="float: left; margin-bottom: 20px; "> Male</lable>
                                               <input type="radio" id="DropDowngender" name="DropDowngender" <%if (gender == 0) {
                                                       out.print("Checked");
                                                   }%> value="0" checked style="width: 20%;"> 


                                                                    <label>Female</label><input type="radio" id="DropDowngender1" name="DropDowngender" <%if (gender == 1) {
                                                                            out.print("checked");
                                                                        }%> value="1" style="width: 20%;">

                                    </div>                        
                                    <div class="uk-form-icon">
                                        Country<br />
                                        <select id="DropDowncountry" name="DropDowncountry"Height="44px" Width="572px">
                                           <option value="0">--select country--</option>

                                            <%
                                                Client_register_method crm = new Client_register_method();

                                                ResultSet rsstate = crm.clientRegister_ClassCountry();

                                                while (rsstate.next()) {

                                            %>
                                            <option value="<%=rsstate.getString("id")%>">
                                                <%=rsstate.getString("name")%>
                                            </option>
                                            <%  }%>

                                        </select>

                                    </div>


                                    <div class="uk-form-icon">
                                        State<br />
                                        <select id="DropDownstate" name="DropDownstate"Height="44px" Width="572px">
                                            <option value="0">--select state--</option>

                                        </select>


                                        <div class="uk-form-icon">
                                            City<br />
                                            <select id="DropDowncity" name="DropDowncity"Height="44px" Width="572px">
                                                <option value="0">--select city--</option>

                                            </select>

                                            <%-- <label>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter city" ControlToValidate="DropDowncity" ForeColor="Red"></asp:RequiredFieldValidator> 
                                                </label> 
                                                    </div>
                                            <%-- <label>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please enter state" ControlToValidate="DropDownstate" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </label> --%>
                                        </div>
                                        <%-- <label> 
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please enter country" ControlToValidate="DropDowncountry" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </label> --%>
                                    </div>

                                    <label>
                                        <input type="checkbox">I agree to the <a href="#">Terms</a></label>
                                        <%-- <a href="client-area.html" class="uk-button uk-button-large idz-button blue uk-width-large-1-1">Create account</a>--%>
                                    <input type="submit" value="submit" id="btn1" name="btn1" Class="uk-button uk-button-large idz-button blue uk-width-large-1-1+" Text="Create account" OnClick="Button2_Click">

                                    </fieldset>
                                    </div>
                                    </div>
                                    </div>
                                    </div>

                                    <script src="jquery.js" type="text/javascript"></script>

                                    <script type="text/javascript">

                                        $(document).ready(function () {
                                            $("#DropDowncountry").change(function () {
                                                $("#DropDownstate").empty();
                                                $("#DropDownstate").append(" <option value='0'>---Selet State---</option>");
                                                var StateVal = $("#DropDowncountry").val();
                                                $.get("JsoneFiles/GetState.jsp", {stid: StateVal}, function (data) {
                                                    var dropData = data.split(",");

                                                    for (var i = 0; i < dropData.length; i++)
                                                    {
                                                        var cityDropVals = dropData[i].split("|");
                                                        $("#DropDownstate").append("<option value='" + cityDropVals[0] + "'>" + cityDropVals[1] + "</option>");

                                                    }



                                                });


                                            });

                                        });



                                        $(document).ready(function () {
                                            $("#DropDownstate").change(function () {
                                                $("#DropDowncity").empty();
                                                $("#DropDowncity").append(" <option value='0'>---Selet City---</option>");
                                                var StateVal = $("#DropDownstate").val();
                                                $.get("JsoneFiles/GetCity.jsp", {stid: StateVal}, function (data) {
                                                    var dropData = data.split(",");

                                                    for (var i = 0; i < dropData.length; i++)
                                                    {
                                                        var cityDropVals = dropData[i].split("|");
                                                        $("#DropDowncity").append("<option value='" + cityDropVals[0] + "'>" + cityDropVals[1] + "</option>");

                                                    }



                                                });


                                            });

                                        });

                                    </script>



                                    </body>
                                    </html>

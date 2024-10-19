<%-- 
    Document   : Client.jsp
    Created on : 10 Dec, 2018, 11:51:27 AM
    Author     : bharat
--%>
<%@page import="dbConnection.technology_method" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.client_login_method"%>
<%@page import="dbConnection.cart_method" %>
<%@page import="dbConnection.server_method" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Standard Meta -->
        <meta charset="utf-8" />
        <meta name="format-detection" content="telephone=no" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

        <!-- Site Properties -->
        <title>JPANEL - Hosting SITE</title>
        <link rel="shortcut icon" href="../Client/images/jlogo.png" type="image/x-icon" />

        <link rel="apple-touch-icon-precomposed" href="images/jlogo.png" />

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Rajdhani:300,400,500,600,700%7CRoboto:300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet" />

        <!-- CSS -->
        <link rel="stylesheet" href="../Client/css/uikit.css" />
        <link rel="stylesheet" href="../Client/css/components/slider.css" />
        <link rel="stylesheet" href="../Client/css/components/slideshow.css" />
        <link rel="stylesheet" href="../Client/css/components/slidenav.css" />
        <link rel="stylesheet" href="../Client/css/components/dotnav.css" />
        <link rel="stylesheet" href="../Client/css/components/tooltip.css" />
        <link rel="stylesheet" href="../Client/css/small-icon.css" />
        <link rel="stylesheet" href="../Client/css/elements.css" />
        <link rel="stylesheet" href="../Client/css/style.css" />
        <link rel="stylesheet" href="../Client/css/mediaquery.css" />
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js"></script>

    </head>
    <%

        String name = "";
        if (session.getAttribute("user") != null) {
            client_login_method lm = new client_login_method();
            ResultSet rs = lm.getUserData(Integer.parseInt(session.getAttribute("user").toString()));
            if (rs.next()) {

                name = rs.getString("Username");
            }
        }
        if (request.getParameter("Button1") != null) {

            client_login_method lm = new client_login_method();
            String a = request.getParameter("Textlogemail");
            String b = request.getParameter("Textlogpassword");
            ResultSet rs = lm.client_loginClassSelect(request.getParameter("Textlogemail"), request.getParameter("Textlogpassword"));
            if (rs.next()) {
                session.setAttribute("user", rs.getInt("Reg_Id"));

                String s1 = "Successfully login. ";
                out.print("<script>alert('" + s1 + "');window.location.href='Client.jsp?page=C_Master.jsp?page1=C_Dashboard.jsp';</script>");
            } else {
                out.print("<script>alert('Invalid email or password')</script>");
            }
        }

    %>
    <body>
        <form method="POST">
            <header id="idz-header">
                <!-- Mobile / Offcanvas Menu -->
                <div id="mobile-nav" class="uk-offcanvas">
                    <div class="uk-offcanvas-bar">
                        <ul class="uk-nav uk-nav-offcanvas uk-nav-parent-icon" data-uk-nav>
                            <li class="uk-parente uk-active"><a href="Client.jsp?page=C_Home.jsp">Home</a></li>
                            <li><a href="Client.jsp?page=C_About.jsp">About</a></li>
                            <li><a href="Client.jsp?page=C_HostingPlan.jsp">Hostings</a></li>
                            <li><a href="Client.jsp?page=C_FAQs.jsp">Faqs</a></li>
                            <li><a href="Client.jsp?page=C_Contact.jsp">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <!-- Mobile / Offcanvas Menu End -->

                <div class="uk-container uk-container-center">
                    <div class="uk-grid">

                        <!-- Logo -->
                        <div class="uk-width-large-1-2 uk-width-medium-1-1 uk-width-small-1-1">
                            <div class="idz-logo">
                                <a href="Client.jsp?page=C_Home.jsp">
                                    <img src="../Client/images/jpanel4.png" alt="logo" class="">
                                </a>
                            </div>
                        </div>
                        <!-- Logo End -->

                        <!-- Domain Search Form -->
                        <div class="uk-width-large-1-2  uk-width-medium-1-1 uk-width-small-1-1">
                            <div class="idz-search-domain-block uk-text-right" id="afterLogin2"  visible="false">
                                <a href="#" style="display: <% if (session.getAttribute("user") != null) {
                                        out.print("block");
                                    } else {
                                        out.print("none");
                                    }
                                   %>" class="uk-button uk-button-large idz-button red xlarge uppercase"><i class="uk-icon-user"></i>&nbsp;Welcome  <%=name%>
                                    <label id="lblName" ></label>
                                </a>
                            </div>
                        </div>
                        <!-- Domain Search Form End -->

                        <!-- Header Info -->
                        <div class="uk-width-large-1-1 uk-width-medium-1-1 uk-width-small-1-1">
                            <ul class="uk-grid uk-grid-large uk-grid-with-medium-1-4 idz-header-contact">

                            </ul>
                        </div>
                        <!-- Header End -->

                    </div>
                </div>

                <!-- Header Nav -->
                <div class="idz-header-nav" data-uk-sticky="{top:-400}">

                    <div class="uk-container uk-container-center">
                        <div class="uk-grid">
                            <div class="uk-width-medium-1-1">

                                <div class="idz-menu-wrapper">
                                    <div class="uk-grid">
                                        <div class="uk-width-large-6-10 uk-width-medium-3-10 uk-width-small-3-10">

                                            <!-- Menu Items -->
                                            <div class="idz-nav">
                                                <nav class="uk-navbar">
                                                    <div class="uk-navbar-flip">
                                                        <ul class="uk-navbar-nav uk-hidden-medium  uk-hidden-small">
                                                            <li class="uk-parent uk-active"><a href="Client.jsp?page=C_Home.jsp">Home</a>

                                                            </li>
                                                            <li><a href="Client.jsp?page=C_About.jsp">About</a></li>
                                                            <li>
                                                                <a href="#">HOSTINGS</a>

                                                                <ul class="djdropdown-content">



                                                                    <%
                                                                        technology_method tm1 = new technology_method();
                                                                        ResultSet rs = tm1.technology_listClassSelect(0);
                                                                        while (rs.next()) {
                                                                    %> <li>
                                                                        <a href="#"><%=rs.getString("Technology_Type")%></a>
                                                                        <ul class="thmenu">

                                                                            <%
                                                                                server_method sm = new server_method();
                                                                                ResultSet rs1 = sm.server_listClassSelect(0);
                                                                                while (rs1.next()) {
                                                                            %>
                                                                            <li>
                                                                                <a href="Client.jsp?page=C_HostingPlan.jsp&tech=<%=rs.getString("Technology_Id")%>&server=<%=rs1.getString("Server_Id")%>"><%=rs1.getString("Server_Type")%></a>
                                                                            </li>
                                                                            <%
                                                                                }
                                                                            %>


                                                                        </ul>
                                                                    </li>
                                                                    <%}%>
                                                                </ul>
                                                            </li>
                                                            <li><a href="Client.jsp?page=C_Domain.jsp">Domain</a></li>
                                                            <li><a href="Client.jsp?page=C_FAQs.jsp">Faqs</a></li>
                                                            <li><a href="Client.jsp?page=C_Contact.jsp">Contact</a></li>
                                                        </ul>
                                                    </div>
                                                </nav>
                                                <!-- Mobile Menu Toggle  -->
                                                <a href="#mobile-nav" class="uk-navbar-toggle uk-visible-small uk-visible-medium" data-uk-offcanvas></a>
                                                <!-- Mobile Menu Toggle End-->
                                            </div>
                                            <!-- Menu Items End -->
                                        </div>

                                        <!-- Client Area Button -->
                                        <div class="uk-width-large-4-10 uk-width-medium-7-10 uk-width-small-7-10">
                                            <div id="beforeLogin"  class="idz-portal-button" style="display: <% if (session.getAttribute("user") != null) {
                                                    out.print("none");
                                                } else {
                                                    out.print("block");
                                                }
                                                 %>">
                                                <a href="Client.jsp?page=C_Cart.jsp" class="uk-button uk-button-large red idz-button xlarge uppercase"><i class="fa fa-shopping-cart" style="font-size: 2em; color: white;"><sub>
                                                            <span class="cartnum" >
                                                                <%
                                                                    cart_method cm = new cart_method();
                                                                    int count = cm.cart_countSelect();
                                                                    out.print(count);
                                                                %>
                                                            </span>
                                                        </sub></i></a>
                                                <a href="#client-area" data-uk-modal class="uk-button uk-button-large idz-button red xlarge uppercase"><i class="uk-icon-unlock"></i>Login</a>
                                                <a href="Client.jsp?page=C_Registration.jsp" class="uk-button uk-button-large idz-button red xlarge uppercase"><i class="uk-icon-user"></i>Register</a>

                                            </div>
                                            <div style="display: <% if (session.getAttribute("user") != null) {
                                                    out.print("block");
                                                } else {
                                                    out.print("none");
                                                }
                                                 %>;" id="afterLogin"  visible="false" class="idz-portal-button">
                                                <a href="Client.jsp?page=C_Master.jsp?page1=C_Dashboard.jsp" class="uk-button uk-button-large idz-button red xlarge uppercase"><i class="uk-icon-user"></i>Dashboard</a>
                                                <a href="C_Logout.jsp" id="lnkLogout" class="uk-button uk-button-large idz-button red xlarge uppercase" OnClick="myFunction()"><i class="uk-icon-lock"></i>&nbsp;Logout</a>
                                                <a href="Client.jsp?page=C_Cart.jsp" class="uk-button uk-button-large red idz-button xlarge uppercase"><i class="fa fa-shopping-cart" style="font-size: 2em; color: white;"><sub>
                                                            <span class="cartnum" >
                                                                <%
                                                                    cart_method cm1 = new cart_method();
                                                                    int count1 = cm1.cart_countSelect();
                                                                    out.print(count1);
                                                                %>
                                                            </span>
                                                        </sub></i></a>
                                            </div>

                                        </div>
                                        <!-- Client Area Button End -->

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <!-- Header Nav End -->

            </header>
            <!-- Header Section End -->
            <!--Start Master Page-->

            <%
                if (request.getParameter("page") != null) {
                    String pg = request.getParameter("page");
            %>
            <jsp:include page="<%=pg%>"></jsp:include>
            <%
                }else{
            %>
            <jsp:include page="C_Home.jsp"></jsp:include>
            <%
            }
            %>


            <!--End Master Page-->
            <!-- Footer -->
            <footer id="idz-footer" class="idz-padding">
                <div class="uk-container uk-container-center">


                    <!-- Footer Text -->
                    <div class="uk-grid">
                        <div class="uk-width-medium-1-1 uk-container-center uk-text-center">
                            <p class="idz-footer-note idz-thin idz-text-22px uk-margin-remove">Design and Developed By <span>Divya, Jeel & Jhanvi</span> </p>
                            <p class="idz-site-copyright uk-margin-remove">
                                Copyright &copy;
                                <label id="lblYear" runat="server"></label>
                                J-Panel Control Panel.
                            </p>
                        </div>
                    </div>
                    <!-- Footer Text End -->
                </div>

                <!-- Scroll to Top -->
                <a href="#top" class="to-top uk-icon-chevron-up" data-uk-smooth-scroll></a>
                <!-- Scroll to Top End -->
            </footer>
            <!-- Footer End -->

            <!-- client area modal begin -->
            <div id="client-area" class="uk-modal">
                <div class="uk-modal-dialog">

                    <ul id="client-area-tab" class="uk-tab uk-tab-grid" data-uk-tab="{connect:'#account'}">
                        <li class="uk-active uk-width-large-1-2"><a href="">Sign in</a></li>
                    </ul>


                    <ul id="account" class="uk-switcher uk-margin">
                        <!-- Modal Login Form -->
                        <li>
                            <div id="signin-account" class="uk-form">
                                <fieldset>
                                    <div class="uk-form-icon">
                                        <label> <i class="uk-icon-envelope"></i>&nbsp;Email
                                            <input type="email" id="Textlogemail"  name="Textlogemail">
                                        </label>
                                    </div>
                                    <div class="uk-form-icon">
                                        <label><i class="uk-icon-key"></i>&nbsp;Password
                                            <input id="Textlogpassword" Style="width: 100%; height: 44px; margin-bottom: 20px;" name="Textlogpassword" type="Password">
                                        </label>
                                    </div>
                                    <%--   <label>
                                        <input type="checkbox">Remember me</label>--%>
                                    <%-- <a href="client-area.html" class="uk-button uk-button-large idz-button blue uk-width-large-1-1">Login</a>  --%>
                                    <input id="Button1" name="Button1" type="submit" Class="uk-button uk-button-large idz-button blue uk-width-large-1-1"  value="Login"  />
                                </fieldset>
                            </div>
                        </li>
                        <!-- Modal Login Form End -->
                        <!-- Modal Register Form End -->
                    </ul>
                    <div class="uk-modal-caption">
                        <a href="Client.jsp?page=C_ForgetPassword.jsp">Forgot your password?</a>
                    </div>


                </div>
            </div>
            <!-- client area modal end -->

            <!-- Java script -->
            <script src="../Client/js/uikit.min.js"></script>
            <script src="../Client/js/components/slider.js"></script>
            <script src="../Client/js/components/slideshow.js"></script>
            <script src="../Client/js/components/slideshow-fx.js"></script>
            <script src="../Client/js/components/parallax.js"></script>
            <script src="../Client/js/components/sticky.js"></script>
            <script src="../Client/js/components/tooltip.js"></script>
            <script src="../Client/js/jquery.countTo.js"></script>
            <script src="../Client/js/template-config.js"></script>
        </form>
    </body>
</html>

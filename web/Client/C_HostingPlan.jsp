<%-- 
    Document   : C_HostingPlan
    Created on : 22 Dec, 2018, 11:34:48 AM
    Author     : bharat
--%>

<%@page import="dbConnection.cart_method"%>
<%@page import="org.w3c.dom.css.Counter"%>
<%@page import="dbConnection.technology_method" %>
<%@page import="dbConnection.server_method" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.hostingplan_method" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Client/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../Client/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/pricestyle.css" rel="stylesheet" type="text/css" media="screen"/>
        <title>JSP Page</title>
    </head>
    <body>

        <section id="price-planing">
            <div class="container">
                <div class="title-header">
                    <h1>Choose The Best <span>Pricinig</span></h1>

                </div>

                <div class="row">
                    <%
                     
                        int tech_id = Integer.parseInt(request.getParameter("tech"));
                        int server_id = Integer.parseInt(request.getParameter("server"));

                        if ((tech_id != 0) && server_id != 0) {

                            hostingplan_method hm1 = new hostingplan_method();
                                  
                            ResultSet rs = hm1.hostingplan_listClassSelect(0);
                            while (rs.next()) {
                                if ((tech_id==rs.getInt("Technology_Id")) && (server_id==rs.getInt("Server_Id"))) {
                                
                    %>

                    <div class="pricing-plan">
                        <div class="col-lg-4" style="padding-bottom: 60px;" >
                            <div class="plan">
                                <ul>

                                    <li class="plan-title">
                                        <h3><%=rs.getString("Plan_Title")%></h3>
                                    </li>
                                    <li class="plan-list"><%=rs.getInt("Disk_Space")%>GB Disk Space</li>
                                    <li class="plan-list"><%=rs.getInt("Bandwidth_Space")%>GB Bandwidth</li>
                                    <li class="plan-list"><%=rs.getString("Email_Account")%></li>
                                    <li class="plan-list"><%=rs.getString("Technical_Support")%></li>
                                    <li class="plan-list"><%=rs.getString("Database_Name")%></li>
                                    <li class="plan-list"><%=rs.getString("Language_Support")%></li>
                                    <li class="plan-list"><%=rs.getInt("Price_Per_Year")%>rs./year</li>
                                    <li class="plan-list"><%=rs.getString("Sub_Domains")%></li>
                                    <li class="plan-list"><%=rs.getString("Control_Panel_Type")%></li>
                                    <li class="plan-list"><%=rs.getString("FTP_Account")%></li>
                                    
                                    <li class="plan-button"><a href="Client.jsp?page=C_AddDomain.jsp&tech=<%=rs.getString("Technology_Id")%>&server=<%=rs.getString("Server_Id")%>&hp=<%=rs.getInt("HP_Id")%>">Order Now</a></li>
                                     
                                </ul>

                            </div>
                        </div>
                    </div>
                    <%}
                            }
                        }
                    %>
                </div>
            </div>
        </section>
    </body>
</html>

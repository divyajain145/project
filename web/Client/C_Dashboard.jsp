<%-- 
    Document   : C_Dashboard
    Created on : 13 Feb, 2019, 11:12:43 AM
    Author     : BRIGHT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.hosting_register_master_method" %>
<%@page import="dbConnection.domain_register_master_method" %>
<%@page import="dbConnection.order_master_method" %>
<%@page import="dbConnection.support_ticket_master_method" %>
<%@page import="dbConnection.order_detail_master_method" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int user_id = (Integer) session.getAttribute("user");
        %>
        <form action="C_Dashboard.jsp">

            <div>
                <div class="uk-width-large-1-1 dbtitle" >
                    <div class="hdb">
                        <i class="fa fa-dashboard"></i> Dashboard
                    </div>
                </div>
            </div>

            <div>
                <div class="uk-width-large-1-4 dbinfo" >

                    <div class="h11">
                        <%
                            hosting_register_master_method hrm = new hosting_register_master_method();
                            int val = hrm.hostingRegisterMaster_count(user_id);
                            out.print(val);
                        %>
                    </div>
                    <div class="h22">
                        Hosting
                    </div>
                </div>
                <div class="uk-width-large-1-4 dbinfo" >
                    <div class="h11">
                        <%
                            domain_register_master_method dm = new domain_register_master_method();
                            int count = dm.domainRegisterMaster_count(user_id);
                            out.print(count);
                        %>
                    </div>
                    <div class="h22">
                        Domain
                    </div>

                </div>
                <div class="uk-width-large-1-4 dbinfo" >
                    <div class="h11">
                        <%
                            order_master_method om = new order_master_method();
                            int a = om.orderMaster_count(user_id);
                            out.print(a);
                        %>
                    </div>
                    <div class="h22">
                        Orders
                    </div>

                </div>
                <div class="uk-width-large-1-4 dbinfo" >
                    <div class="h11">
                        <%
                            support_ticket_master_method sm = new support_ticket_master_method();
                            int b = sm.support_ticket_master_count(user_id);
                            out.print(b);
                        %>
                    </div>
                    <div class="h22">
                        Tickets
                    </div>
                </div>
            </div>

            <div >
                <div class="uk-width-large-1-4 dblistinfo" >
                    <div class="sttitle">
                        Support Tickets
                    </div> 
                    <%
                        ResultSet rs4 = sm.support_ticket_masterClassSelect7(user_id);
                        while (rs4.next()) {
                    %>
                    <div class="stcontent">
                        <%=rs4.getString("Support_Type")%>

                    </div>
                    <%
                        }
                    %>

                </div>

                <div class="uk-width-large-1-4 dblistinfo" >
                    <div class="sttitle">
                        Orders
                    </div> 
                    <%
                        int order_id = 0;
                        ResultSet r5 = om.OrderMaster_maxId(user_id);
                        if (r5.next()) {
                            order_id = r5.getInt("oid");
                        }
                        order_detail_master_method odm = new order_detail_master_method();
                        ResultSet r6 = odm.orderDetail_masterClassSelect7(order_id);
                        while (r6.next()) {
                    %>
                    <div class="stcontent">
                        <%
                            out.print(r6.getString("Order_Type")+"  ");
                            out.print(r6.getString("Domain_Name")+"  ");
                            out.print(r6.getInt("Total_Amount"));
                        %>
                    </div>
                    <%
                        }
                    %>

                </div>

            </div>




        </form>


    </body>
</html>

<%-- 
    Document   : C_Cart
    Created on : 29 Dec, 2018, 12:47:08 PM
    Author     : BRIGHT
--%>
<%@page import="dbConnection.order_master_method"%>
<%@page import="dbConnection.cart_method"%>
<%@page import="dbConnection.hostingplan_method"%>
<%@page import="dbConnection.technology_method"%>
<%@page import="dbConnection.domain_pricing_method"%>
<%@page import="dbConnection.server_method"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int p = 0, price = 0, gst = 0, total = 0;

            if (request.getParameter("Delete") != null) {
                int cart_id = Integer.parseInt(request.getParameter("Delete"));
                cart_method c = new cart_method();
                int val = c.cart_classDelete(cart_id);
            }
        %>
        <%
            cart_method cm = new cart_method();
        %>
        <div class="search-DomainName2" style="margin: 70px 10px 50px 10px;">
            <h1 style="color: rgba(220, 89, 128, 1);">Review & Checkout</h1>
        </div>
        <div class="domainlist">
            <table style="margin: 10px auto 50px auto; ">
                <tr>

                    <th>Description</th>
                    <th>Price</th>
                </tr>


                <%
                    int a = 0, server_id = 0, technology_id = 0;
                    String technology = "", server = "", domain = "", planName = "";
                    ResultSet rs6 = cm.cart_listClassSelect();
                    while (rs6.next()) {
                        if (rs6.getString("Cart_Type").equals("hosting")) {
                            domain = rs6.getString("Domain_Name");
                            a = rs6.getInt("Reference_Id");
                            hostingplan_method hm = new hostingplan_method();
                            ResultSet rs7 = hm.hostingplan_listClassSelect(a);
                            while (rs7.next()) {
                                server_id = rs7.getInt("Server_ID");
                                technology_id = rs7.getInt("Technology_Id");
                                price = rs7.getInt("Price_Per_Year");
                                planName = rs7.getString("Plan_Title");
                                p = price + p;
                                technology_method tm = new technology_method();
                                ResultSet rs8 = tm.technology_listClassSelect(technology_id);
                                while (rs8.next()) {
                                    technology = rs8.getString("Technology_Type");
                                }
                                server_method sm = new server_method();
                                ResultSet rs9 = sm.server_listClassSelect(server_id);
                                while (rs9.next()) {
                                    server = rs9.getString("Server_Type");
                                }
                            }
                %>

                <tr>
                    <td>
                        <%
                            out.print("Plan :- " + planName + "<br>");
                            out.print("Technology :- " + technology);
                            out.print("<br>Server :- " + server);
                            out.print("<br> Domain Name :- " + domain + "<br>");
                        %>
                    </td>
                    <td>
                        <%
                            out.print("Price :- " + price + "&nbsp;&nbsp;&nbsp;");
                        %>
                        <a href="Client.jsp?page=C_Cart.jsp?Delete=<%=rs6.getInt("Cart_id")%>" class="deletebtn" ><i class="fa fa-trash "></i></a>
                            <%
                            %>
                    </td>

                </tr>

                <%        } else {
                    int count = 0;
                    domain = rs6.getString("Domain_Name");
                    a = rs6.getInt("Reference_Id");
                    domain_pricing_method dpm = new domain_pricing_method();
                    ResultSet r8 = dpm.domain_PricelistClassSelect(a);
                    while (r8.next()) {
                        if (Integer.parseInt(rs6.getString("For_Year")) == 1) {
                            count = 1;
                            price = Integer.parseInt(r8.getString("Pricing_Per_Year"));
                            p = price + p;
                        } else if (Integer.parseInt(rs6.getString("For_Year")) == 2) {
                            count = 2;
                            price = 2 * Integer.parseInt(r8.getString("Pricing_Per_Year"));
                            p = price + p;
                        } else {
                            count = 3;
                            price = 3 * Integer.parseInt(r8.getString("Pricing_Per_Year"));
                            p = price + p;
                        }

                    }


                %>
                <tr>
                    <td>
                        <%   out.print("Domain Name :- " + domain + " for " + count + " year<br>");
                        %>
                    </td>
                    <td>
                        <%
                            out.print("Price :- " + price + "&nbsp;&nbsp;&nbsp;");
                        %>
                        <a href="Client.jsp?page=C_Cart.jsp?Delete=<%=rs6.getInt("Cart_id")%>" class="deletebtn" ><i class="fa fa-trash "></i></a>
                            <%
                                    }
                                }
                            %>
                    </td>

                </tr>

                <tr>
                    <td>Subtotal:</td>
                    <td>
                        <%                            if (p > 0) {
                                out.print(p);
                            } else {
                        %>
                        0.00
                        <%}%>
                    </td>
                </tr>

                <tr>
                    <td>IGST @ 18.00%:</td>
                    <td>
                        <%
                            if (p > 0) {
                                gst = (p * 18) / 100;
                                out.print(gst);
                            } else {
                        %>
                        0.00
                        <%}%>
                    </td>
                </tr>
                <tr>
                    <td>Total Due Today:  </td>
                    <td>
                        <%
                            total = p + gst;
                            out.print(total);
                        %>
                    </td>
                </tr>
            </table>
            <div style="width: 300px; margin-left: auto; margin-right: auto;">
                <input class="btn btn-block uk-button uk-button-large idz-button blue" 
                       style="height: 58px; text-transform:none;  width: 200px; border-radius: 5px; border: 0px; font-size: 19px;padding: 8px 8px; margin: 10px 0px 50px 0px;" type="submit" value="Generate Order" id="generateorder" name="generateorder"/>
                <div>          
                </div>

            </div>
        </div>
        <%
            if (request.getParameter("generateorder") != null) {
                if (session.getAttribute("user") != null) {
                    int o_id=0,amount=0;
                    int user_id = Integer.parseInt(session.getAttribute("user").toString());
                    order_master_method om = new order_master_method();
                    int val = 0;
                    val = om.order_listClassInsert(user_id, p, gst, total, 1, 0);
                    ResultSet rs51 = om.OrderMaster_maxId();
                    while (rs51.next()) {                            
                            o_id = rs51.getInt("oid");
                        }
                    ResultSet r67=om.order_listClassSelect(o_id);
                    if(r67.next()){
                        amount=r67.getInt("Total_Amount");
                    }
                    int amount_USD=amount/70;
                    out.print("<script>window.location.href='Client.jsp?page=C_Payment.jsp&order_id="+o_id+"&amount="+amount_USD+"';</script>");
                } else {
                    out.print("<script>window.location.href='Login/C_Login.jsp';</script>");
                }
            } 
        %>
    </body>
</html>

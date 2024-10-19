<%-- 
    Document   : C_Domain
    Created on : 22 Dec, 2018, 10:38:06 AM
    Author     : bharat
--%>



<%@page import="dbConnection.domain_pricing_method"%>
<%@page import="dbConnection.domain_method" %>
<%@page import="dbConnection.domain_register_master_method" %>
<%@page import="dbConnection.cart_method" %>
<%@page import="java.sql.ResultSet"%>

<%
    String dname = "";
    int hp_id = 0;
    int did = 0;
    if (request.getParameter("domainsearch") != null) {

        dname = request.getParameter("domainname");
        did = Integer.parseInt(request.getParameter("dropStatusdomain"));
        out.print("<script>window.location.href='Client.jsp?page=C_Domain.jsp&domainid=" + did + "&dname=" + dname + "';</script>");

    }

%>
 <%
            if (request.getParameter("UnAvailableDomain") != null) {
                String dnme = request.getParameter("domain");
                String dtyp = request.getParameter("dtype");
                int doid = Integer.parseInt(request.getParameter("domainid"));
                String yr = request.getParameter("domainyear");
                cart_method ct = new cart_method();
                String c_type = "domain";
                String order_type = "new domain";
                int val = ct.cart_listClaassInsert(c_type, doid, dnme, yr, order_type);
                out.print("<script>window.location.href='Client.jsp?page=C_Cart.jsp';</script>");
            }
            if (request.getParameter("UnAvailableDomain1") != null) {
                hp_id = Integer.parseInt(request.getParameter("hp"));
                String dnme = request.getParameter("domain");
                String dtyp = request.getParameter("dtype");
                int doid = Integer.parseInt(request.getParameter("domainid"));
                String yr = request.getParameter("domainyear");
                cart_method ct = new cart_method();
                String c_type = "domain";
                String cart_typ="hosting";
                String order_type = "new domain";
                String year="1";
                int val = ct.cart_listClaassInsert(c_type, doid, dnme, yr, order_type);
                int va = ct.cart_listClaassInsert(cart_typ, hp_id, dnme, year, order_type);
               out.print("<script>window.location.href='Client.jsp?page=C_Cart.jsp';</script>");
            }
        %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Client/css/style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <style>
            .dropbtndj {
                background-color: white;
                color: white;
                padding: 20px;
                font-size: 16px;
                border: none;
                border-radius:5px; 
                cursor: pointer;
                color: #128dab;
                margin: 10px 5px;
            }

            .dropdowndj {
                position: relative;
                display: inline-block;
            }

            .dropdowndj-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 100px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdowndj-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdowndj-content a:hover {background-color: #f1f1f1}

            .dropdowndj:hover .dropdowndj-content {
                display: block;
            }

            .dropdowndj:hover .dropbtndj {
                background-color: #d9dad9;
            }
        </style>
    </head>
    <body>
        <input name="hidHPid" type="hidden" id="hidHPid" value="<%if(request.getParameter("hp") != null){out.print(request.getParameter("hp"));}%>"/>
        <%    if (request.getParameter("addtocart1") != null) {
                cart_method c = new cart_method();
                String c_typ = "domain";
                String cat_typ = "hosting";
                String yr = "1";
                int ref_id = Integer.parseInt(request.getParameter("hp"));
                String ordr_type = "new domain";
                String typ = request.getParameter("hid3");
                int va = c.cart_listClaassInsert(cat_typ, ref_id, request.getParameter("name") + typ, yr, ordr_type);
                int Val = c.cart_listClaassInsert(c_typ, Integer.parseInt(request.getParameter("domain_id")), request.getParameter("name") + typ, request.getParameter("d-pricing"), ordr_type);
                out.print("<script>window.location.href='Client.jsp?page=C_Cart.jsp';</script>");
            }
        %>

        <%            if (request.getParameter("addtocart") != null) {
                cart_method ct = new cart_method();
                String c_type = "domain";
                String order_type = "new domain";
                String type = request.getParameter("hid3");
                int val = ct.cart_listClaassInsert(c_type, Integer.parseInt(request.getParameter("domainid")), request.getParameter("dname") + type, request.getParameter("d-pricing"), order_type);
                if (val > 0) {
                    out.print("<script>alert('Successfully added to cart')</script>");
                }
            }
        %>
        <section id="idz-header-inner">
            <div class="uk-container uk-container-center">
                <div class="idz-page-title idz-padding-medium">
                    <div class="uk-grid">
                        <div class="uk-width-large-1-2 uk-width-medium-1-3">
                            <div class="idz-title">
                                <h1 style="text-align: center;">Register Domain</h1>
                                <i class="uk-icon-server"></i>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <div class="container">
            <div class="row">
                <div style="width:80%; height:300px; margin: 100px auto;   box-shadow: 0px 0px 9px #888888;">
                    <div class="search-box" >
                        <div style=" height:auto; width: 100%; background-color: #5dafef; border-radius: 10px; padding: 10px 15px; ">
                            <input value="<% if (request.getParameter("dname") != null) {
                                    out.print(request.getParameter("dname"));
                                }
                                if (request.getParameter("hp") != null) {
                                    out.print(request.getParameter("name"));
                                }%>" class="searchtext" type="text" placeholder="Enter your domain here" id="domainname" name="domainname" 
                                   style=" width: 60%; border-radius: 10px; padding: 20px 20px; margin: 10px 15px; border:0px; float: left;"/>
                            <div class="dropdowndj" style="float:left; padding-top: 9px;" > 




                                <input type="hidden" name="hid3" id="hid3" value="0" />
                                <select class="form-control" id="dropStatus1" name="dropStatusdomain" onchange="getDrop1Text(this)" style=" border: 0px; height: 58px; border-radius: 10px; font-size: 15px; font-family: inherit; color: initial; ">

                                    <%
                                        domain_method sm = new domain_method();
                                        ResultSet rs = sm.domain_listClassSelect(0);
                                        while (rs.next()) {
                                            String a = rs.getString("Domain_Type");

                                    %>
                                    <option <% if (request.getParameter("domainid") != null) {
                                            if (rs.getInt("Domain_Id") == Integer.parseInt(request.getParameter("domainid"))) {
                                                out.print("selected");
                                            }
                                        }
                                        if (request.getParameter("hp") != null) {
                                            if (rs.getInt("Domain_Id") == Integer.parseInt(request.getParameter("domain_id"))) {
                                                out.print("selected");
                                            }
                                        }
                                        %> value="<%=rs.getInt("Domain_Id")%>"><%=rs.getString("Domain_Type")%></option>

                                    <%
                                        }
                                    %>
                                </select>

                            </div>


                            <input class="btn btn-block uk-button uk-button-large idz-button blue" 
                                   style="height: 58px; width: 200px; border-radius: 10px; border: 0px;padding: 10px 10px; margin: 10px 15px;" type="submit" value="search" id="doaminsearch" name="domainsearch"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%
            int technology = 0, server = 0, do_id = 0;
            String do_name = "", do_type = "", v = "", b = "";
            if (request.getParameter("hp") != null && request.getParameter("tech") != null && request.getParameter("server") != null) {
                hp_id=Integer.parseInt(request.getParameter("hp"));
                do_name = request.getParameter("name");
                do_type = request.getParameter("type");
                do_id = Integer.parseInt(request.getParameter("domain_id"));
                v = do_name + do_type;
                domain_register_master_method dp = new domain_register_master_method();
                ResultSet rs2 = dp.domain_registerClassSelectd(v);
                while (rs2.next()) {
                    b = rs2.getString("Domain_Name");
                }
                if (v.equals(b)) {
        %>
        <div class="search-DomainName2">
            <h3>Sorry, <label>www.<%=v%> </label>is already taken.</h3>
            <p>other domain you might be interested in..</p>
        </div>
        <div class="domainlist">
            <table>
                <tr>
                    <th>Domain Name</th>
                    <th>Registration Period</th>
                    <th>Add To Cart</th>
                </tr>
                <%
                    domain_method dm3 = new domain_method();
                    ResultSet r5 = dm3.domain_listSelectd(Integer.parseInt(request.getParameter("domain_id")));
                    while (r5.next()) {
                        String Domain = request.getParameter("name") + r5.getString("Domain_Type");
                        dp = new domain_register_master_method();
                        ResultSet rsDomainList = dp.domain_registerSelectedDomainList(Domain);
                        if (rsDomainList.next()) {
                            //All ready Exist
                        } else {


                %>
                <tr>
                    <td>
                        <%=Domain%>
                    </td>
                    <td><div class="search-DomainName2">

                            <select class="form-control" id="pricing-<%=r5.getString("Domain_Id")%>" name="pricing-<%=r5.getString("Domain_Id")%>">
                                <%
                                    domain_pricing_method pm = new domain_pricing_method();
                                    ResultSet rs3 = pm.domain_PricelistByDomainClassSelect(Integer.parseInt(r5.getString("Domain_Id")));
                                    if (rs3.next()) {

                                        int one = Integer.parseInt(rs3.getString("Pricing_Per_Year"));
                                        int two = one * 2;
                                        int three = one * 3;
                                %>
                                <option value="1">1 year/s @ Rs. <%=one%></option>
                                <option value="2">2 year/s @ Rs. <%=two%></option>
                                <option value="3">3 year/s @ Rs. <%=three%></option>

                                <%

                                    }
                                %>
                            </select>
                    </td>
                    <td>
                        <a id="AddToCartBtn-<%=r5.getString("Domain_Id")%>" data-domain="<%=Domain%>" data-domainType="<%=r5.getString("Domain_Type")%>" data-domainId="<%=r5.getString("Domain_Id")%>" href="#" class="btn btn-block uk-button uk-button-medium idz-button blue btnAddCartAtag1" style="border-radius: 5px;margin:6px 0;  padding: 0 10px; background:  rgba(73, 148, 205, .9);">
                            Add to Cart    
                        </a>

                    </td>
                </tr>
                <%
                        }
                    }
                %>

            </table>

        </div>
        <%
        } else {
        %>

        <div class="container">
            <div class="row">
                <div class="search-DomainName">
                    <h3>Congratulations..! Your searched domain is available.</h3>

                    <div class="search-DomainName">
                        <label><%=v%></label>
                        <select class="form-control" id="d-pricing" name="d-pricing">
                            <%
                                domain_pricing_method pm = new domain_pricing_method();
                                ResultSet rs3 = pm.domain_PricelistClassSelect(0);
                                while (rs3.next()) {
                                    if (do_id == rs3.getInt("Domain_Type_Id")) {
                                        int one = Integer.parseInt(rs3.getString("Pricing_Per_Year"));
                                        int two = one * 2;
                                        int three = one * 3;
                            %>
                            <option value="1">1 year/s @ Rs. <%=one%></option>
                            <option value="2">2 year/s @ Rs. <%=two%></option>
                            <option value="3">3 year/s @ Rs. <%=three%></option>

                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <input class="btn btn-block uk-button uk-button-medium idz-button blue" 
                           style="border-radius: 5px; padding: 5px 10px;"  type="submit" value="Add to Cart" id="addtocart1" name="addtocart1"/>

                </div>
            </div>
        </div>
        <%
                }
            }
        %>

        <%
            String a = "", value = "";
            if (request.getParameter("domainid") != null && request.getParameter("dname") != null) {

                String name = request.getParameter("dname");
                int d_id = Integer.parseInt(request.getParameter("domainid"));
                ResultSet rs1 = sm.domain_listClassSelect(d_id);
                while (rs1.next()) {
                    value = name + rs1.getString("Domain_Type");
                    domain_register_master_method dp = new domain_register_master_method();
                    ResultSet rs2 = dp.domain_registerClassSelectd(value);
                    while (rs2.next()) {
                        a = rs2.getString("Domain_Name");
                    }
                    if (value.equals(a)) {
        %>
        <div class="search-DomainName2">
            <h3>Sorry, <label>www.<%=value%> </label>is already taken.</h3>
            <p>other domain you might be interested in..</p>
        </div>
        <div class="domainlist">
            <table>
                <tr>
                    <th>Domain Name</th>
                    <th>Registration Period</th>
                    <th>Add To Cart</th>
                </tr>
                <%
                    domain_method dm3 = new domain_method();
                    ResultSet r5 = dm3.domain_listSelectd(Integer.parseInt(request.getParameter("domainid")));
                    while (r5.next()) {
                        String Domain = request.getParameter("dname") + r5.getString("Domain_Type");
                        dp = new domain_register_master_method();
                        ResultSet rsDomainList = dp.domain_registerSelectedDomainList(Domain);
                        if (rsDomainList.next()) {
                            //All ready Exist
                        } else {


                %>
                <tr>
                    <td>
                        <%=Domain%>
                    </td>
                    <td><div class="search-DomainName2">

                            <select class="form-control" id="pricing-<%=r5.getString("Domain_Id")%>" name="pricing-<%=r5.getString("Domain_Id")%>">
                                <%
                                    domain_pricing_method pm = new domain_pricing_method();
                                    ResultSet rs3 = pm.domain_PricelistByDomainClassSelect(Integer.parseInt(r5.getString("Domain_Id")));
                                    if (rs3.next()) {

                                        int one = Integer.parseInt(rs3.getString("Pricing_Per_Year"));
                                        int two = one * 2;
                                        int three = one * 3;
                                %>
                                <option value="1">1 year/s @ Rs. <%=one%></option>
                                <option value="2">2 year/s @ Rs. <%=two%></option>
                                <option value="3">3 year/s @ Rs. <%=three%></option>

                                <%

                                    }
                                %>
                            </select>
                    </td>
                    <td>
                        <a id="AddToCartBtn-<%=r5.getString("Domain_Id")%>" data-domain="<%=Domain%>" data-domainType="<%=r5.getString("Domain_Type")%>" data-domainId="<%=r5.getString("Domain_Id")%>" href="#" class="btn btn-block uk-button uk-button-medium idz-button blue btnAddCartAtag" style="border-radius: 5px;margin:6px 0;  padding: 0 10px; background:  rgba(73, 148, 205, .9);">
                            Add to Cart    
                        </a>

                    </td>
                </tr>
                <%
                        }
                    }
                %>

            </table>

        </div>
        <%
        } else {
        %>

        <div class="container">
            <div class="row">
                <div class="search-DomainName">
                    <h3>Congratulations..! Your searched domain is available.</h3>

                    <div class="search-DomainName">
                        <label><%=value%></label>
                        <select class="form-control" id="d-pricing" name="d-pricing">
                            <%
                                domain_pricing_method pm = new domain_pricing_method();
                                ResultSet rs3 = pm.domain_PricelistClassSelect(0);
                                while (rs3.next()) {
                                    if (d_id == rs3.getInt("Domain_Type_Id")) {
                                        int one = Integer.parseInt(rs3.getString("Pricing_Per_Year"));
                                        int two = one * 2;
                                        int three = one * 3;
                            %>
                            <option value="1">1 year/s @ Rs. <%=one%></option>
                            <option value="2">2 year/s @ Rs. <%=two%></option>
                            <option value="3">3 year/s @ Rs. <%=three%></option>

                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <input class="btn btn-block uk-button uk-button-medium idz-button blue" 
                           style="border-radius: 5px; padding: 5px 10px;"  type="submit" value="Add to Cart" id="addtocart" name="addtocart"/>

                </div>
            </div>
        </div>
        <%
                    }
                }
            }
        %>


        <script type="text/javascript">
            $(".btnAddCartAtag").click(function () {

                var domainName = $(this).attr("data-domain");
                var dataDomainType = $(this).attr("data-domainType");
                var dataDomainId = $(this).attr("data-domainId");

                var domainYear = $("#pricing-" + dataDomainId).val();
                window.location.href = "Client.jsp?page=C_Domain.jsp&UnAvailableDomain=True&domain=" + domainName + "&dtype=" + dataDomainType + "&domainid=" + dataDomainId + "&domainyear=" + domainYear;

                return false;


            });
            $(".btnAddCartAtag1").click(function () {

                var domainName = $(this).attr("data-domain");
                var dataDomainType = $(this).attr("data-domainType");
                var dataDomainId = $(this).attr("data-domainId");
                var dataHPId = $("#hidHPid").val();

                var domainYear = $("#pricing-" + dataDomainId).val();
                window.location.href = "Client.jsp?page=C_Domain.jsp&UnAvailableDomain1=True&hp="+dataHPId+"&domain=" + domainName + "&dtype=" + dataDomainType + "&domainid=" + dataDomainId + "&domainyear=" + domainYear;

                return false;


            });
            function getDrop1Text(drop1)
            {
                var text = drop1.options[drop1.selectedIndex].text;
                hid3.value = text;

            }
            window.onload = getDrop1Text(document.getElementById("dropStatus1"));
        </script>

       

    </body>
</html>

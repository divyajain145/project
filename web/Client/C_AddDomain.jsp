<%-- 
    Document   : C_AssDomain
    Created on : 3 Jan, 2019, 11:31:32 AM
    Author     : bharat
--%>
<%@page import="dbConnection.cart_method" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.domain_method" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../Client/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <%
            int hp_id = Integer.parseInt(request.getParameter("hp"));
            int tech_id = Integer.parseInt(request.getParameter("tech"));
            int server_id = Integer.parseInt(request.getParameter("server"));
            if (request.getParameter("btncontinue") != null) {
                int val = Integer.parseInt(request.getParameter("rdo1"));
                if (val == 2) {
                    String domain=request.getParameter("new_domain");
                    String type=request.getParameter("hid4");
                    String domain_id=request.getParameter("dropdown2");
                    out.print("<script>window.location.href='Client.jsp?page=C_Domain.jsp&hp="+request.getParameter("hp")+"&tech="+request.getParameter("tech")+"&server="+request.getParameter("server")+"&name="+domain+"&domain_id="+domain_id+"&type="+type+"';</script>");
                } else if (val == 3) {
                    String cart_type="hosting", order_t="existing domain";
                    int ref_id=hp_id;
                    String year = "1";
                    String Domain = request.getParameter("own_domain") + request.getParameter("hid3");
                    cart_method cm=new cart_method();
                    int value=0,x=0;
                    value=cm.cart_listClaassInsert(cart_type, ref_id, Domain,year,order_t);
                    out.print("<script>window.location.href='Client.jsp?page=C_Cart.jsp';</script>");
                } else {
                    String cart_type="hosting", order_t="existing domain";
                    int ref_id=hp_id;
                    String year = "1";
                    String Domain = request.getParameter("cartdomainDropDown");
                    cart_method cm=new cart_method();
                    int value=0,x=0;
                    value=cm.cart_listClaassInsert(cart_type, ref_id, Domain,year,order_t);
                    out.print("<script>window.location.href='Client.jsp?page=C_Cart.jsp';</script>");
                }
            }
        %>
        <section id="idz-header-inner">
            <div class="uk-container uk-container-center">

                <div class="idz-page-title idz-padding-medium">
                    <div class="uk-grid">
                        <div class="uk-width-large-1-2 uk-width-medium-1-3">
                            <div class="idz-title">
                                <h1 class="">Product Selection</h1>
                                <i class="uk-icon-server"></i>
                            </div>
                        </div>
                        <p style="color: white;">Please provide us with the domain you want to use with your hosting service by selecting an option from the selections below.</p>
                    </div>
                </div>

            </div>
        </section>

        <div class="container">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="margin: 80px 0 100px 0;">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">                           
                            <label for="rdo1" role="button" data-toggle="collapse" data-parent="#accordion" data-target="#collapseOne"> 
                                <input type="radio" name="rdo1" id="rdo1" value="1" checked> Use a domain already in my shopping cart 
                            </label>                          
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <div class="col-sm-2 col-xs-4">
                                <select class="adom-form-control" id="cartdomainDropDown" name="cartdomainDropDown">
                                    <%
                                     cart_method cm = new cart_method();
                                     ResultSet rs4 = cm.cart_listClassSelect();
                                     while(rs4.next())
                                     {
                                         if((rs4.getString("Cart_Type").equals("domain"))&&(rs4.getString("Domain_Order_Type").equals("new domain"))){
                                    %>
                                    <option value="<%=rs4.getString("Domain_Name")%>"><%=rs4.getString("Domain_Name")%></option>
                                    <%
                                        }
                                    }
                                    %>

                                </select>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">

                            <label for="rdo2" class="" role="button"  data-toggle="collapse" data-parent="#accordion" data-target="#collapseTwo"> 
                                <input type="radio" name="rdo1" value="2" id="rdo2">  Register a new domain
                            </label>

                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">



                            <div class="col-sm-6 col-xs-8 col-sm-offset-2">
                                <div class="adom-input-group">
                                    <span class="adom-input-group-addon">www.</span>
                                    <input type="text" id="registersld" name="new_domain" value="" class="adom-input-form-control" autocapitalize="none">
                                </div>
                            </div>
                            <div class="col-sm-2 col-xs-4">
                                <input type="hidden" name="hid4" id="hid4" value="0" />
                                    <select name="dropdown2" id="dropdown4" class="adom-form-control" onchange="getDrop2Text(this)">
                                  
                                    <%
                                        domain_method sm = new domain_method();
                                        ResultSet rs = sm.domain_listClassSelect(0);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getInt("Domain_Id")%>"><%=rs.getString("Domain_Type")%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>



                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">

                            <label for="rdo3" role="button"  data-toggle="collapse" data-parent="#accordion" data-target="#collapseThree"> 
                                <input type="radio" value="3" name="rdo1" id="rdo3">    I will use my existing domain and update my nameservers
                            </label>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            <div class="col-sm-6 col-xs-8 col-sm-offset-2">
                                <div class="adom-input-group">
                                    <span class="adom-input-group-addon">www.</span>
                                    <input type="text" id="registersld" name="own_domain" id="own_domain" value="" class="adom-input-form-control" autocapitalize="none">
                                </div>
                            </div>
                            <div class="col-sm-2 col-xs-4">
                                <input type="hidden" name="hid3" id="hid3" value="0" />
                                <select name="dropdown1" id="dropdown3" class="adom-form-control" onchange="getDrop1Text(this)">
                                    <%
                                        domain_method dm = new domain_method();
                                        ResultSet rs1 = dm.domain_listClassSelect(0);
                                        while (rs1.next()) {
                                    %>
                                    <option value="<%=rs1.getInt("Domain_Id")%>"><%=rs1.getString("Domain_Type")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width: 300px; margin-left: auto; margin-right: auto;">
                    <input class="btn btn-block uk-button uk-button-large idz-button blue" 
                           style="height: 58px; width: 200px; border-radius: 5px; border: 0px; font-size: 19px;padding: 8px 8px; margin: 50px 15px 0 15px;" type="submit" value="Continue" id="btncontinue" name="btncontinue"/>
                    <div>          
                    </div>

                </div>
            </div>
        </div>
        <script src="../Client/js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            
                                    function getDrop1Text(drop1)
                                    {
                                        var text = drop1.options[drop1.selectedIndex].text;
                                        hid3.value = text;

                                    }
                                    window.onload=getDrop1Text(document.getElementById("dropdown3"));
                                    
                                    function getDrop2Text(drop1)
                                    {
                                        var text = drop1.options[drop1.selectedIndex].text;
                                        console.log(text);
                                        hid4.value = text;

                                    }
                                    window.onload=getDrop2Text(document.getElementById("dropdown4"));
                                    
        </script>
      
    </body>
</html>

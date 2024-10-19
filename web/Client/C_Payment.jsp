<%-- 
    Document   : C_Payment
    Created on : 7 Feb, 2019, 9:15:35 AM
    Author     : bharat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .center_class{
                width: 600px;
                margin:auto;
                margin-bottom: 50px;
                margin-top: 50px;
            }
            .box{
                width: 600px;
                height:300px;
                padding: 20px;
                border:1px solid lightblue;
            }
            .content_data{
                padding-left: 30px;
            }
            .content_date a img{
                width:50px;
                display: inline-block;
            }
            
        </style>
    </head>
    <body>
        <%
            int order_id=Integer.parseInt(request.getParameter("order_id"));
            int amount=Integer.parseInt(request.getParameter("amount"));
        %>
        <div class="container">
            <div class="center_class">
                <div class="box">
                    <div class="content-title">
                        <h3 style="text-align:center;">Select payment option</h3>
                        <div class="content_data" style="float: left;">
                            <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&amp;business=JPanel@paypal.com&item_name=&amount=<%=amount%>&quantity=1&currency_code=USD"><img src="imagespayment/paypal.png" alt=""/></a>
                            
                        </div>
                        <div class="content_data" style="float: left;">
                            <a href="#"><img src="imagespayment/payumoney.jpg" alt=""/></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

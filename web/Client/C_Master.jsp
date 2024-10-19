<%-- 
    Document   : C_Master
    Created on : 9 Feb, 2019, 12:21:40 PM
    Author     : BRIGHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="dbcontainer" >

            <div class="uk-width-large-1-4 cmmenu " style="float: left;">
                <div class=" ">
                    <div class="cm-menu">
                        <h1>Menu</h1>
                    </div>
                    <div class="cm-menu-list">
                        <ul type="none">
                            <a href="Client.jsp?page=C_Master.jsp?page1=C_Dashboard.jsp"><li>Dashboard</li></a>
                            <a href="Client.jsp?page=C_Master.jsp?page1=C_HostingList.jsp"><li>Hosting</li></a>
                            <a href="Client.jsp?page=C_Master.jsp?page1=C_DomainList.jsp"><li>Domain</li></a>
                            <a href="Client.jsp?page=C_Master.jsp?page1=C_OrderList.jsp"><li>Orders</li></a>
                            <a href="Client.jsp?page=C_Master.jsp?page1=C_TicketList.jsp"><li>Support Tickets</li></a>
                            <a href="Client.jsp?page=C_Master.jsp?page1=C_FeedBack.jsp"><li>FeedBack</li></a>
                            
                        </ul>
                    </div>
                </div>

            </div>
            <div class="uk-width-large-3-4 dashboarddb" style="background-color: white;float: left;">
      <%
                if (request.getParameter("page1") != null) {
                    String pg1 = request.getParameter("page1");
            %>
            <jsp:include page="<%=pg1%>"></jsp:include>
            <%
                }
            %>

            </div>
            </div>
        <div class="clear"></div>
        

    </body>
</html>




<%-- 
    Document   : C_Logout.jsp
    Created on : 14 Dec, 2018, 3:50:38 PM
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
        <form method="post">
            <%
                session.invalidate();
                response.sendRedirect("Client.jsp");
            %>
        </form>
    </body>
</html>

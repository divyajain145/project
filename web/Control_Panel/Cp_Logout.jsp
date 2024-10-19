<%-- 
    Document   : Cp_Logout
    Created on : Apr 6, 2019, 11:52:54 AM
    Author     : Acer
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
                response.sendRedirect("Cp_Login.jsp");
            %>
        </form>
    </body>
</html>

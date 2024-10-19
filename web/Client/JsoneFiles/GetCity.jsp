
<%@page import="java.sql.*" %>
<%@page import="dbConnection.dbConnectionFile" %>
<%@page import="dbConnection.Client_register_method" %>
<%
    int state_id = Integer.parseInt(request.getParameter("stid"));
    Client_register_method crm=new Client_register_method();

    ResultSet rs = crm.clientRegister_ClassCity(state_id);
   while(rs.next())
   {
       out.print(rs.getString("id")+"|"+rs.getString("name")+",");
   }


%>

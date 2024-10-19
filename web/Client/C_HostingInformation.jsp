<%-- 
    Document   : C_HostingInformation
    Created on : 21 Feb, 2019, 10:21:38 AM
    Author     : bharat
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.hosting_register_master_method" %>
<%@page import="dbConnection.hosting_account_master_method" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int order_id=Integer.parseInt(request.getParameter("oder_id"));
            
        %>
        <div>
            <div class="uk-width-large-1-1 dbtitle" >
                <div class="hdb">
                    Dashboard / Hosting Information
                </div>
            </div>
        </div>


        <div class="dbtable">

            <div>
                <div class="uk-width-large-1-1 dbtitle" >
                    <div class="hdb1">
                        Hosting Detail Information :
                    </div>
                </div>
            </div>

            <div class="dblisttable">

                
              <table class="table table-striped table-hover">
                    <tr>
                        
                        <th style="width: 120px;">Username</th>
                        <th style="width: 100px;">Password</th>
                        <th style="width: 200px;">Link</th>
                    </tr>
                    <%
                        hosting_register_master_method hm=new hosting_register_master_method();
                        ResultSet rs=hm.hostingRegisterMaster_regId(order_id);
                        while(rs.next()){
                            int hosReg_Id=rs.getInt("Hosting_Register_Id");
                            hosting_account_master_method hm1=new hosting_account_master_method();
                            ResultSet rt=hm1.hostingAccountMaster_Select(hosReg_Id);
                            while(rt.next()){
                    %>
                    <tr>
                        <td><%=rt.getString("Hosting_Username")%></td>
                        
                        <td><%=rt.getString("Hosting_Password")%></td>
                        <td><a style="padding: 10px;" href="#"></a></td>
                    </tr>
                    <%
                            }
                        }
                   %>
                </table>
            </div>
        </div>

    </body>
</html>

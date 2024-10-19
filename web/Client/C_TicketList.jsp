<%-- 
    Document   : C_TicketList
    Created on : 13 Feb, 2019, 12:58:51 PM
    Author     : BRIGHT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.support_ticket_master_method" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int user_id=(Integer)session.getAttribute("user");
            String status="";
        %>
        
       <div>
                    <div class="uk-width-large-1-1 dbtitle" >
                        <div class="hdb">
                            Dashboard / Ticket
                        </div>
                    </div>
                </div>
                
            
        <div class="dbtable">
            
                <div>
                    <div class="uk-width-large-1-1 dbtitle" >
                        <div class="hdb1">
                            Ticket List :
                             <div class="btnticket">
                                 <a href="Client.jsp?page=C_Master.jsp?page1=C_openticket.jsp"><i class="fa " style="color: white"> New Ticket</i></a>
                        </div>
                        </div>
                       
                    </div>
                </div>
            
            <div class="dblisttable">
                
              
              <table class="table table-striped table-hover">
                    <tr>
                        <th style="width: 70px;">Department</th>
                        <th style="width: 200px;">Subject</th>
                        <th style="width: 50px;">Status</th>
                        <th style="width: 100px;">last Upload</th>
                        <th style="width: 50px;"> </th>
                        
                    </tr>
                   <%
                       support_ticket_master_method sm=new support_ticket_master_method();
                       ResultSet rs=sm.support_ticket_masterClassSelect1(user_id);
                       while(rs.next()){
                   %>
                    <tr>
                        <td><%=rs.getString("Support_Type")%></td>
                        <td><%=rs.getString("Subject")%></td>
                        <%
                            if(rs.getInt("Support_Status")==1){
                                status="active";
                            }
                            else{
                                status="inactive";
                            }
                        %>
                        <td><%=status%></td>
                        <td><%=rs.getString("Support_Date")%></td>
                        
                        <td><a style="padding: 10px;" href="Client.jsp?page=C_Master.jsp?page1=C_TicketView.jsp&ticket_id=<%=rs.getInt("Support_Ticket_Id")%>"><i class="fa fa-eye">View</i></a></td>
                        
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        
              
            
        </div>
    </body>
</html>

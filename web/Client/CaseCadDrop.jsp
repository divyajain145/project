<%-- 
    Document   : CaseCadDrop
    Created on : Jan 18, 2019, 11:17:09 AM
    Author     : Smarty
--%>
<%@page import="java.sql.*" %>
<%@page import="dbConnection.dbConnectionFile" %>
<%@page import="dbConnection.Client_register_method" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post">
            <select name="dropCountry" id="dropCountry" class="form-control">
                <option  value="select">--select country--</option>
                <% 
                    Client_register_method crm = new  Client_register_method();
                   
                    ResultSet rsstate = crm.clientRegister_ClassCountry();

                    while (rsstate.next()) {

                %>
                <option value="<%=rsstate.getString("id")%>"><%=rsstate.getString("name")%></option>
                <%  }%>
            </select>
            <select name="dropState" id="dropState">
                <option value="0">---Select State---</option>
            </select>
             <select name="dropCity" id="dropCity">
                <option value="0">---Select City---</option>
            </select>



        </form>
            <script src="jquery.js" type="text/javascript"></script>
       
        <script type="text/javascript">

            $(document).ready(function () {
                $("#dropCountry").change(function () {
                    $("#dropState").empty();
                    $("#dropState").append(" <option value='0'>---Selet State---</option>");
                    var StateVal = $("#dropCountry").val();
                    $.get("JsoneFiles/GetState.jsp", {stid: StateVal}, function (data) {
                        var dropData = data.split(",");
                        
                        for(var i=0;i<dropData.length;i++)
                        {
                            var cityDropVals = dropData[i].split("|");
                             $("#dropState").append("<option value='"+cityDropVals[0]+"'>"+cityDropVals[1]+"</option>");
                            
                        }
                       
                        
                      
                    });
                  

                });

            });



            $(document).ready(function () {
                $("#dropState").change(function () {
                    $("#dropCity").empty();
                    $("#dropCity").append(" <option value='0'>---Selet City---</option>");
                    var StateVal = $("#dropState").val();
                    $.get("JsoneFiles/GetCity.jsp", {stid: StateVal}, function (data) {
                        var dropData = data.split(",");
                        
                        for(var i=0;i<dropData.length;i++)
                        {
                            var cityDropVals = dropData[i].split("|");
                             $("#dropCity").append("<option value='"+cityDropVals[0]+"'>"+cityDropVals[1]+"</option>");
                            
                        }
                       
                        
                      
                    });
                  

                });

            });

        </script>
    </body>
</html>

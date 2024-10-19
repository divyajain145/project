<%-- 
    Document   : C_FAQs
    Created on : Dec 11, 2018, 10:20:08 AM
    Author     : Trojan
--%>

<%@page import="dbConnection.Client_faqs_method"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../Client/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Page Header -->
        <section id="idz-header-inner">
            <div class="uk-container uk-container-center">

                <div class="idz-page-title idz-padding-medium">
                    <div class="uk-grid">
                        <div class="uk-width-large-1-2 uk-width-medium-1-3">
                            <div class="idz-title">
                                <h1 class="">Faqs</h1>
                                <i class="uk-icon-server"></i>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <section class="idz-padding">
            <div class="uk-container uk-container-center">
                <div class="uk-grid uk-margin-large-bottom">
                    <div class="uk-width-large-1-1">

                        <div class="uk-accordion idz-accordion" data-uk-accordion>
                            <%
                                int val = 0;
                                Client_faqs_method fm = new Client_faqs_method();
                                ResultSet rs = fm.showFaqs();
                                while (rs.next()) {
                            %>
                            <div class="uk-form">
                                <br/>
                                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingOne">
                                            <h4 class="panel-title">
                                                <a role="button" class="btn-block" data-toggle="collapse" data-parent="#accordion" href="#collapseOne<%=rs.getString("FAQ_Id")%>" aria-expanded="true" aria-controls="collapseOne">
                                                   <%
                                                        out.print(rs.getString("FAQ_Question"));
                                                    %>
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne<%=rs.getString("FAQ_Id")%>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                            <div class="panel-body">
                                                <p>
                                                      <%
                                                        out.print(rs.getString("FAQ_Answer"));
                                                    %>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                               
                                <%
                                    }
                                %>       
                            </div>
                        </div>
                    </div>
                </div>
                <script src="../Client/js/bootstrap.min.js" type="text/javascript"></script>
        </section>

    </body>
</html>

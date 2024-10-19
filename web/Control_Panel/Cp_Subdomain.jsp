<%-- 
    Document   : Cp_Domain_Control
    Created on : 25 Feb, 2019, 10:43:18 AM
    Author     : BRIGHT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File" %>
<%@page import="dbConnection.hosting_register_master_method" %>
<%@page import="dbConnection.file_method" %>
<%@page  import="dbConnection.hostingplan_method" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String x="";
            float size = 0;
            String d_name = "";
            int disk_space = 0;
            int plan_id = 0;
            String hr_id = session.getAttribute("s1").toString();
            int hos_id = Integer.parseInt(hr_id);

        %>
        <div class="hk-pg-wrapper">
            <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item"><a href="#">Website & Domains</a></li>
                </ol>
            </nav>
            <!-- /Breadcrumb -->

            <!-- Container -->
            <div class="container">

                <!-- Title -->

                <!-- /Title -->

                <!-- Row -->
                <div class="row">
                    <div class="col-12">
                        <h4 class="hk-pg-title "><span class="pg-title-icon"><span class="feather-icon"><i data-feather=""></i></span></span>Website & Domains</h4>

                        <div class="hk-pg-header" style="margin-bottom: -5px;">

                            <div class="row col-12">
                                <div class="col-9" style="float: left;">
                                    <div class="button-list">


                                        <button class="btn btn-icon btn-danger btn-icon-style-1"><span class="btn-icon-wrap"><i class="icon-settings"></i></span></button>

                                        <button class="btn btn-icon btn-success btn-icon-style-1"><span class="btn-icon-wrap"><i class="icon-question"></i></span></button>

                                    </div>
                                </div>

                            </div>

                        </div>
                        <%                            String p = request.getRealPath("/hosting/");
                            String a = "www.";

                            hosting_register_master_method hrm = new hosting_register_master_method();
                            ResultSet rs = hrm.hostingRegisterMaster_dom_name(Integer.parseInt(session.getAttribute("s1").toString()));
                            if (rs.next()) {
                                x=a + rs.getString("Domain_Name");
                                d_name = p + a + rs.getString("Domain_Name") + "/subdomain";
                            }
                            File folder1 = new File(d_name);
                            File file1[] = folder1.listFiles();
                            for (File f1 : file1) {
                                String y=x+"/"+f1.getName();
                        %>
                        <div class="alert alert-inv alert-inv-info" style="margin-bottom: 0px;" >
                            <%=f1.getName()%>
                        </div>

                        <section class="hk-sec-wrapper" style="padding-top: 3px;">

                            <p class="mb-10">Website : <a href="" style="margin-right: 10px;"><i class="fa fa-folder"></i><%=y%></a> <span style="margin-right: 10px;">Ip address: 168:123:98:1</span> <span style="margin-right: 10px;">System User :depple</span> </p>

                            <div class="btn-group btn-group-sm mb-0" role="group" aria-label="Basic example">
                                <a href="Cp_Master.jsp?page=Cp_SubFile.jsp&subdomain=<%=f1.getName()%>" class="btn btn-secondary"> File Manager</a>
                               

                            </div>

                        </section>
                        <%
                            }

                        %>

                    </div>


                </div>


                <!-- /Row -->
            </div>
            <!-- /Container -->


        </div>

    </body>
</html>

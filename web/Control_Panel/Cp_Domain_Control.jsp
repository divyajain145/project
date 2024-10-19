
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
            float size=0;
            String d_name = "";
            int disk_space=0;
            int plan_id=0;
            String hr_id = session.getAttribute("s1").toString();
            int hos_id=Integer.parseInt(hr_id);
            hosting_register_master_method hrm = new hosting_register_master_method();
            ResultSet r8=hrm.hostingRegisterMaster_select1(hos_id);
            if(r8.next()){
                plan_id=r8.getInt("Hosting_Plan_Id");
            }
            hostingplan_method hpm=new hostingplan_method();
            ResultSet r9=hpm.hostingplan_listClassSelect(plan_id);
            if(r9.next()){
                disk_space=r9.getInt("Disk_Space");
            }
            int disk_spaceMb=disk_space*1024;
        %>
        <form method="post">
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
                    <div class="col-9">
                        <h4 class="hk-pg-title "><span class="pg-title-icon"><span class="feather-icon"><i data-feather=""></i></span></span>Website & Domains</h4>

                        <div class="hk-pg-header" style="margin-bottom: -5px;">

                            <div class="row col-12">
                                <div class="col-9" style="float: left;">
                                    <div class="button-list">


                                        <button class="btn btn-icon btn-danger btn-icon-style-1"><span class="btn-icon-wrap"><i class="icon-settings"></i></span></button>

                                        <button class="btn btn-icon btn-success btn-icon-style-1"><span class="btn-icon-wrap"><i class="icon-question"></i></span></button>

                                    </div>
                                </div>
                                <div class="col-3" style="float: right;"> 
                                    <div class="button-list">
                                        <button class="btn btn-dark btn-wth-icon icon-wthot-bg btn-rounded icon-right btn-lg">
                                            <a href="Cp_Master.jsp?page=Cp_Add_Subdomain.jsp" class="btn-text">Add Subdomain</a>
                                            <span class="icon-label">
                                                <span class="feather-icon">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></span> </span>
                                        </button>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <%
                            file_method fm = new file_method();

                            ResultSet rs = hrm.hostingRegisterMaster_hosregId(Integer.parseInt(hr_id));
                            while (rs.next()) {
                                d_name = rs.getString("Domain_Name");

                            }

                            String p = request.getRealPath("/hosting/");
                            String domain_name = p + "www." + d_name;
                            File folder = new File(domain_name);
                            long byteSize = fm.getFolderSize(folder);
                            double MBsize = byteSize /(1024*1024);
                            size = (float) MBsize;
                            float progress_size=(size*100)/disk_spaceMb;
                            
                        %>
                        <div class="alert alert-inv alert-inv-info" style="margin-bottom: 0px;" >
                            <%=d_name%>
                        </div>
                        <section class="hk-sec-wrapper" style="padding-top: 3px;">

                            <p class="mb-10">Website : <a href="" style="margin-right: 10px;"><i class="fa fa-folder"></i> httpdocs/</a> <span style="margin-right: 10px;">Ip address: 168:123:98:1</span> <span style="margin-right: 10px;">System User :depple</span> </p>


                            <div class="btn-group btn-group-sm mb-0" role="group" aria-label="Basic example">

                                <button type="button" class="btn btn-secondary"> Preview</button>
                            </div>
                            <div class="btn-group btn-group-sm mb-0" role="group" aria-label="Basic example">
                                <button type="button" class="btn btn-secondary"> File Manager</button>
                                <button type="button" class="btn btn-secondary"> Mail</button>

                            </div>

                            <hr>
                            <div class="row mb-25">

                                <div class="col-4"><a href="Cp_Master.jsp?page=Cp_File.jsp">File Manager</a></div>

                                <div class="col-4"><a href="Cp_Master.jsp?page=Cp_Mail.jsp">Mail Manager</a></div>

                                <div class="col-4"><a href="Cp_Master.jsp?page=Cp_Subdomain.jsp">Sub Domain</a></div>

                            </div>
                            <div class="row mb-25">

                                <!--<div class="col-4"><a href="">FTP Account</a></div>

                                <div class="col-4"><a href="">FTP Access</a></div>

                                <div class="col-4"><a href="">Hosting Settings</a></div>-->

                            </div>
                            
                        </section>


                    </div>

                    <div class="col-3">
                        <section class="hk-sec-wrapper">
                            <div class="row">

                                <div class="col-12"><a href=""><i class="fa fa-database"></i> Database</a></div>

                                <div class="col-12"><a href=""><i class="fa fa-mail-forward"></i> Outgoing Mail Control</a></div>

                            </div>

                        </section>

                        <section class="hk-sec-wrapper">

                            <div class="alert alert-inv alert-inv-primary col-12" >
                                Resource Usage
                            </div>
                            <h6> Disk Space</h6>
                            <p><%=size%>/<%=disk_spaceMb%> Mb</p>    
                            <div class="progress mb-20">
                                <div class="progress-bar progress-bar-striped bg-info" style="width: <%=progress_size%>%;" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                
                            </div>
                            <!--<h6> Traffic</h6>
                            <div class="progress">
                                <div class="progress-bar  progress-bar-striped bg-danger progress-bar-animated" style="width:30%;" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="26"></div>
                            </div>
                            -->
                            <hr>
                            <div class="col-12"><a href=""><i class="icon-chart"></i> View More Statistic</a></div>
                        </section>
                    </div>
                </div>
                <!-- /Row -->
            </div>
            <!-- /Container -->
        </div>
        </form>
    </body>
</html>

<%-- 
    Document   : Cp_file
    Created on : 26 Feb, 2019, 10:44:36 AM
    Author     : BRIGHT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="dbConnection.hosting_register_master_method" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String d_name = "";
            String p = request.getRealPath("/hosting/");

            if (request.getParameter("remove") != null) {
                String[] rem = request.getParameterValues("check");

                if (rem != null) {
                    for (int i = 0; i < rem.length; i++) {
                        //out.print("<script>alert('"+rem[i]+"')</script>");
                        String a = "www.";
                        hosting_register_master_method hrm = new hosting_register_master_method();
                        ResultSet rs = hrm.hostingRegisterMaster_dom_name(Integer.parseInt(session.getAttribute("s1").toString()));
                        if (rs.next()) {
                            d_name = a + rs.getString("Domain_Name");
                        }
                        String folder = p + "/" + d_name + "/" + rem[i];
                        File f = new File(folder);
                        f.delete();
                    }

                }

            }
        %>
        <div class="hk-pg-wrapper">
            <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent" style="margin-bottom: 4px;">
                    <li class="breadcrumb-item"><a href="#">File</a></li>
                </ol>

            </nav>

            <!-- /Breadcrumb -->

            <!-- Container -->
            <div class="container">

                <!-- Title -->
                <div class="hk-pg-header"style="margin-bottom: 6px;" >
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather=""></i></span></span>File Manager for :- <span style="color: #007bff;"> xipratechnology.com</span></h4>


                </div>
                <!-- /Title -->

                <!-- Row -->

                <div class="row">

                    <div class="col-3">
                        <section class="hk-sec-wrapper">
                            <div class="row">
                                <div class="col-sm">
                                    <div class="dd" id="nestable">
                                        <ol class="dd-list">
                                            
                                            <li class="dd-item" data-id="1">
                                                <div class="dd-handle"> Folder  </div>
                                            </li>



                                            <%
                                                File folder = new File(p);
                                                String a = "www.";
                                                hosting_register_master_method hrm = new hosting_register_master_method();
                                                ResultSet rs = hrm.hostingRegisterMaster_dom_name(Integer.parseInt(session.getAttribute("s1").toString()));
                                                if (rs.next()) {
                                                    d_name = a + rs.getString("Domain_Name");
                                            %>
                                            <li class="dd-item" data-id="2"><button class="dd-collapse" data-action="collapse" type="button">Collapse</button><button class="dd-expand" data-action="expand" type="button">Expand</button>
                                                <div class="dd-handle"><%=d_name%> </div>

                                                <%

                                                    File folder1 = new File(p + "/www." + rs.getString("Domain_Name"));
                                                    File file1[] = folder1.listFiles();
                                                    for (File f1 : file1) {

                                                %>
                                                <ol class="dd-list">
                                                    <li class="dd-item" data-id="3">
                                                        <div class="" style="font-weight: 500;
                                                             margin: 0 0 6px;
                                                             font-size: 14px;
                                                             padding: 8px 15px;
                                                             background: #fff;
                                                             color: #324148;
                                                             height: 38px;
                                                             border: 2px solid #e0e3e4;
                                                            "> 
                                                            <a href="Cp_Master.jsp?page=Cp_EditFile.jsp&file_name=<%=f1.getName()%>" onclick="return true;" style="display: block;">

                                                                <%=f1.getName()%>

                                                            </a>
                                                        </div>
                                                    </li>

                                                </ol>
                                                <%}
                                                    }%>
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </section>                        

                    </div>

                    <div class="col-9">
                        <section class="hk-sec-wrapper">




                            <div class="btn-group btn-group-sm mb-10" role="group" aria-label="Basic example">
                                <button type="button" class="btn btn-secondary"><a href="Cp_Master.jsp?page=Cp_UploadFile.jsp" style="color: white;"><i class="fa fa-upload"></i> Upload</a></button>

                                <div class="btn-group">
                                    <div class="dropdown">
                                        <button class="btn btn-secondary  small"><a href="Cp_Master.jsp?page=Cp_CreateFile.jsp&domain_name=<%=d_name%>" style="color: white;"> <i class="fa fa-plus"> </i> New</a></button>

                                    </div>
                                </div>

                            </div>

                            <div class="btn-group btn-group-sm mb-10" role="group" aria-label="Basic example">
                                <button type="submit" id="remove" name="remove" class="btn btn-secondary  small"><i class="fa fa-plus"></i> Remove</button>

                            </div>

                            <div class="row">
                                <div class="col-sm">


                                    <nav class="hk-breadcrumb" >
                                        <ol class="breadcrumb breadcrumb-light bg-transparent">
                                            <li class="breadcrumb-item"> Home Directory</li>
                                            <li class="breadcrumb-item"> Httpdocs</li>
                                        </ol>

                                    </nav>
                                </div>
                            </div>



                            <div class="row">
                                <div class="col-12">
                                    <section class="hk-sec-wrapper">
                                        <div class="row">
                                            <div class="col-sm">
                                                <div class="table-wrap">
                                                    <div id="datable_1_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <table id="datable_1" class="table table-hover w-100 display pb-30 dataTable dtr-inline" role="grid" aria-describedby="datable_1_info">
                                                                    <thead>
                                                                        <tr role="row">
                                                                            <th class="sorting_asc" tabindex="0" aria-controls="datable_1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">
                                                                                <div class="col-md-4 mt-15">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" class="custom-control-input" id="customCheck2" >

                                                                                    </div>
                                                                                </div>
                                                                            </th>
                                                                            <th class="sorting" tabindex="0" aria-controls="datable_1" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending">Name</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <%

                                                                            File folder1 = new File(p + "/www." + rs.getString("Domain_Name"));

                                                                            File file1[] = folder1.listFiles();
                                                                            for (File f1 : file1) {

                                                                        %>
                                                                        <tr role="row" class="odd">
                                                                            <td tabindex="0" class="sorting_1">
                                                                                <div class="col-md-1 mt-1">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" name="check" value="<%=f1.getName()%>" class="custom-control-input" id="<%=f1.getName()%>">
                                                                                        <label class="custom-control-label mb-25" for="<%=f1.getName()%>"></label>

                                                                                    </div>
                                                                                </div>
                                                                            </td>

                                                                            <td class="col-9"><i class="fa fa-folder"></i><a href="" style="color: #0090cf;"> <%=f1.getName()%></a></td>

                                                                        </tr>
                                                                        <%
                                                                            }%>
                                                                    </tbody>

                                                                </table>
                                                            </div></div>
                                                       </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
                <!-- /Row -->
            </div>
            <!-- /Container -->
        </div>
    </body>
</html>

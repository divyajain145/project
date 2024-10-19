<%-- 
    Document   : Cp_CreateFile
    Created on : 6 Mar, 2019, 1:46:50 PM
    Author     : BRIGHT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.hosting_register_master_method"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String d_name="";
            String a = "www.";
            hosting_register_master_method hrm = new hosting_register_master_method();
            ResultSet rs = hrm.hostingRegisterMaster_dom_name(Integer.parseInt(session.getAttribute("s1").toString()));
            if (rs.next()) {
                d_name = a + rs.getString("Domain_Name");
            }
                if (request.getParameter("NewFile") != null) {
                    String fname = request.getParameter("fname");
                    String fextention = request.getParameter("fextension");

                    String file_name = fname + "." + fextention;
                    String p = request.getRealPath("/hosting");
                    String folder = p + "/" + d_name + "/" + file_name;
                    File f = new File(folder);
                    f.createNewFile();
                }
        %>

        <div class="hk-pg-wrapper">
            <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item "><a href="#">Create File</a></li>
                </ol>
            </nav>
            <!-- /Breadcrumb -->

            <!-- Container -->
            <div class="container">

                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather=""></i></span></span>Create File</h4>

                </div>
                <!-- /Title -->

                <!-- Row -->
                <div class="row">
                    <div class="col-12">
                        <section class="hk-sec-wrapper">

                            <form action="Cp_Master.jsp?page=Cp_CreateFile.jsp" method="post">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Create File</span>
                                        </div>
                                        <input type="text" class="form-control" name="fname" placeholder="file name">
                                        <input type="text" class="form-control" name="fextension" placeholder="Extention">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm">
                                        <div class="button-list">
                                            <button type="submit" name="NewFile" id="NewFile" class="btn btn-primary">New File</button>

                                        </div>
                                    </div>
                                </div>




                            </form> 

                    </div>

                    <hr>



                </div>

            </div>


            <!-- /Row -->
        </div>


    </body>
</html>

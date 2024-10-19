<%-- 
    Document   : Cp_UploadFile
    Created on : 6 Mar, 2019, 11:41:13 AM
    Author     : BRIGHT
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-strict.dtd">
<html xmlns="http://www.w3.ord/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="application/xhtml+xml; text/html; charset=UTF-8">
            <title>JSP Page</title>
            <script src="upload/bootstrap.min.js" type="text/javascript"></script>
            <script src="upload/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
            <script src="upload/popper.min.js" type="text/javascript"></script>
    </head>
    <body>

        <div class="hk-pg-wrapper">
            <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent">
                    <li class="breadcrumb-item "><a href="#">Website & Domain</a></li>
                </ol>
            </nav>
            <!-- /Breadcrumb -->

            <!-- Container -->
            <div class="container">

                <!-- Title -->
                <div class="hk-pg-header">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather=""></i></span></span>Upload File</h4>

                </div>
                <!-- /Title -->

                <!-- Row -->
                <form action="${pageContext.request.contextPath}/Control_Panel/Cp_UploadFile" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-12">
                            <section class="hk-sec-wrapper">
                                <%
                                    String hr_id = session.getAttribute("s1").toString();
                                %>

                                <div class="hk-pg-header">
                                    <h5 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather=""></i></span></span>File Name</h5>

                                </div>
                                <div class="form-group">
                                    <div class="input-group">

                                        <div class="custom-file">
                                            <input type="file" name="fname" size="50" id="fname"/>
                                            <input type="hidden" name="hid1" value="<%=session.getAttribute("s1").toString()%>"/>


                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm">
                                        <div class="button-list">
                                            <button type="submit" id="btnUpload" name="Upload" class="btn btn-primary">Upload File</button>

                                        </div>
                                    </div>
                                </div>
                        </div>

                        <hr>


                    </div>
                </form>
            </div>


            <!-- /Row -->
        </div>
        <!-- /Container -->


        <script type="text/javascript">
            document.getElementById("fname").onchange = function () {
                var fi = document.getElementById("fname");
                if (fi.files.length > 0) {
                    var fileUp = fi.files[0];
                    var fS = Math.round((fileUp.size / 1024));
                    var name = fileUp.name;
                    var data = name.split('.');
                    document.getElementById("hidName").value = name;
                    localStorage.setItem("fname", name);
                    localStorage.setItem("size", fS);
                    localStorage.setItem("extension", data[1]);
                    console.log(data[1]);
                    console.log(fS);
                    console.log(name);

                }

            };
        </script>

    </body>
</html>

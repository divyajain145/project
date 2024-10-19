<%-- 
    Document   : Cp_EditFile
    Created on : Mar 8, 2019, 10:55:05 AM
    Author     : Acer
--%>

<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.hosting_register_master_method"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>

<%
    if(request.getParameter("SaveFile") != null){
  
        String text=request.getParameter("editor");
        
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/css_upload/editorstyle.css" rel="stylesheet" type="text/css"/>
        <link href="../css/css_upload/base16-dark.css" rel="stylesheet" type="text/css"/>
        <script src="../js/js_upload/edit.js" type="text/javascript"></script>
        <script src="../js/js_upload/htmlmixed.js" type="text/javascript"></script>
        <script src="../js/js_upload/css.js" type="text/javascript"></script>
        <script src="../js/js_upload/htmlembedded.js" type="text/javascript"></script>
        <script src="../js/js_upload/javascript.js" type="text/javascript"></script>
        <script src="../js/js_upload/php.js" type="text/javascript"></script>
        <script src="../js/js_upload/xml.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            String d_name = "";
            String a = "www.";
                                        
            String file_name = request.getParameter("file_name");
            String p = request.getRealPath("/hosting/");
            hosting_register_master_method hrm = new hosting_register_master_method();
                                        ResultSet rs = hrm.hostingRegisterMaster_dom_name(Integer.parseInt(session.getAttribute("s1").toString()));
                                        if (rs.next()) {
                                            d_name = a + rs.getString("Domain_Name");
                                        }
                                        String fname = p + "/" + d_name + "/" + file_name;

            if (request.getParameter("SaveFile") != null) {
                                            String data = request.getParameter("editor");
                                            
                                            FileWriter writer = new FileWriter(fname);
                                            BufferedWriter buffer = new BufferedWriter(writer);
                                            buffer.write(data);
                                            buffer.close();
                                        }

        %>
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
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather=""></i></span></span>Edit File</h4>

                </div>
                <!-- /Title -->

                <!-- Row -->
                <div class="row">
                    <div class="col-12">
                        <section class="hk-sec-wrapper">

                            <form>
                                <div class="hk-pg-header">
                                    <h5 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather=""></i></span></span>File Name : <%=file_name%></h5>

                                </div>
                                <textarea name="editor" id="editor" class="html form-control mt-15" value="" placeholder="textarea">
                                    
<%
                                        
                                        FileReader fr = new FileReader(fname);
                                        BufferedReader br = new BufferedReader(fr);

                                        int i;
                                        while ((i = br.read()) != -1) {
                                            out.print((char) i);
                                        }
                                        br.close();
                                        fr.close();
                                        
                                    %>
                               </textarea>

                                <div class="row">
                                    <div class="col-sm">
                                        <div class="button-list">
                                            <input type="submit" name="SaveFile" id="SaveFile" class="btn btn-primary" value="Save File" />
                                         

                                        </div>
                                    </div>
                                </div>

                                <hr>

                            </form>

                    </div>

                </div>

                <!-- /Row -->
            </div>
            <!-- /Container -->
<script src="../js/js_upload/app.js" type="text/javascript"></script>

    </body>
</html>

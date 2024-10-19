<%-- 
    Document   : Cp_Add_Subdomain
    Created on : 25 Feb, 2019, 1:46:06 PM
    Author     : BRIGHT
--%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="dbConnection.hosting_register_master_method"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.ftp_master"%>
<%@page import="dbConnection.subdomain_master" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int val = 0, x = 0;
            String d_name = "";
            String p = request.getRealPath("/hosting/");
            String p1 = request.getRealPath("/Control_Panel");
            File folder = new File(p);
            String a = "www.";
            hosting_register_master_method hrm = new hosting_register_master_method();
            ResultSet rs1 = hrm.hostingRegisterMaster_dom_name(Integer.parseInt(session.getAttribute("s1").toString()));
            if (rs1.next()) {
                d_name = rs1.getString("Domain_Name");
            }

            int subdomain_id = 0;
            if (request.getParameter("ok") != null) {

                String subdomain = a + request.getParameter("subdomain") + "." + d_name;
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                String type = "subdomain";
                int stats = 0;
                int hr_id = Integer.parseInt(session.getAttribute("s1").toString());
                int status = 0;

                subdomain_master sm = new subdomain_master();
                ResultSet rs2 = sm.subdomain_masterSelect(hr_id);
                while (rs2.next()) {
                    if (rs2.getString("Subdomain_Title").equals(subdomain)) {
                        val = 2;
                    }
                }

                ftp_master fm = new ftp_master();
                ResultSet rs3 = fm.ftp_masterSelect();
                while (rs3.next()) {
                    if (rs3.getString("Ftp_Username").equals(name)) {
                        x = 2;
                    }
                }
                if (val == 2 && x == 2) {
                    out.print("<script>alert('subdomain_title and username already exist');</script>");
                } else if (val == 2) {
                    out.print("<script>alert('subdomain_title already exist');</script>");
                } else if (x == 2) {
                    out.print("<script>alert('username already exist');</script>");
                } else {
                    val=sm.subdomain_masterInsert(hr_id, subdomain, status);
                    ResultSet rs = sm.subdomain_masterMaxId();
                    if (rs.next()) {
                        subdomain_id = rs.getInt("sid");
                    }
                    x=fm.ftp_masterInsert(subdomain_id, type, name, password, stats);
                    String folder_name = "www." + d_name + "/subdomain/" + subdomain;

                    String file_name = "index.jsp";
                    String folder1 = p + "/" + folder_name;

                    File f = new File(folder1);
                    if (!f.exists()) {
                        if (f.mkdirs()) {
                            File file = new File(folder1 + "/" + file_name);
                            file.createNewFile();
                        }
                    }

                    FileInputStream instream = null;
                    FileOutputStream outstream = null;

                       String y=p1+"/index.html";
                    File infile = new File(y);
                    File outfile = new File(folder1+"/index.jsp");

                    instream = new FileInputStream(infile);
                    outstream = new FileOutputStream(outfile);

                    byte[] buffer = new byte[1024];

                    int length;
                    
                    while ((length = instream.read(buffer)) > 0) {
                        outstream.write(buffer, 0, length);
                    }
                    
                    instream.close();
                    outstream.close();
                       
                    out.print("<script>alert('successfully inserted');</script>");
                }
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
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather=""></i></span></span>Add Subdomain</h4>

                </div>
                <!-- /Title -->

                <!-- Row -->
                <div class="row">
                    <div class="col-12">
                        <section class="hk-sec-wrapper">

                            <form>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Subdomain Name </span>
                                        </div>
                                        <div class="form-control" style="text-align: center;">www.</div>
                                        <input type="text" name="subdomain" id="subdomain" class="form-control">
                                        <div class="form-control">.<%=d_name%></div>
                                    </div>
                                </div>

                                <hr>
                                <h5 class="hk-sec-title">FTP Setting</h5>
                                <div class="row">
                                    <div class="col-md-5 mt-15">
                                        <div class="form-inline">
                                            <div class="form-group">
                                                <label for="inputPassword6">Username</label>
                                                <input type="text" id="name" name="name" class="form-control mx-sm-3" aria-describedby="passwordHelpInline">
                                                <small id="passwordHelpInline" class="text-muted d-block">
                                                </small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-5 mt-15">
                                        <div class="form-inline">
                                            <div class="form-group">
                                                <label for="inputPassword6">Password</label>
                                                <input type="password" id="password" name="password" class="form-control mx-sm-3" aria-describedby="passwordHelpInline">
                                                <small id="passwordHelpInline" class="text-muted d-block">
                                                </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm">
                                        <div class="button-list">

                                            <button name="ok" class="btn btn-success btn-wth-icon btn-rounded icon-right btn-sm"><span class="btn-text">Ok</span> <span class="icon-label"><i class="fa fa-check"></i> </span></button>

                                        </div>
                                    </div>
                                </div>





                            </form>




                        </section>

                    </div>

                </div>


                <!-- /Row -->
            </div>
            <!-- /Container -->



        </div>


    </body>
</html>

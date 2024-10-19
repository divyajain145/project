<%-- 
    Document   : Cp_Create_Email
    Created on : 25 Feb, 2019, 2:25:29 PM
    Author     : BRIGHT
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.mail_account_master" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email="",name="",password="",limit="";
            
            if (request.getParameter("ok") != null) {
                int val=0;
                email = request.getParameter("email");
                name = request.getParameter("username");
                password = request.getParameter("password");
                limit = request.getParameter("size");
                mail_account_master ma = new mail_account_master();
                if(request.getParameter("edit")!=null){
                    val=ma.mail_account_masterClassUpdate(Integer.parseInt(request.getParameter("edit")), email, name, password, limit);
                        out.print("<script>alert('Successfully Update Your Data.');window.location.href='Cp_Master.jsp?page=Cp_Create_Email.jsp';</script>");
                }
                else{
                int hr_id = Integer.parseInt(session.getAttribute("s1").toString());
                int status = 0;
                
                val = ma.mail_account_masterInsert(hr_id, email, name, password, limit, status);
                if (val == 2) {
                    out.print("<script>alert('email already exist');</script>");
                } else if (val == 3) {
                    out.print("<script>alert('Username already exist');</script>");
                } else {

                    out.print("<script>alert('successfully inserted');</script>");
                }
                }
            }

            if (request.getParameter("edit") != null) {
                int mail_id = Integer.parseInt(request.getParameter("edit"));
                mail_account_master m1=new mail_account_master();
                ResultSet rs3 = m1.mail_account_masterClassSelect2(mail_id);
                while (rs3.next()) {
                    email = rs3.getString("Mail_Address");
                    name=rs3.getString("Mail_Username");
                    password=rs3.getString("Mail_Password");
                    limit=rs3.getString("Mail_Limit");
                }
            }
        %>

        <div class="hk-pg-wrapper">
            <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent" style="margin-bottom: 4px;">
                    <li class="breadcrumb-item "><a href="#">Mail</a></li>
                    <li class="breadcrumb-item "><a href="#">Email Addresses</a></li>
                </ol>
            </nav>
            <!-- /Breadcrumb -->

            <!-- Container -->
            <div class="container">

                <!-- Title -->
                <div class="hk-pg-header" style="margin-bottom: 4px;">
                    <h4 class="hk-pg-title"><span class="pg-title-icon"><span class="feather-icon"><i data-feather=""></i></span></span>Create Email Address</h4>

                </div>

                <div class="row">
                    <div class="col-12">
                        <section class="hk-sec-wrapper">
                            <div class="col-sm">
                                <div class="accordion" id="accordion_1">
                                    <div class="card">
                                        <div class="card-header d-flex justify-content-between activestate">
                                            <a role="button" data-toggle="collapse" href="#collapse_1" aria-expanded="true" class="">General</a>
                                        </div>
                                        <div id="collapse_1" class="collapse show" data-parent="#accordion_1" role="tabpanel" style="">
                                            <div class="card-body pa-15"> 
                                                <!--General setting-->    

                                                <form action="Cp_Create_Email.jsp <% if (request.getParameter("edit") != null) {
                                                        out.print("?edit=" + request.getParameter("edit"));
                                                    }
                                                      %>" method="post">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text">Email Address</span>
                                                            </div>
                                                            <input type="text" name="email" id="email" value="<%=email%>" class="form-control">

                                                        </div>

                                                        <div class="col-md-12 mt-15">
                                                            <div class="custom-control custom-checkbox checkbox-primary">
                                                                <input type="checkbox" class="custom-control-input" id="customCheck4" checked="">
                                                                <label class="custom-control-label" for="customCheck4">Access to the Customer panel</label>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-5 mt-15">
                                                                <div class="form-inline">
                                                                    <div class="form-group">
                                                                        <label for="inputPassword6">Username</label>
                                                                        <input type="text" value="<%=name%>" id="username" name="username" class="form-control mx-sm-3" aria-describedby="passwordHelpInline">
                                                                        <small id="passwordHelpInline" class="text-muted d-block">
                                                                        </small>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-5 mt-15">
                                                                <div class="form-inline">
                                                                    <div class="form-group">
                                                                        <label for="inputPassword6">Password</label>
                                                                        <input type="password" value="<%=password%>" id="password" name="password" class="form-control mx-sm-3" aria-describedby="passwordHelpInline">
                                                                        <small id="passwordHelpInline" class="text-muted d-block">
                                                                        </small>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <hr>
                                                        <div class="col-md-3 mt-15">
                                                            <div class="custom-control custom-checkbox checkbox-primary">
                                                                <input type="checkbox" class="custom-control-input" id="customCheck1" checked="">
                                                                <label class="custom-control-label" for="customCheck1">Mailbox</label>
                                                            </div>    
                                                        </div>


                                                        <div class="col-md-8 mt-15">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" id="customRadio2" name="customRadio" checked="" class="custom-control-input">
                                                                <label for="customRadio2" class="custom-control-label col-md-6 col-sm-12 col-12">

                                                                    <input type="number" class="small" value="30" min="0" max="100" step="10" style="display: none;">
                                                                    <input type="number" name="size" value="<%=limit%>" id="size" style="text-align: center" class="form-control">

                                                                </label>
                                                            </div>

                                                        </div>
                                                        <p class="mb-25">Size in mb</p>
                                                        <hr>






                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm">
                                                            <div class="button-list">

                                                                <button name="ok" class="btn btn-success btn-wth-icon btn-rounded icon-right btn-sm"><span class="btn-text">Ok</span> <span class="icon-label"><i class="fa fa-check"></i> </span></button>

                                                            </div>
                                                        </div>
                                                    </div>




                                                </form>



                                            </div>
                                        </div>
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

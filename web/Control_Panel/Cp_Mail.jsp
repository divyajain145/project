<%-- 
    Document   : Cp_Mail
    Created on : 26 Feb, 2019, 9:46:00 AM
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
            int val=0;
            if (request.getParameter("Delete") != null) {
                int mail_id = Integer.parseInt(request.getParameter("Delete"));
                mail_account_master m1 = new mail_account_master();
                val = m1.mail_account_masterClassDelete(mail_id);
                if (val > 0) {
                    out.print("<script>alert('successfully delete your data');window.location.href='Cp_Master.jsp?page=Cp_Mail.jsp';</script>");
                }
            }
            if (request.getParameter("remove") != null) {
                String[] rem = request.getParameterValues("check");

                if (rem != null) {
                    for (int i = 0; i < rem.length; i++) {
                        int m_id = Integer.parseInt(rem[i]);
                        mail_account_master m1 = new mail_account_master();
                        val = m1.mail_account_masterClassDelete(m_id);

                    }
                    if (val > 0) {
                        out.print("<script>alert('successfully delete your data');window.location.href='Cp_Master.jsp?page=Cp_Mail.jsp';</script>");
                    }
                }
            }
        %>
        <div class="hk-pg-wrapper">
            <!-- Breadcrumb -->
            <nav class="hk-breadcrumb" aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light bg-transparent" style="margin-bottom: 5px;">
                    <li class="breadcrumb-item "><a href="#">Mail</a></li>
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
                        <section class="hk-sec-wrapper"  >
                            <p class="mb-0">
                                Create and manage email account associated with your domain 
                            </p>
                            <form >
                                <div class="row mb-10" >
                                    <div class="button-list col-8" >
                                        <a href="Cp_Master.jsp?page=Cp_Create_Email.jsp" class="icon-label btn btn-primary btn-wth-icon icon-wthot-bg btn-small btn-text"><i class="fa fa-plus"></i>  Create Email Address</a>    

                                        <button type="submit" id="remove" name="remove" class="icon-label btn btn-primary btn-wth-icon icon-wthot-bg btn-small btn-text"><i class="fa fa-close"></i> Remove</button>

                                    </div>



                                </div>




                                <div class="row">
                                    <div class="col-12">
                                        <section class="hk-sec-wrapper" style="padding-top: 9px;">
                                            <div class="row">
                                                <div class="col-sm">
                                                    <div class="table-wrap">
                                                        <div id="datable_1_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <table id="datable_1" class="table table-hover w-100 display pb-30 dataTable dtr-inline" role="grid" aria-describedby="datable_1_info">
                                                                        <thead style="height: 10px;">
                                                                            <tr role="row">
                                                                                <th class="sorting_asc" tabindex="0" aria-controls="datable_1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">
                                                                                    <div class="col-md-0 mt-0">
                                                                                        <div class="custom-control custom-checkbox">
                                                                                            <input type="checkbox" class="custom-control-input" id="customCheck2" checked="">
                                                                                            <label class="custom-control-label" for="customCheck2">All</label>
                                                                                        </div>
                                                                                    </div>
                                                                                </th>
                                                                                <th class="sorting" tabindex="0" aria-controls="datable_1" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending">Email Addres</th>
                                                                                <th class="sorting" tabindex="0" aria-controls="datable_1" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending">User</th>
                                                                                <th class="sorting" tabindex="0" aria-controls="datable_1" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending">Usage</th>
                                                                                <th class="sorting" tabindex="0" aria-controls="datable_1" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending"></th>
                                                                            </tr>
                                                                        </thead>

                                                                        <tbody>
                                                                            <%
                                                                                mail_account_master m1 = new mail_account_master();
                                                                                int hosting_id = Integer.parseInt(session.getAttribute("s1").toString());
                                                                                ResultSet rs = m1.mail_account_masterClassSelect1(hosting_id);
                                                                                while (rs.next()) {
                                                                            %>
                                                                            <tr role="row" class="odd">
                                                                                <td tabindex="0" class="sorting_1">
                                                                                    <div class="col-md-2 mt-8">
                                                                                        <div class="custom-control custom-checkbox">
                                                                                            <input type="checkbox" name="check" value="<%=rs.getInt("Mail_Account_Id")%>" class="custom-control-input" id="<%=rs.getInt("Mail_Account_Id")%>">
                                                                                            <label class="custom-control-label" for="<%=rs.getInt("Mail_Account_Id")%>">Check</label>
                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><a href="" style="color: #0090cf;"><%=rs.getString("Mail_Address")%></a></td>
                                                                                <td><%=rs.getString("Mail_Username")%></td>
                                                                                <td>
                                                                                    <div class="progress progress-bar-sm">
                                                                                        <div class="progress-bar bg-info w-65" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                    <div>
                                                                                        <p class="mb-1">

                                                                                            <code>0 Mb</code>
                                                                                            /
                                                                                            <code><%=rs.getString("Mail_Limit")%> Mb</code>
                                                                                        </p>

                                                                                    </div>

                                                                                </td>
                                                                                <td>
                                                                                    <div class="button-list">
                                                                                        <td><a href="Cp_Master.jsp?page=Cp_Create_Email.jsp?edit=<%=rs.getString("Mail_Account_Id")%>"><i style="color: black;" class="icon-pencil"></i></a></td>
                                                                                        <td><a href="Cp_Master.jsp?page=Cp_Mail.jsp?Delete=<%=rs.getString("Mail_Account_Id")%>" onclick=""><i style="color: black;" class="fa fa-trash"></i></a></td>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <%
                                                                                }
                                                                            %>

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


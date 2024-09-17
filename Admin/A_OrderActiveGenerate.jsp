<%-- 
    Document   : A_OrderGenerate
    Created on : 7 Feb, 2019, 12:01:47 PM
    Author     : bharat
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection_client.client_OTP_method"%>
<%@page import="dbConnection.order_detail_master_method"%>
<%@page import="dbConnection.hostingplan_method"%>
<%@page import="dbConnection.server_method" %>
<%@page import="dbConnection.hosting_account_master_method" %>
<%@page import="dbConnection.hosting_register_master_method" %>
<%@page import="dbConnection.order_master_method" %>
<%@page import="dbConnection.notification_master_method" %>
<%@page import="dbconnection_client.Mailer" %>
<%@page import="dbConnection.Client_register_method" %>
<%@page import="dbConnection.domain_register_master_method" %>
<%@page import="dbConnection.domain_pricing_method" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int orderDetail_id = Integer.parseInt(request.getParameter("orderDetail_id"));
            int status = 0, ref_id = 0, server_id = 0, user_id = 0, domainReg_id = 0, hos_tim = 0, ref_id1 = 0, max_hosRedId = 0, noti_status = 0, o_id = 0;
            String server_type = "", dom_name = "", hosReg_date = "", hosEx_date = "", noti_for = "hosting account", domOrder_type = "";

            order_detail_master_method om1 = new order_detail_master_method();
            String h1 = "hosting";
            ResultSet rs11 = om1.orderDetailMaster_ClassSelect1(orderDetail_id);
            while (rs11.next()) {
                if (rs11.getString("Order_Type").equals("hosting")) {
                    o_id = rs11.getInt("Order_Id");
                    ref_id1 = rs11.getInt("Reference_Id");
                    dom_name = rs11.getString("Domain_Name");
                    hos_tim = rs11.getInt("For_Year");
                }
            }

            if (request.getParameter("btn1") != null) {
                int val = 0;
                hosting_account_master_method hm1 = new hosting_account_master_method();
                val = hm1.hostingAccountMaster_classInsert(request.getParameter("UserName"), request.getParameter("hostingPassword"), request.getParameter("HostingType"), Integer.parseInt(request.getParameter("dropStatus")));
                if (val == 2) {
                    String a = request.getParameter("UserName") + " already Exists";
                    out.print("<script>alert('" + a + "');</script>");
                } else if (Integer.parseInt(request.getParameter("dropStatus")) == 0) {
                    out.print("<script>alert('please active the status');</script>");
                } else {
                    hosting_register_master_method hm = new hosting_register_master_method();
                    int value = 0;
                    order_master_method orm = new order_master_method();
                    ResultSet r9 = orm.order_listClassSelect(o_id);
                    while (r9.next()) {
                        user_id = r9.getInt("User_Id");
                        hosReg_date = r9.getString("Order_Date");
                    }
                    order_detail_master_method orm1 = new order_detail_master_method();
                    ResultSet r0 = orm1.orderDetailMaster_ClassSelect1(orderDetail_id);
                    while (r0.next()) {
                        if (r0.getString("Order_Type").equals("hosting")) {
                            domOrder_type = r0.getString("Domain_Order_Type");
                        }
                    }
                    //domain register master
                    int ax = 0;
                    if (domOrder_type.equals("new domain")) {
                        domain_register_master_method dm = new domain_register_master_method();
                        int domSatus = 1;
                        int ForYear = 0, type_id = 0, pricing_id = 0;
                        String exDate = "", regFor = "";
                        ResultSet r45 = orm1.orderDetailMaster1_ClassSelect();
                        while (r45.next()) {
                            if (r45.getString("Domain_Name").equals(dom_name) && r45.getString("Order_Type").equals("domain")) {
                                ForYear = r45.getInt("For_Year");
                                type_id = r45.getInt("Reference_Id");
                            }
                        }
                        domain_pricing_method dpm = new domain_pricing_method();
                        ResultSet r89 = dpm.domain_PricelistByDomainClassSelect(type_id);
                        if (r89.next()) {
                            pricing_id = r89.getInt("Domain_Pricing_Id");
                        }
                        ResultSet r67 = hm.hostingRegisterMaster_hosExDate(hosReg_date, ForYear);
                        if (r67.next()) {
                            exDate = r67.getString("date");
                        }
                        ax = dm.domainRegMaster_classInsert(user_id, o_id, type_id, pricing_id, dom_name, regFor, hosReg_date, exDate, domSatus);
                    }
                    ResultSet r13 = hm.hostingRegisterMaster_hosExDate(hosReg_date, hos_tim);
                    if (r13.next()) {
                        hosEx_date = r13.getString("date");
                    }
                    if (ax > 0) {
                        domain_register_master_method dm = new domain_register_master_method();
                        ResultSet r75 = dm.domainRegisterMaster_maxId();
                        if (r75.next()) {
                            domainReg_id = r75.getInt("did");
                        }
                    }
                    value = hm.hostingRegisterMaster_classInsert(user_id, o_id, ref_id1, domainReg_id, dom_name, hosReg_date, hosEx_date, hos_tim, Integer.parseInt(request.getParameter("dropStatus")));
                    ResultSet r45 = hm.hostingRegisterMaster_maxId();
                    if (r45.next()) {
                        max_hosRedId = r45.getInt("rid");
                    }
                    int x = 0;
                    x = hm1.hostingAccountMaster_classInsert1(max_hosRedId, request.getParameter("UserName"), request.getParameter("hostingPassword"), request.getParameter("HostingType"), Integer.parseInt(request.getParameter("dropStatus")));

                    //create folder
                    String folder_name = "www." + dom_name;
                    
                        String file_name = "index.jsp";
                        String p = request.getRealPath("/hosting");
                        String folder = p +"/"+ folder_name;
                        String subdomain=folder+"/subdomain";

                        File f = new File(folder);
                        
                        if (!f.exists()) {
                            if (f.mkdirs()) {
                                File file = new File(folder + "/" + file_name);
                                file.createNewFile();
                            }
                        }
                        
                        File f2=new File(subdomain);
                        if (!f2.exists()) {
                            f2.mkdirs();
                        }
                        FileInputStream instream = null;
                    FileOutputStream outstream = null;
                    
            String p1 = request.getRealPath("/Control_Panel");
                       String z=p1+"/index.html";
                    File infile = new File(z);
                    File outfile = new File(folder+"/index.jsp");

                    instream = new FileInputStream(infile);
                    outstream = new FileOutputStream(outfile);

                    byte[] buffer = new byte[1024];

                    int length;
                    
                    while ((length = instream.read(buffer)) > 0) {
                        outstream.write(buffer, 0, length);
                    }
                    
                    instream.close();
                    outstream.close();
                    

                    //notification_mater table
                    notification_master_method nm = new notification_master_method();
                    int y = 0;
                    String noti_msg = "your hosting account for domain " + dom_name + " has been activated and user_name and password has been mailed you";
                    y = nm.notification_masterClassInsert(user_id, noti_for, noti_msg, noti_status);

                    //mail
                    String Email = "";
                    Client_register_method crm = new Client_register_method();
                    ResultSet r34 = crm.clientRegister_ClassSelect(user_id);
                    if (r34.next()) {
                        Email = r34.getString("Email");
                    }
                    String Subject = "hosting information";
                    String Message = "tour username : " + request.getParameter("UserName") + " and Password : " + request.getParameter("hostingPassword");
                    Mailer.send("cksolutioninfo@gmail.com", "12345678@$$", Email, Subject, Message);

                    out.print("<script>alert('Successfully Stored Your Data.');window.location.href='Admin.jsp?page=A_OrderList.jsp';</script>");
                }
            }
        %>
        <form action="A_OrderActiveGenerate.jsp" method="post">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Active Hosting</li>
            </ol>

            <!-- Page Content -->
            <h4 class="clearfix">
                Active Hosting
            </h4>
            <hr>
            <div class="card">
                <div class="card-header">
                    Hoting Deatils
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="dropStatus">Hosting UserName</label> 
                        <input type="text" class="form-control" name="UserName" id="UserName" value="" >
                        </select>

                    </div>
                    <div class="form-group">
                        <label for="txtTech">Hosting Password</label>
                        <%
                            client_OTP_method cm = new client_OTP_method();
                            String Message = cm.generate_password();

                        %>
                        <input type="text" class="form-control" name="hostingPassword" id="hostingPassword" value="<%=Message%>" >

                    </div>
                    <div class="form-group">
                        <label for="txtTech">Hosting Type</label>
                        <%
                            order_detail_master_method om = new order_detail_master_method();
                            String h = "hosting";
                            ResultSet rs = om.orderDetailMaster_ClassSelect1(orderDetail_id);
                            while (rs.next()) {
                                if (rs.getString("Order_Type").equals("hosting")) {
                                    ref_id = rs.getInt("Reference_Id");
                                }
                            }
                            hostingplan_method hm = new hostingplan_method();
                            ResultSet r6 = hm.hostingplan_listClassSelect(ref_id);
                            while (r6.next()) {
                                server_id = r6.getInt("Server_Id");
                            }
                            server_method sm = new server_method();
                            ResultSet r7 = sm.server_listClassSelect(server_id);
                            while (r7.next()) {
                                server_type = r7.getString("Server_Type");
                            }
                        %>
                        <input type="text" class="form-control" name="HostingType" id="HostingType" value="<%=server_type%>" >

                    </div>
                    <div class="form-group">
                        <label for="dropStatus">Hosting Account Status</label>
                        <select class="form-control" id="dropStatus" name="dropStatus">
                                <option <%if (status == 0) {
                                        out.print("selected");
                                    }%>  value="1">Active</option>
                                <option <%if (status == 1) {
                                        out.print("selected");
                                    }%> value="0">Inactive</option>
                        </select>

                    </div>
                </div>
                <div class="card-footer">
                    <input type="submit" name="btn1" id="btn1" value="Save" class="btn btn-success btn-lg" />
                </div>
            </div>
        </form>
    </body>
</html>

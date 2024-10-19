<%-- 
    Document   : A_TechnologyList
    Created on : 26 Oct, 2018, 3:41:11 PM
    Author     : bharat
--%>
<%@page import="dbConnection.hosting_account_master_method" %>
<%@page import="dbConnection.hosting_register_master_method" %>
<%@page import="dbConnection.domain_register_master_method" %>
<%@page import="dbConnection.order_master_method" %>
<%@page import="dbConnection.order_detail_master_method" %>
<%@page import="dbConnection.domain_pricing_method" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            td{
                text-transform: uppercase;
                font-size: 14px;
            }

        </style>
    </head>
    <body>
        <%
            if(request.getParameter("Add")!=null){
                int order_id=0,user_id=0,type_id=0,pricing_id=0,domSatus=1,forYear=0;
                String dom_name="",regFor="",regDate="",exDate="";
                int order_detail_id=Integer.parseInt(request.getParameter("Add"));
                order_detail_master_method odm1=new order_detail_master_method();
                ResultSet rt=odm1.orderDetailMaster_ClassSelect1(order_detail_id);
                while(rt.next()){
                    order_id=rt.getInt("Order_Id");
                    type_id=rt.getInt("Reference_Id");
                    dom_name=rt.getString("Domain_Name");
                    forYear=rt.getInt("For_Year");
                }
                order_master_method om1=new order_master_method();
                ResultSet ry=om1.order_listClassSelect(order_id);
                while(ry.next()){
                    user_id=ry.getInt("User_Id");
                    regDate=ry.getString("Order_Date");
                }
                domain_pricing_method dm2=new domain_pricing_method();
                ResultSet ru=dm2.domain_PricelistByDomainClassSelect(type_id);
                while(ru.next()){
                    pricing_id=ru.getInt("Domain_Pricing_Id");
                }
                hosting_register_master_method hm2=new hosting_register_master_method();
                ResultSet r67=hm2.hostingRegisterMaster_hosExDate(regDate,forYear);
                        if(r67.next()){
                            exDate=r67.getString("date");
                        }
                domain_register_master_method drm=new domain_register_master_method();
                int val=0;
                val=drm.domainRegMaster_classInsert(user_id, order_id, type_id, pricing_id, dom_name, regFor, regDate, exDate, domSatus);
                if(val>0){
                    String s1 = "Domain set to Active ";
                    out.print("<script>alert('" + s1 + "');window.location.href='Admin.jsp?page=A_OrderList.jsp';</script>");
                }
            }
        %>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Order Detail List</li>
        </ol>

        <!-- Page Content -->
        <h4 class="clearfix">
            Order Detail List
        </h4>
        <hr>
        <div class="card">
            <div class="card-header">
                Order Detail List
            </div>
            <div class="card-body table-responsive">
                <table class="table table-striped table-hover">
                    <tr>

                        <th style="width: 100px;">Order ID</th>
                        <th>Order type</th>
                        <th>Reference Id</th>
                        <th>Domain Name</th>
                        <th>For Year</th>
                        <th>Domain Order Type</th>
                        <th>Total Amount</th>
                        <th>Add</th>
                    </tr>
                    <%  
                        order_master_method om = new order_master_method();
                        int order_id = Integer.parseInt(request.getParameter("order_id"));
                        ResultSet r5 = om.orderDetail_listClassSelect(order_id);
                        while (r5.next()) {

                    %>
                    <tr>
                        <td><%=r5.getInt("Order_Id")%></td>
                        <td><%=r5.getString("Order_Type")%></td>
                        <td><%=r5.getInt("Reference_Id")%></td>
                        <td><%=r5.getString("Domain_Name")%></td>
                        <td><%=r5.getInt("For_Year")%></td>
                        <td><%=r5.getString("Domain_Order_Type")%></td>
                        <td><%=r5.getInt("Total_Amount")%></td>
                        <td>
                            <%  
                                int HosReg_Id=0,status=0,status1=0;
                                String dom_name=r5.getString("Domain_Name");
                                if(r5.getString("Order_Type").equals("hosting")){
                                    hosting_register_master_method hm=new hosting_register_master_method();
                                    ResultSet r12=hm.hostingRegisterMaster_select(order_id);
                                    while(r12.next()){
                                    if(r12.getString("Domain_Name").equals(dom_name))
                                        status=r12.getInt("Hosting_Status");              
                                    }
                                    if(status!=1){
                                    %>
                                    <a class="btn btn-dark" style="width: 80px; padding: 1px;" href="Admin.jsp?page=A_OrderActiveGenerate.jsp?orderDetail_id=<%=r5.getString("Order_Detail_Id")%>"><i class="fa fa-plus"></i></a>
                                    <%
                                    }
                                }
                                else{
                                    domain_register_master_method dm=new domain_register_master_method();
                                    ResultSet r7=dm.domainRegMaster_classSelect(order_id);
                                    while(r7.next()){
                                        if(r7.getString("Domain_Name").equals(dom_name)){
                                            status1=r7.getInt("Domain_Status");
                                        }
                                    }
                                    if(status1!=1){
                                %>
                                    <a class="btn btn-dark" style="width: 80px; padding: 1px; color: white;" href="Admin.jsp?page=A_OrderDetailList.jsp?Add=<%=r5.getString("Order_Detail_Id")%>&order_id=<%=order_id%>"><i class="fa fa-plus"></i></a>
                                    <%}
                                }
                            %>
                        </td>
                    </tr>


                    <%
                        }
                    %>

                </table>
            </div>
        </div>



    </body>
</html>

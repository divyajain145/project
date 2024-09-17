<%-- 
    Document   : A_FAQForm
    Created on : Nov 1, 2018, 7:55:53 AM
    Author     : Trojan
--%>


<%@page import="dbConnection.FAQs_method"%>
<%@page import="java.sql.*"%>

<%
    String question = "", answer = "";

    if (request.getParameter("btn1") != null) {
        FAQs_method fm = new FAQs_method();
        int val = 0;
        if (request.getParameter("edit") != null) {
            val = fm.faqs_ClassUpdate(Integer.parseInt(request.getParameter("edit")), request.getParameter("txtQue"), request.getParameter("txtAns"));
        } else {
            val = fm.faqs_ClassInsert(request.getParameter("txtQue"), request.getParameter("txtAns"));
        }
        if (val > 0) {
            if (request.getParameter("edit") != null) {
                if (val == 2) {
                    String a = request.getParameter("txtQue") + " already Exists";
                    out.print("<script>alert('" + a + "');</script>");
                } else {
                    out.print("<script>alert('Successfully Updated Your Data.');window.location.href='Admin.jsp?page=A_FAQForm.jsp';</script>");
                }
            } else {
                if (val == 2) {
                    String a = request.getParameter("txtQue") + " already Exists";
                    out.print("<script>alert('" + a + "');</script>");
                } else {
                    out.print("<script>alert('Successfully Stored Your Data.')</script>");
                }
            }
        } else {
            out.print("<script>('Some Thing is Wrong in Your Code.'')</script>");
        }
    }

    if (request.getParameter("edit") != null) {
        int faq_id = Integer.parseInt(request.getParameter("edit"));
        FAQs_method fm = new FAQs_method();
        ResultSet rs = fm.faqs_ClassSelect(faq_id);
        while (rs.next()) {
            faq_id = Integer.parseInt(rs.getString(1));
            question = rs.getString(2);
            answer = rs.getString(3);

        }
    }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="A_FAQForm.jsp <% if (request.getParameter("edit") != null) {
                out.print("?edit=" + request.getParameter("edit"));
            }
              %>" method="post">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">FAQ's</li>
            </ol>

            <!-- Page Content -->
            <h4 class="clearfix">
                FAQ's
                <a href="Admin.jsp?page=A_FAQList.jsp" class="btn btn-primary float-right"><i class="fa fa-angle-left"></i> Back</a>
            </h4>
            <hr>
            <div class="card">
                <div class="card-header">
                    FAQ's                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtTech">Question</label>
                        <textarea rows="4" cols="50" name="txtQue" class="form-control" placeholder="Enter your Question"><%=question%></textarea>

                    </div>

                    <div class="form-group">
                        <label for="txtTech">Answers</label>
                        <textarea rows="4" cols="50" name="txtAns" class="form-control" placeholder="Enter your Answer"><%=answer%></textarea>

                    </div>


                </div>
                <div class="card-footer">
                    <input type="submit" name="btn1" id="btn1" value="Save" class="btn btn-success btn-lg" />
                </div>
            </div>
        </form>
    </body>
</html>

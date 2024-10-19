<%-- 
    Document   : C_ticketform
    Created on : 15 Feb, 2019, 12:45:24 PM
    Author     : BRIGHT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbConnection.order_master_method" %>
<%@page import="dbConnection.support_ticket_master_method"%>
<%@page import="dbConnection.order_detail_master_method" %>
<%@page import="dbConnection.hostingplan_method" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
    </head>
    <body>
        <%
            int order_id=0,hosting_id=0;
            int id=Integer.parseInt(request.getParameter("id"));
            int user_id=(Integer)session.getAttribute("user");
            int val =0;
            
            if(request.getParameter("btn1")!=null){
                String subject="",email="",dept="",service="",priority="",msg="",file="";
                subject=request.getParameter("sub");
                email=request.getParameter("email");
                dept=request.getParameter("Department");
                service=request.getParameter("Relate_Service");
                priority=request.getParameter("priority");
                msg=request.getParameter("subject");
                file= request.getParameter("myFile");
                support_ticket_master_method stm = new support_ticket_master_method();
                val = stm.support_ticket_master_ClassInsert(user_id, dept, 1, priority, subject, email, msg, file);
                if(val>0){
                    out.print("<script>alert('Successfully stored your data')</script>");
                }
            }
        %>
        <div class="container">
  <form action="/action_page.php">
    <div class="row">
      <div class="col-25">
        <label for="sub">Subject</label>
      </div>
      <div class="col-75">
        <input type="text" id="sub" name="sub" placeholder="Your Subject..">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">Email</label>
      </div>
      <div class="col-75">
        <input type="text" id="email" name="email" placeholder="Email">
      </div>
    </div><div class="row">
      <div class="col-25">
        <label for="">Department</label>
      </div>
      <div class="col-75">
        <select name="Department" id="Department" >
            <%
                if(id==1){
            %>
          <option value="Pre Sales">Pre Sales</option>
          <%}
               else if(id==2){
          %>         
          <option value="Billing">Billing</option>
          <%}
            else if(id==3){
          %>
          <option value="Hosting">Hosting</option>
          <%}
            else if(id==4){
          %>
          <option value="Reseller">Reseller</option>
          <%}
            else if(id==5){
            %>
          <option value="Domain">Domain</option>
          <%}
            else{
          %>
          <option value="Linux Hosting">Linux Hosting</option>
          <%}%>
        </select>
      </div>
    </div><div class="row">
      <div class="col-25">
        <label for="">Related Service</label>
      </div>
      <div class="col-75">
        <select name="Relate_Service" id="Relate_Service" >
            <%
                order_master_method om=new order_master_method();
                ResultSet r7=om.order_listClassSelect1(user_id);
                while(r7.next()){
                    order_id=r7.getInt("Order_Id");
                    order_detail_master_method odm=new order_detail_master_method();
                        ResultSet rs=odm.orderDetailMaster_ClassSelect(order_id);
                        while(rs.next()){
                           if(rs.getString("Order_Type").equals("hosting")){
                               order_id=rs.getInt("Order_Id");
                               hosting_id=rs.getInt("Reference_Id");
                               hostingplan_method hpm=new hostingplan_method();
                               ResultSet r1=hpm.hostingplan_listClassSelect(hosting_id);
                               while(r1.next()){
            %>
          <option value="<%=r1.getString("Plan_Title")%> and <%=rs.getString("Domain_Name")%>"><%=r1.getString("Plan_Title")%> and <%=rs.getString("Domain_Name")%></option>
          <%
                               }
                            }
                        }
                }
          %>
        </select>
      </div>
    </div>
       <div class="row">
      <div class="col-25">
        <label for="">Priority</label>
      </div>
      <div class="col-75">
        <select name="priority" id="priority" >
          <option value="">Priority</option>
        </select>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="subject">Message</label>
      </div>
      <div class="col-75">
        <textarea id="subject" name="subject" placeholder="Write something.." style="height:100px"></textarea>
      </div>
    </div>
      
      <div class="row">
      <div class="col-25">
        <label for="subject">Select File</label>
      </div>
          
      <div class="col-25">
       <input type="file" name="myFile" multiple><br><br>
      </div>
      <div class="col-50">
      <input id="btn1" name="btn1" type="submit" value="Submit"></div>
    </div>
      
  </form>
</div>
    </body>
</html>

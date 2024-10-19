<%-- 
    Document   : Cp_Login
    Created on : 27 Feb, 2019, 12:41:03 PM
    Author     : BRIGHT
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnection.hosting_account_master_method" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		
		<meta name="description" content="A responsive bootstrap 4 admin dashboard template by hencework" />
		
		
        <title>Control-Panel Login</title>
        <!-- Favicon -->
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
    <link rel="shortcut icon"  href="../Client/images/jlogo.png" type="image/x-icon" />
		<!-- Toggles CSS -->
		<link href="vendors/jquery-toggles/css/toggles.css" rel="stylesheet" type="text/css">
		<link href="vendors/jquery-toggles/css/themes/toggles-light.css" rel="stylesheet" type="text/css">
		
		<!-- Custom CSS -->
		<link href="dist/css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%try{
           if(request.getParameter("btn1") != null)
           {
               int hosting_regId=0;
               String hnm="",hpsw ="";
               String name = request.getParameter("txt1");
                 
               String password = request.getParameter("psw");
                
            hosting_account_master_method hm = new hosting_account_master_method();
            ResultSet rs = hm.hostingAccountMaster_Selectunmpsw(name);
            if (rs.next()) {     
                    hpsw = rs.getString("Hosting_Password");
                    hosting_regId=rs.getInt("Hosting_Register_Id");
                    
            }
                 if(password.equals(hpsw) )
            {
                session.setAttribute("s1", hosting_regId);
              session.setMaxInactiveInterval(7200);
              out.print("<script>window.location.href='Cp_Master.jsp?page=Cp_Domain_Control.jsp';</script>");
              
            }        
                
            
           }}catch(Exception e){
           out.print(e);
           }
        %>
        <!-- Preloader -->
		
		<!-- /Preloader -->
		
		<!-- HK Wrapper -->
		<div class="hk-wrapper">
			
			<!-- Main Content -->
			<div class="hk-pg-wrapper hk-auth-wrapper">
				
				<div class="container-fluid">
					<div class="row">
						<div class="col-xl-12 pa-0">
							<div class="auth-form-wrap pt-xl-0 pt-70">
								<div class="auth-form w-xl-30 w-lg-55 w-sm-75 w-100">
									<a class="auth-brand text-center d-block mb-20" href="#">
                                                                                <img src="../Client/images/jpanel.png" alt=""/>
									</a>
									<form>
										<h1 class="display-4 text-center mb-10">Welcome Back :)</h1>
										<p class="text-center mb-30">Sign in to your account and enjoy unlimited perks.</p> 
										<div class="form-group">
											<input class="form-control" placeholder="Username" type="text" name="txt1">
										</div>
										<div class="form-group">
											<div class="input-group">
                                                                                            <input class="form-control" placeholder="Password" type="password" name="psw">
												<div class="input-group-append">
													<span class="input-group-text"><span class="feather-icon"><i data-feather="eye-off"></i></span></span>
												</div>
											</div>
										</div>
										
										<button class="btn btn-primary btn-block" name="btn1" type="submit">Login</button>
                                                                        </form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /Main Content -->
		
		</div>
		<!-- /HK Wrapper -->
		
		<!-- JavaScript -->
		
    </body>
</html>

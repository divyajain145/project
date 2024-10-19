<%-- 
    Document   : Admin
    Created on : 26 Oct, 2018, 3:22:32 PM
    Author     : bharat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Employee</title>

        <!-- Bootstrap core CSS-->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
        <!-- Custom fonts for this template-->
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.min.css" rel="stylesheet">
        <link href="admin.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="page-top">
        <%
            if(session.getAttribute("user")!=null){
        %>
        <form method="post" action="Employee.jsp?<%  
              if(request.getParameter("page") != null)
              {
                  out.print("page="+request.getParameter("page"));
              }
              %>">
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

            <a class="navbar-brand mr-1" href="#" style="width: 200px;">JPanel Employee</a>

            <button class="btn btn-link btn-lg text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>

            <!-- Navbar -->
            
            <ul class="icon-right navbar-nav ml-auto ml-md-0">
                
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user-circle fa-fw"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                       
                        <a class="dropdown-item" href="E_Logout.jsp">Logout</a>
                    </div>
                </li>
            </ul>
            
        </nav>

        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav">
                
                
                
            <li class="nav-item">
                    <a class="nav-link" href="Employee.jsp?page=E_HostingPlanList.jsp">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Hosting Plan</span>
                    </a>
                </li>
             <li class="nav-item">
                    <a class="nav-link" href="Employee.jsp?page=E_DomainList.jsp">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Domain</span>
                    </a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="Employee.jsp?page=E_ServerList.jsp">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Server</span>
                    </a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="Employee.jsp?page=E_HelpTicket.jsp">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Help Ticket</span>
                    </a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="Employee.jsp?page=E_CartList.jsp">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Cart List</span>
                    </a>
                </li>
             <li class="nav-item">
                    <a class="nav-link" href="Employee.jsp?page=E_FAQList.jsp">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>FAQ's</span>
                    </a>
                </li>
                
            </ul>

            <div id="content-wrapper">

                <div class="container-fluid">
                       <!--Start Master Page-->
                       
                       <%
                       if(request.getParameter("page") != null)
                       {
                           String pg = request.getParameter("page");
                        %>
                        <jsp:include page="<%=pg%>"></jsp:include>
                        <%
                       }
                       %>
                       
                       
                       
                       <!--End Master Page-->
                   
                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright © Divya's Website 2018</span>
                        </div>
                    </div>
                </footer>

            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="../js/sb-admin.min.js"></script>
</form>
                       <%
                           }
                       %>
    </body>
</html>

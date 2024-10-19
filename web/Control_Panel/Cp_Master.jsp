
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>Jpanel</title>
        <meta name="description" content="A responsive bootstrap 4 admin dashboard template by hencework">

        <!-- Favicon -->
        <link rel="shortcut icon" href="dist/img/jlogo.png">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <!-- vector map CSS -->
        <link href="vendors/vectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" type="text/css">

        <!-- Toggles CSS -->
        <link href="vendors/jquery-toggles/css/toggles.css" rel="stylesheet" type="text/css">
        <link href="vendors/jquery-toggles/css/themes/toggles-light.css" rel="stylesheet" type="text/css">

        <link href="vendors/nestable2/dist/jquery.nestable.min.css" rel="stylesheet" type="text/css">
        <!-- Toastr CSS -->
        <link href="vendors/jquery-toast-plugin/dist/jquery.toast.min.css" rel="stylesheet" type="text/css">

        <!-- Custom CSS -->
        <link href="dist/css/style.css" rel="stylesheet" type="text/css">
        <style type="text/css">
            .jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background:
                              rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style></head>
        <body>
            
                <%int hr_id = 0;
                    try {
                        hr_id = Integer.parseInt(request.getParameter("Hosting_regId"));
                    } catch (Exception e) {

                    }
                %>
                <!-- HK Wrapper -->
                <div class="hk-wrapper hk-vertical-nav">

                <!-- Top Navbar -->
                <nav class="navbar navbar-expand-xl navbar-dark fixed-top hk-navbar">
                    <a id="navbar_toggle_btn" class="navbar-toggle-btn nav-link-hover" href="javascript:void(0);"><span class="feather-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg></span></a>
                    <a class="navbar-brand " href="dashboard1.html" >
                        <img class="brand-img d-inline-block" src="dist/img/jpanel.png" alt="brand">
                    </a>
                    <ul class="navbar-nav hk-navbar-content">
                        <li class="nav-item">
                            <a id="navbar_search_btn" class="nav-link nav-link-hover" href="javascript:void(0);"><span class="feather-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></span></a>
                        </li>

                        <li class="nav-item dropdown dropdown-notifications">
                            <a class="nav-link dropdown-toggle no-caret" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Help
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                <h6 class="dropdown-header">Help <a href="javascript:void(0);" class="">View all</a></h6>
                                <div class="slimScrollDiv" style="position: relative;  overflow: hidden; width: auto; height: 330px;"><div class="notifications-nicescroll-bar" tabindex="-50" style="overflow: hidden; width: auto; height: 330px; outline: none;">
                                        <a href="javascript:void(0);" class="dropdown-item">
                                            <div class="media">

                                                <div class="media-body">
                                                    <div>
                                                        <div class="notifications-text"><span class="text-dark text-capitalize">Evie Ono</span> accepted your invitation to join the team</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="dropdown-divider"></div><a href="javascript:void(0);" class="dropdown-item">
                                            <div class="media">

                                                <div class="media-body">
                                                    <div>
                                                        <div class="notifications-text"><span class="text-dark text-capitalize">Evie Ono</span> accepted your invitation to join the team</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="dropdown-divider"></div><a href="javascript:void(0);" class="dropdown-item">
                                            <div class="media">

                                                <div class="media-body">
                                                    <div>
                                                        <div class="notifications-text"><span class="text-dark text-capitalize">Evie Ono</span> accepted your invitation to join the team</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="dropdown-divider"></div><a href="javascript:void(0);" class="dropdown-item">
                                            <div class="media">

                                                <div class="media-body">
                                                    <div>
                                                        <div class="notifications-text"><span class="text-dark text-capitalize">Evie Ono</span> accepted your invitation to join the team</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="dropdown-divider"></div><a href="javascript:void(0);" class="dropdown-item">
                                            <div class="media">

                                                <div class="media-body">
                                                    <div>
                                                        <div class="notifications-text"><span class="text-dark text-capitalize">Evie Ono</span> accepted your invitation to join the team</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div><div class="slimScrollBar" tabindex="-50" style="background: rgb(214, 217, 218); width: 6px; position: absolute; top: 0px; opacity: 0.8; display: none; border-radius: 0px; z-index: 99; right: 1px; outline: none;"></div><div class="slimScrollRail" style="width: 6px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                            </div>
                        </li>
                        <li class="nav-item dropdown dropdown-authentication">
                            <a class="nav-link dropdown-toggle no-caret" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="media">

                                    <div class="media-body">
                                        <span>jpanel667@gmail.com<i class="zmdi zmdi-chevron-down"></i></span>
                                    </div>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" data-dropdown-in="flipInX" data-dropdown-out="flipOutX">
                                
                                <a class="dropdown-item" href="Cp_Logout.jsp"><i class="dropdown-icon zmdi zmdi-power"></i><span>Log out</span></a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <div  class="navbar-search">
                    <div class="position-relative">
                        <a href="javascript:void(0);" class="navbar-search-icon"><span class="feather-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></span></a>
                        <input type="text" name="example-input1-group2" class="form-control" placeholder="Type here to Search">
                        <a id="navbar_search_close" class="navbar-search-close" href="#"><span class="feather-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></span></a>
                    </div>
                </div>
                <!-- /Top Navbar -->

                <!-- Vertical Nav -->
                <nav class="hk-nav hk-nav-light">
                    <a href="javascript:void(0);" id="hk_nav_close" class="hk-nav-close"><span class="feather-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></span></a>
                    <div class="slimScrollDiv" style="position: relative; background-color: #19323c; overflow: hidden; width: auto; height: 100%; "><div class="nicescroll-bar" tabindex="-50" style="overflow: hidden; width: auto; height: 100%; outline: none;">
                            <div class="navbar-nav-wrap">
                                <ul class="navbar-nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link" href="Cp_Master.jsp?page=Cp_Domain_Control.jsp">
                                            <i class="fa fa-"></i>
                                            <span class="nav-link-text" style="color: #d0c6c6;">Websites & Domains</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Cp_Master.jsp?page=Cp_Mail.jsp">
                                            <i class="fa fa-"></i>
                                            <span class="nav-link-text"  style="color: #d0c6c6;">Mail</span>
                                        </a>
                                    </li> 
                                    <li class="nav-item">
                                        <a class="nav-link" href="Cp_Master.jsp?page=Cp_File.jsp">
                                            <i class="fa fa-"></i>
                                            <span class="nav-link-text"  style="color: #d0c6c6">Files</span>
                                        </a>
                                    </li>

                                </ul>
                            </div>
                        </div><div class="slimScrollBar" tabindex="-50" style="background: rgb(214, 217, 218); width: 6px; position: absolute; top: 0px; opacity: 0.8; display: none; border-radius: 0px; z-index: 99; right: 1px; height: 191.138px; outline: none;"></div><div class="slimScrollRail" style="width: 6px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                </nav>
                <div id="hk_nav_backdrop" class="hk-nav-backdrop"></div>
                <!-- /Vertical Nav -->

                <!-- Setting Panel -->
                <div class="hk-settings-panel">
                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div class="nicescroll-bar position-relative" tabindex="-50" style="overflow: hidden; width: auto; height: 100%; outline: none;">
                            <div class="settings-panel-wrap">
                                <div class="settings-panel-head">
                                    <img class="brand-img d-inline-block align-top" src="dist/img/logo-light.png" alt="brand">
                                    <a href="javascript:void(0);" id="settings_panel_close" class="settings-panel-close"><span class="feather-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></span></a>
                                </div>
                                <hr>
                                <h6 class="mb-5">Layout</h6>
                                <p class="font-14">Choose your preferred layout</p>
                                <div class="layout-img-wrap">
                                    <div class="row">
                                        <a href="javascript:void(0);" class="col-6 mb-30 active">
                                            <img class="rounded opacity-70" src="dist/img/layout1.png" alt="layout">
                                            <i class="zmdi zmdi-check"></i>
                                        </a>
                                        <a href="dashboard2.html" class="col-6 mb-30">
                                            <img class="rounded opacity-70" src="dist/img/layout2.png" alt="layout">
                                            <i class="zmdi zmdi-check"></i>
                                        </a>
                                        <a href="dashboard3.html" class="col-6 mb-30">
                                            <img class="rounded opacity-70" src="dist/img/layout3.png" alt="layout">
                                            <i class="zmdi zmdi-check"></i>
                                        </a>
                                        <a href="dashboard4.html" class="col-6 mb-30">
                                            <img class="rounded opacity-70" src="dist/img/layout4.png" alt="layout">
                                            <i class="zmdi zmdi-check"></i>
                                        </a>
                                        <a href="dashboard5.html" class="col-6">
                                            <img class="rounded opacity-70" src="dist/img/layout5.png" alt="layout">
                                            <i class="zmdi zmdi-check"></i>
                                        </a>
                                    </div>
                                </div>
                                <hr>
                                <h6 class="mb-5">Navigation</h6>
                                <p class="font-14">Menu comes in two modes: dark &amp; light</p>
                                <div class="button-list hk-nav-select mb-10">
                                    <button type="button" id="nav_light_select" class="btn btn-outline-primary btn-sm btn-wth-icon icon-wthot-bg"><span class="icon-label"><i class="fa fa-sun-o"></i> </span><span class="btn-text">Light Mode</span></button>
                                    <button type="button" id="nav_dark_select" class="btn btn-outline-light btn-sm btn-wth-icon icon-wthot-bg"><span class="icon-label"><i class="fa fa-moon-o"></i> </span><span class="btn-text">Dark Mode</span></button>
                                </div>
                                <hr>
                                <h6 class="mb-5">Top Nav</h6>
                                <p class="font-14">Choose your liked color mode</p>
                                <div class="button-list hk-navbar-select mb-10">
                                    <button type="button" id="navtop_light_select" class="btn btn-outline-light btn-sm btn-wth-icon icon-wthot-bg"><span class="icon-label"><i class="fa fa-sun-o"></i> </span><span class="btn-text">Light Mode</span></button>
                                    <button type="button" id="navtop_dark_select" class="btn btn-outline-primary btn-sm btn-wth-icon icon-wthot-bg"><span class="icon-label"><i class="fa fa-moon-o"></i> </span><span class="btn-text">Dark Mode</span></button>
                                </div>
                                <hr>
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6>Scrollable Header</h6>
                                    <div class="toggle toggle-sm toggle-simple toggle-light toggle-bg-primary scroll-nav-switch" style="height: 20px; width: 35px;"><div class="toggle-slide"><div class="toggle-inner" style="width: 50px; margin-left: -15px;"><div class="toggle-on" style="height: 20px; width: 25px; text-indent: -6.66667px; line-height: 20px;"></div><div class="toggle-blob" style="height: 20px; width: 20px; margin-left: -10px;"></div><div class="toggle-off active" style="height: 20px; width: 25px; margin-left: -10px; text-indent: 6.66667px; line-height: 20px;"></div></div></div></div>
                                </div>
                                <button id="reset_settings" class="btn btn-primary btn-block btn-reset mt-30">Reset</button>
                            </div>
                        </div><div class="slimScrollBar" tabindex="-50" style="background: rgb(214, 217, 218); width: 6px; position: absolute; top: 0px; opacity: 0.8; display: block; border-radius: 0px; z-index: 99; right: 1px; height: 183.125px; outline: none;"></div><div class="slimScrollRail" style="width: 6px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                    <img class="d-none" src="dist/img/logo-light.png" alt="brand">
                    <img class="d-none" src="dist/img/logo-dark.png" alt="brand">
                </div>
                <!-- /Setting Panel -->

                <!-- *********************************Main Content -->

                <!--Start Master Page-->

                <%
                    if (request.getParameter("page") != null) {
                        String pg = request.getParameter("page");
                %>
                <jsp:include page="<%=pg%>"></jsp:include>
                <%
                    }
                %>



                <!--End Master Page-->





                <!-- /Main Content*/************************************************ -->

            </div>
            <!-- /HK Wrapper -->


            <!-- jQuery -->
            <script src="vendors/jquery/dist/jquery.min.js"></script>

            <!-- Bootstrap Core JavaScript -->
            <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
            <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>

            <!-- Slimscroll JavaScript -->
            <script src="dist/js/jquery.slimscroll.js"></script>

            <!-- Fancy Dropdown JS -->
            <script src="dist/js/dropdown-bootstrap-extended.js"></script>

            <!-- FeatherIcons JavaScript -->
            <script src="dist/js/feather.min.js"></script>

            <!-- Tablesaw JavaScript -->
            <script src="vendors/tablesaw/dist/tablesaw.jquery.js"></script>
            <script src="dist/js/tablesaw-data.js"></script>

            <!-- Toggles JavaScript -->
            <script src="vendors/jquery-toggles/toggles.min.js"></script>
            <script src="dist/js/toggle-data.js"></script>

            <!-- Init JavaScript -->
            <script src="dist/js/init.js"></script>
            <script src="dist/js/nestable-data.js"></script>    
            <script src="vendors/nestable2/dist/jquery.nestable.min.js"></script>





            <!-- Mirrored from hencework.com/theme/mintos/dashboard1.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 25 Feb 2019 04:33:55 GMT -->
            <div class="jvectormap-tip"></div><div class="jq-toast-wrap top-right"><div class="jq-toast-single jq-toast-primary" style="text-align: left; display: none;"><span class="jq-toast-loader jq-toast-loaded" style="-webkit-transition: width 3.1s ease-in;                       -o-transition: width 3.1s ease-in;                       transition: width 3.1s ease-in;                       background-color: #88c241;"></span><span class="close-jq-toast-single">×</span><h2 class="jq-toast-heading">Well done!</h2><p>You have successfully completed level 1.</p><button class="btn btn-primary btn-sm mt-10">Play again</button></div></div><i title="Raphaël Colour Picker" style="display: none; color: transparent;"></i>
        
    </body>
</html>


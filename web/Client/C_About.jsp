<%-- 
    Document   : C_About
    Created on : 10 Dec, 2018, 1:15:03 PM
    Author     : BRIGHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="C_About.jsp <% if (request.getParameter("edit") != null) {
                out.print("?edit=" + request.getParameter("edit"));
            }
              %>"  method="post">
         <!-- Page Header -->
        <section id="idz-header-inner">
            <div class="uk-container uk-container-center">
                    
                <div class="idz-page-title idz-padding-medium">
                    <div class="uk-grid">
                    	<!-- Page Header Title -->
                        <div class="uk-width-large-1-2 uk-width-medium-1-3">
                            <div class="idz-title">
                                <h1 class="">About<span>the story of us</span></h1>
                                <i class="uk-icon-server"></i>
                            </div>
                        </div>
                        <!-- Page Header Title End -->
						
						<!-- Page Description -->
                        <div class="uk-width-large-1-2 uk-width-medium-2-3">
                            <div class="uk-grid">
                                <div class="uk-width-medium-3-4 uk-push-1-4">
                                    <div class="idz-page-promo uk-margin-top">
                                    </div>
                                </div>
                                <div class="uk-width-medium-1-4 uk-pull-3-4"></div>
                          </div>
                       </div>
                       <!-- Page Description End -->

                    </div>
                </div>

            </div>
        </section>
        
<!-- Page Header End -->

       	<!-- Content Section -->
        <section class="idz-padding">
            <div class="uk-container uk-container-center">
                <div class="uk-grid uk-margin-medium-bottom">
                    <div class="uk-width-large-6-10 uk-width-medium-7-10 uk-width-small-1-1">
                        <h1 class="uk-margin-small-bottom">About Jpanel Hosting</h1>
                        <p class="idz-text-18px idz-text-blue  uk-margin-small-top uk-margin-medium-bottom">We're in the business of hosting great ideas.</p>
                        A Jpanel is the administration portion of webhosting account. It is an interface that access user to administer all the aspects of user account. User can typically control all portions of his site within the control panel without using any additional software including FTP software to upload files, though many people find it faster and easier to do so.
                        <h3 class="uk-margin-large-top uk-margin-medium-bottom">Why Choose Jpanel Hosting?</h3>
                        <div class="icon-wrap small left">
                            <i class="smico-graph"></i>
                        </div>
                        <h4 class="uk-margin-bottom-remove">Service</h4>
                        <p class="uk-nbfc uk-margin-top-remove uk-margin-medium-bottom">It provides 24X7 server management. It has security optimization.Malware and virus detection and protection.Performance optimization.Server migration.Migration compability varification support.Disaster recovery. Software installation.</p>
                        
                        </div>
                    
                </div>
            </div>
        </section>
        <!-- Content Section End -->
		
	
         </form>


    </body>
</html>

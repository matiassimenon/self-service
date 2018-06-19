<%-- 
    Document   : left.jsp
    Created on : 2018-5-31, 9:54:06
    Author     : aiming
--%>
<%@page import="com.selfservice.model.User"%>
<%@page import="com.selfservice.util.SFUtils"%>
<%
User user = (User)request.getSession(false).getAttribute("user");
String greetString=SFUtils.getGreetingString();

 Object errMessage = request.getAttribute("errMessage");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="description" content=""><meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Provisioning Platform</title>
        <SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
        </SCRIPT>
        <script src="selfservice.js"></script>         
        <link rel="stylesheet" href="cronos.css">       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>        
               
        <link rel="stylesheet"  type="text/css"  href="table.css"/>
    </head>
    <body onload="noBack();" 	onpageshow="if (event.persisted) noBack();" onunload="">
        <div class="nav-overlay bg-5 alpha-8 gradient"></div><main>
            <div class="container-fluid"><div class="fullscreen row">
                    <div class="col-lg-4 bg-5-gradient py-4 d-flex flex-column align-items-center justify-content-center justify-content-lg-between">
                        <div class="feature-content text-center text-lg-left">
                            <p class=" mb-5"></p>

                            <figure class="lgo mb-5"><a href="http://www.talend.com" target="_blank"><img src="talend.png" class="imgresponsive" alt="Talend website"></a></figure>
                            <%if (user != null){%><h2 class="bold color-1 mb-4"><span class="font-regular">Good <%=greetString%>, <%=user.getFirstname()%></span> </h2><%}%>
                            <h2 class="bold color-1 mb-4"><span class="font-lg">Welcome</span> <span class="d-block">to the Provisioning Platform</span></h2>
                            
                        </div>

                        <div class="feature-footer"><hr class="b-4 d-flex mx-auto">
                            <nav class="nav justify-content-center color-1">
                                <a class="nav-link" href="https://wiki.talend.com/display/support/Support+devops/" target="_blank">Devops Wiki</a>
                                <a class="nav-link" href="https://apac.self-service.talend.com/v2/_catalog" target="_blank">APAC</a> 
                                <a class="nav-link" href="https://emea.self-service.talend.com/v2/_catalog" target="_blank">EMEA</a>
                                <a class="nav-link" href="https://us.self-service.talend.com/v2/_catalog" target="_blank">US</a>
                                <a class="nav-link" href="mailto:support.devops@talend.com">Contact</a>
                            </nav>
                        </div></div>
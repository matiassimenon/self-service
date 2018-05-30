<%-- 
    Document   : loginForm
    Created on : Jan 19, 2018, 11:53:44 AM
    Author     : francisco
--%>
<%
    Object errMessage = request.getAttribute("errMessage");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="description" content=""><meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Provisioning Platform</title>
        <link rel="stylesheet" href="cronos.css">        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    </head>
    <body >
        <div class="nav-overlay bg-5 alpha-8 gradient"></div><main>
            <div class="container-fluid"><div class="fullscreen row">
                    <div class="col-lg-4 bg-5-gradient py-4 d-flex flex-column align-items-center justify-content-center justify-content-lg-between">
                        <div class="feature-content text-center text-lg-left">
                            <p class=" mb-5"></p>

                            <figure class="lgo mb-5"><a href="http://www.talend.com" target="_blank"><img src="talend.png" class="imgresponsive" alt="Talend website"></a></figure>
                            <h2 class="bold color-1 mb-4"><span class="font-lg">Welcome</span> <span class="d-block">to Provisioning</span></h2>
                            <p class="lead color-1 alpha-6">Please fill your credentials to get started</p>
                        </div>

                        <div class="feature-footer"><hr class="b-4 d-flex mx-auto">
                            <nav class="nav justify-content-center color-1">
                                <a class="nav-link" href="https://wiki.talend.com/display/support/Support+devops/" target="_blank">Devops Wiki</a>
                                <a class="nav-link" href="https://apac.self-service.talend.com/v2/_catalog" target="_blank">APAC</a> 
                                <a class="nav-link" href="https://emea.self-service.talend.com/v2/_catalog" target="_blank">EMEA</a>
                                <a class="nav-link" href="https://us.self-service.talend.com/v2/_catalog" target="_blank">US</a>
                            </nav>
                        </div></div>
                    <div class="col-lg-8 py-4 d-flex flex-column align-items-center justify-content-center align-content-center">
                        <div class="login-form w-lg-50">
                            <div class="blog-post-nav mb-3">
                                <a href="register.jsp">     <img src="add_account.png"></img> Signup for a free account</a></div>
                            <hr class="mb-5"><h1 class="display-4 accent mb-5"><font color="green">Login to Provisioning </font></h1>
                            <form action="LoginServlet" method="post"  class="cozy" novalidate="">
                                <div class="form-group control">
                                    <label class="col-sm-2 control-label">Username</label><input type="text" id="login_username"  name= "username" class="form-control">
                                </div>
                                <div class="form-group control">
                                    <label class="col-sm-2 control-label">Password</label><input type="password" name="password" id="login_password" class="form-control"></div>
                                <div class="d-flex align-content-center justify-content-center">
                                    <button type="submit" class="btn-lg btn-success">Login</button>
                                    <p><a href="forgotPasswd1.jsp">  Forgot Password?</a> </p> 
                                    
                                </div>
                                <div class="d-flex align-content-center justify-content-center">
                                    <%if (errMessage != null) {%><h4 style="color: red"><%=errMessage%></h4><%}%>
                                </div>
                            </form> </div></div></div></div>
        
        </main>

        
    </body>

</html>

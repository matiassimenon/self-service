<%-- 
    Document   : forgotPasswd
    Created on : 2018-4-3, 12:54:26
    Author     : aiming
--%>
<%@page import="com.selfservice.model.User"%>
<%
    Object errMessage=request.getAttribute("errMessage");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        <link rel="stylesheet"  type="text/css"  href="selfservice.css"/>
    </head>

    <body>
        <div  id="content">
            <%@include file="navigator.jsp"%>
            <% 
                User user1 = (User)request.getSession(false).getAttribute("resetUser");
            %>            
            <h3 class="text-primary">Reset Password Step3</h3>
            <form action="ForgotPasswdServlet?step=3" method = "post">
                <table id="login_form" cellspacing="20" align="center" style="border:2px solid green;" >
                    <tr><td>Username:</td><td><input type="text" id="username" name="username"  readonly value="<%=user1.getUsername()%>"></td></tr>
                    <tr><td>New Password:</td><td><input type="password" id="password1" name="password1" required="required" onkeyup="checkPasswd();"></td></tr>
                    <tr><td>Retry Password:</td><td><input type="password" id="password2" name="password2" required="required" onkeyup="checkPasswd();"></td></tr>
                    <tr><td align="center"><button type="submit" class="btn btn-success" id="submitBtn">Reset</button></td><td><span id="passwdMsg"></span></td></tr>
                </table>
            </form>         
            <%if (errMessage != null){%><h4><%=errMessage%></h4><%}%>   
        </div>
    </body>
</html>

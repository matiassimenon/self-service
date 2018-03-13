<%-- 
    Document   : resetPassword.jsp
    Created on : 2018-3-14, 4:34:35
    Author     : Zongyong Qin
--%>

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
            <h1>Input Talend Email</h1>
            <form action="ResetPasswordServlet">
                <table id="login_form" cellspacing="20" align="center" style="border:2px solid green;" >
                    <tr><td>Talend Email:</td><td><input type="text" id="email" name="email" placeholder="Enter your Talend Email" required="required"></td></tr>
                    <tr><td colspan=2 align="center"><button type="submit">Reset</button></td></tr>
                </table>
            </form>
            
            <%
             String message = (String)request.getAttribute("message");
             if (message != null) {
            %>
            <p><%=message%></p>
            <%}%>
        </div> 
            <%@include file="footer.jsp"%> 
    </body>
</html>

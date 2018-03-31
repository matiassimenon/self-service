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
        <script src="selfservice.js"> </script>
    </head>

    <body>
        <div  id="content">
            <%@include file="navigator.jsp"%>
            <%
                String step = request.getParameter("step");
                if (step == null) {
                    response.sendRedirect("login.jsp");
                } else if (step.endsWith("1")) {
            %>            
            <h3>Input Talend Email</h3>
            <form action="ResetPasswordServlet?step=1" method = "post">
                <table id="login_form" cellspacing="20" align="center" style="border:2px solid green;" >
                    <tr><td>Talend Email:</td><td><input type="text" id="email" name="email" placeholder="Enter your Talend Email" required="required"></td></tr>
                    <tr><td align="center" colspan="2"><button type="submit">Reset</button> <a align="center" href="login.jsp">Login</a></td></tr>
                </table>
            </form>
            <%
            } else if (step.equals("2")) {
                String sessionID = request.getParameter("id");
                String currentSessionID = request.getSession().getId();
                if (currentSessionID.equalsIgnoreCase(sessionID)) {
            %>
            <h3>Reset Password</h3>
            <form action="ResetPasswordServlet?step=2" method = "post">
                <table id="login_form" cellspacing="20" align="center" style="border:2px solid green;" >
                    <tr><td>Talend Email:</td><td><input type="text" id="email" name="email"  readonly value="<%=request.getParameter("email")%>"></td></tr>
                    <tr><td>New Password:</td><td><input type="password" id="password1" name="password1" required="required" onkeyup="checkPasswd();"></td></tr>
                    <tr><td>Retry Password:</td><td><input type="password" id="password2" name="password2" required="required" onkeyup="checkPasswd();"></td></tr>
                    <tr><td align="center"><button type="submit" id="submitBtn">Save</button></td><td><span id="passwdMsg"></span></td></td></tr>
                </table>
            </form>            
            <%} else {
                request.setAttribute("message", "Session is invalid or expired! Please try again. Page redirect to login in 5s.");
                response.setHeader("Refresh","5;url=login.jsp");                
            }}

             String message = (String)request.getAttribute("message");
             if (message != null) {
                 out.print("<p>" + message + "</p>");
              }
            %>
        </div>   
        <%@include file="footer.jsp"%> 
    </body>
</html>

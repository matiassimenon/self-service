<%-- 
    Document   : forgotPasswd
    Created on : 2018-4-3, 12:54:26
    Author     : aiming
--%>
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
        <script src="selfservice.js"> </script>
    </head>

    <body>
        <div  id="content">
            <%@include file="navigator.jsp"%>
            <% 
                User user1 = (User)request.getSession(false).getAttribute("resetUser");
            %>
            <h3>Reset Password Step 2</h3>
            <form action="ForgotPasswdServlet?step=2" method = "post">
                <table id="login_form" cellspacing="20" align="center" style="border:2px solid green;" >
                    <tr><td>Question:</td><td><input style="width: 400px"type="text" id="question" readonly name="question"  required="required" value="<%=user1.getQuestion()%>"></td></tr>
                    <tr><td>Answer</td><td><input type="text" style="width: 400px" id="answer" name="answer"  required="required"></td></tr>
                    <tr><td align="center" colspan="2"><button type="submit">Next</button> <a align="center" href="login.jsp">Login</a></td></tr>
                </table>
            </form>      
            <%if (errMessage != null){%><h4><%=errMessage%></h4><%}%>        
        </div>
    </body>
</html>

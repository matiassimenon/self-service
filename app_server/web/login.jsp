<%-- 
    Document   : loginForm
    Created on : Jan 19, 2018, 11:53:44 AM
    Author     : francisco
--%>
<%
    Object errMessage=request.getAttribute("errMessage");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Provisioning Platform</title>	
		<link rel="stylesheet"  type="text/css"  href="selfservice.css"/>		
	</head>
	<body >
            <div  id="content" align="center">
                <%@include file="navigator.jsp"%>
                <br><br>
                <div >
		<h1>Provisioning Platform</h1>
                <h3>Login</h3>
		<form action="LoginServlet" method="post">
                    <table id="login_form" cellspacing="20" align="center" style="border:2px solid green;" >
			<tr><td>Talend username:</td><td><input type="text" id="id" name="username" placeholder="Enter your Talend username" required="required"></td></tr>
			<tr><td>Password:</td><td> <input type="password" name="password" placeholder="Enter your password" required></td></tr>
                        <tr><td align="right"><button type="submit">Login </button></td><td><a href="register.jsp">Sign Up</a></td></tr></table>
                        <p><a href="forgotPasswd1.jsp">Forgot Password?</a> </p>                         
		</form> 
                <%if (errMessage != null){%><h4 class="save_err"><%=errMessage%></h4><%}%>
                
                </div>
            </div>
                <%@include file="footer.jsp"%>
	</body>
        
        
        
</html>

<%-- 
    Document   : loginForm
    Created on : Jan 19, 2018, 11:53:44 AM
    Author     : francisco
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Self service</title>		
		<link rel="stylesheet"  type="text/css"  href="selfservice.css"/>		
	</head>
	<body>
                <%@include file="navigator.jsp"%>
		<h1>Self service Platform Login</h1>
                <h3>Login</h3>
		<form action="LoginServlet" method="post">
                    <table id="login_form" cellspacing="20" align="center" style="border:2px solid green;" >
			<tr><td>Talend username:</td><td><input type="text" id="id" name="username" placeholder="Enter your Talend username" required="required"></td></tr>
			<tr><td>Password:</td><td> <input type="password" name="password" placeholder="Enter your password" required></td></tr>
			<tr><td colspan=5 align="center"><button type="submit">Login </button></td></tr></table>
                    <p> <a href="register.jsp">Sign up</a></p>
		</form>
	</body>
</html>

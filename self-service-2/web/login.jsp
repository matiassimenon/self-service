<%-- 
    Document   : loginForm
    Created on : Jan 19, 2018, 11:53:44 AM
    Author     : francisco
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Self service</title>
		<style>
		h1{
		margin:25px;
		text-align:center;
		background-color:#003366;
		color:#fff;
		}
		login_form{
		border:2px solid green;
		margin: 5em;
		}
		p{
		text-align:center;
		font-size: 16pt;
		}
		</style>
	</head>
	<body>
		<h1>Self service Platform Login</h1>
		<form action="LoginServlet" method="post">
			<table id="login_form" cellspacing="20" align="center">
			<tr><td>Talend username:</td><td><input type="text" id="id" name="username" placeholder="Enter your Talend username" required="required"></td></tr>
			<tr><td>Password:</td><td> <input type="password" name="password" placeholder="Enter your password" required></td></tr>
			<tr><td colspan=5 align="center"><button type="submit">Login </button></td></tr></table>
                        <p>If not registered yet, <a href="register.jsp">Register</a></p>
		</form>
	</body>
</html>

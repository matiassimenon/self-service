<%--
Views should be stored under the WEB-INF folder so that
they are not accessible except through controller process.

This JSP is here to provide a redirect to the dispatcher
servlet but should be the only JSP outside of WEB-INF.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Support Self Service</title>
		<style>
			#reg_form{
			text-align:justify;
			padding:15px 15px;
			background-color:#003366;
			height:400px;
			border-radius:15px;
			}
			td{
			width:100px;
			color:white;
			}
			p{
			text-align:center;
			font-size:16pt;
			color:#000066;
			}
			h1{
			margin:25px;
			text-align:center;
			background-color:#003366;
			color:#fff;
			}
		</style>
	</head>
	<body>
	<h1>Self service Platform Registration</h1>
	<form action="controller" method="post">
		<table id="reg_form" cellspacing="20" align="center">
		<tr><td>First Name:</td><td><input type="text" name="firstname" placeholder="firstname" required="required"></td></tr>
		<tr><td>Last Name:</td><td><input type="text" name="lastname" placeholder="lastname" required></td></tr>
                <tr><td>Username:</td><td> <input type="text" id="id" name="username" placeholder="talend username" required></td></tr>
                <tr><td>Talend Email:</td><td> <input type="email" name="email" placeholder="email@talend.com" required></td></tr>
                <tr><td>Department:</td><td><input type="text" name="department" placeholder="support, sales, rnd" required="required"></td></tr>
		<tr><td>Password:</td><td> <input type="password" name="password" placeholder="alphanumeric password" required></td></tr>
		<tr><td>City:</td><td><input type="text" name="city" placeholder="ATL, BLR, CGN, IRV, LON" required="required"></td></tr>
		<tr><td>Region:</td><td><input type="text" name="region" placeholder="APAC, EMEA, US" required="required"></td></tr>
                <tr><td>Admin:</td><td><input type="checkbox" name="admin" value="false"></td></tr>
		<tr><td colspan=5 align="center"><button type="submit">REGISTER</button></td></tr></table>
		<p>If already registered, <a href="login.jsp">login</a></p>
	</form>
</body>
</html>

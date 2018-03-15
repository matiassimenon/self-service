<%--
Views should be stored under the WEB-INF folder so that
they are not accessible except through controller process.

This JSP is here to provide a redirect to the dispatcher
servlet but should be the only JSP outside of WEB-INF.
--%>
<%
    Boolean saveOK=request.getAttribute("saveOK")!=null? Boolean.valueOf(request.getAttribute("saveOK").toString()):true;
    Object errMessage=request.getAttribute("errMessage");
%>
<%@page import="com.selfservice.model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Support Self Service</title>
                <link rel="stylesheet"  type="text/css"  href="selfservice.css"/>
		<style>
			#reg_form{
			text-align:justify;
			padding:15px 15px;
			background-color:#fff;
			height:350px;
			border-radius:15px;
			}
                        
			td{
			width:120px;
			color:#003366;;
			}
                        select{
                            width: 100px;
                        }
			
		</style>
                <script src="selfservice.js"> </script>
                <script></script>       
	</head>
	<body>
	<div  id="content">
        <%@include file="navigator.jsp"%>
        
        <%
            user= (User)request.getAttribute("user");
            if(user ==null){
                user = new User();
            }
        %>
        <h1>Self service Platform Registration</h1>
        <h3>Register</h3>
	<form id="registerForm" action="SaveUser?register.jsp" method="post">
		<table id="reg_form"  align="center" style="border:2px solid green; padding:5px 5px;" >
		<tr>
                    <td>First Name:</td><td><input type="text" name="firstname" placeholder="First name" maxlength="30" required="required" value="<%=user.getFirstname()%>"></td>
                    <td>Department:</td>
                    <td><select name="department" required="required">
                        <option value="sales">Sales</option>
                        <option value="rd">RD</option>
                        <option value="support">Support</option>
                    </select></td>
                </tr>
		<tr>
                    <td>Last Name:</td><td><input type="text" name="lastname" maxlength="50" placeholder="Last name"  required="required" value="<%=user.getLastname()%>"></td>
                    <td>Region:</td>
                    <td> <select id="region" name="region" required="required" onchange="if(this.value != '') setCity(this.options[this.selectedIndex].value);">
                            <option value="">Please select...</option>
                            <option value="APAC">APAC</option>
                            <option value="EMEA">EMEA</option>
                            <option value="US">US</option>
                        </select> </td>
                </tr>
                <tr>
                    <td>Username:</td><td> <input type="text" id="username" name="username" placeholder="Talend username"  maxlength="30" required="required" value="<%=user.getUsername()%>"></td>
                    <td>City:</td><td> <select id="city" name="city" required="required">
                            <option value="">Please select...</option>
                            
                        </select> </td>
                </tr>
                <tr>
                    <td>Talend Email:</td><td> <input type="email" name="email" placeholder="test@talend.com" maxlength="50" required="required" value="<%=user.getEmail()%>"></td>
                    <td>Admin Request:</td><td><input type="checkbox" id="admin" name="admin"  value="true"></td>
                </tr>
                
                <tr><td>Password:</td><td> <input type="password" id="password1" placeholder="password" name="password1" maxlength="20"  required="required" onkeyup="checkPasswd();" value="<%=user.getPassword()%>"></td>
                    <td> <input type="password" maxlength="20" placeholder="Re-try password" id="password2" name="password2" required="required" onkeyup="checkPasswd();" value="<%=user.getPassword()%>"></td> 
                    <td><span id="passwdMsg"></span></td></tr>
		
                <tr><td colspan=5 align="center"><button  id="submitBtn" type="submit" >Register</button></td></tr></table>
		<p>Have an Account? <a href="login.jsp">login</a></p>
                <%if (saveOK && errMessage!= null ){%><h3 class="save_ok"><%=errMessage%></h3><%} else if(errMessage!=null){%> <h3 class="save_err"><%=errMessage%></h3> <%}%>
	</form>
        </div>                   
</body>
<%@include file="footer.jsp"%>
</html>

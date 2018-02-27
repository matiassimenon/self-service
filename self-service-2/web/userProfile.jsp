<%-- 
    Document   : regularUserProfile.jsp
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>
<%@page import="java.util.List"%>
<%@page import="com.selfservice.controller.UserLoginValidate"%>
<%@page import="com.selfservice.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Self service</title>
        <link rel="stylesheet"  type="text/css"  href="selfservice.css"/>
        <script src="selfservice.js"> </script>
                
    </head>
    <body>
        <%@include file="navigator.jsp"%>
        <%  
        String firstname=user.getFirstname();
        String lastname=user.getLastname();
        String username=user.getUsername();
        String email=user.getEmail();
        String department=user.getDepartment();
        String cityname=user.getCity();
        String region=user.getRegion();
        Boolean isadmin=user.getAdmin();
        String password=user.getPassword();
        %>
        <h3>Profile</h3>
        <form   method="post" action="SaveUser?userProfile.jsp">
            	<table id="reg_form"  align="center" style="border:2px solid green; padding:10px 10px;" >
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
                            <option value="apac">APAC</option>
                            <option value="emea">EMEA</option>
                            <option value="us">US</option>
                        </select> </td>
                </tr>
                <tr>
                    <td>Username:</td><td> <input type="text" id="username" name="username" placeholder="Talend username"  maxlength="30" required="required" readonly="true" value="<%=user.getUsername()%>"></td>
                    <td>City:</td><td> <select id="city" name="city" required="required">
                            <option value="">Please select...</option>
                            
                        </select> </td>
                </tr>
                <tr>
                    <td>Talend Email:</td><td> <input type="email" name="email" placeholder="test@talend.com" maxlength="50" required="required" value="<%=user.getEmail()%>"></td>
                    <%if (!user.getAdmin()) {%>
                    <td>Admin Request:</td><td><input type="checkbox" id="admin" name="admin"  value="false"></td>
                    <%}%>
                </tr>
                
                <tr><td>Password:</td><td> <input type="password" id="password1" placeholder="password" name="password1" maxlength="20"  required="required" onblur="checkPasswd();" value="<%=user.getPassword()%>"></td>
                    <td> <input type="password" maxlength="20" placeholder="Re-try password" id="password2" name="password2" required="required" onkeyup="checkPasswd();" value="<%=user.getPassword()%>"></td> 
                    <td><span id="passwdMsg"></span></td></tr>
		
                <tr><td colspan=5 align="center"><button type="submit" >Save</button></td></tr></table>
        </form>
    </body>
</html>

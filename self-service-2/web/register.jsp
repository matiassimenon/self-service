<%--
Views should be stored under the WEB-INF folder so that
they are not accessible except through controller process.

This JSP is here to provide a redirect to the dispatcher
servlet but should be the only JSP outside of WEB-INF.
--%>
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
			height:400px;
			border-radius:15px;
			}
                        
			td{
			width:100px;
			color:#003366;;
			}
                        select{
                            width: 100px;
                        }
			
		</style>
                <script src="select.js"> </script>
                <script>
                //define the city  data array
                var cityArr = [];
                cityArr['apac'] =
                [
                 {txt:'Bangalore', val:'ban'},
                 {txt:'Beijing', val:'bei'},
                 {txt:'Singapore', val:'sin'},
                 {txt:'Sydney', val:'syd'}
                 ];
                cityArr['us'] =
                [
                 {txt:'Boston', val:'bos'},
                 {txt:'Irvine', val:'irv'},
                 {txt:'Redwood', val:'red'}
                 ];
                 cityArr['emea'] =
                [
                 {txt:'Berkshire', val:'ber'},
                 {txt:'Barcelona', val:'bar'},
                 {txt:'Bonn', val:'bon'},
                 {txt:'Feldkirchen', val:'fel'},
                 {txt:'Nürnberg', val:'nur'},
                 {txt:'Suresnes', val:'sur'},
                 {txt:'Switzerland', val:'swi'}
                 ];
                function setCity(city)
                {
                    setSelectOption('city', cityArr[city], 'Please select...');
                }
                function checkPasswd(){
                    var pwd1=document.getElementById("password1").value;
                    var pwd2=document.getElementById("password2").value;
                    if(pwd1 !== pwd2){
                        document.getElementById("passwdMsg").innerHTML="Password Not Matched!";
                        return;
                    }
                    document.getElementById("passwdMsg").innerHTML="Password Matched!";
               
                }
                </script>

	</head>
	<body>
	
        <%@include file="navigator.jsp"%>
        <h1>Self service Platform Registration</h1>
        <h3>Register</h3>
	<form id="registerForm" action="Register" method="post">
		<table id="reg_form"  align="center" style="border:2px solid green;" >
		<tr>
                    <td>First Name:</td><td><input type="text" name="firstname" placeholder="First name" maxlength="30" required="required"></td>
                    <td>Department:</td>
                    <td><select name="department" required="required">
                        <option value="sales">Sales</option>
                        <option value="rd">RD</option>
                        <option value="support">Support</option>
                    </select></td>
                </tr>
		<tr>
                    <td>Last Name:</td><td><input type="text" name="lastname" maxlength="50" placeholder="Last name"  required="required"></td>
                    <td>Region:</td>
                    <td> <select id="region" name="region" required="required" onchange="if(this.value != '') setCity(this.options[this.selectedIndex].value);">
                            <option value="">Please select...</option>
                            <option value="apac">APAC</option>
                            <option value="emea">EMEA</option>
                            <option value="us">US</option>
                        </select> </td>
                </tr>
                <tr>
                    <td>Username:</td><td> <input type="text" id="username" name="username" placeholder="Talend username"  maxlength="30" required="required"></td>
                    <td>City:</td><td> <select id="city" name="city" required="required">
                            <option value="">Please select...</option>
                            
                        </select> </td>
                </tr>
                <tr>
                    <td>Talend Email:</td><td> <input type="email" name="email" placeholder="test@talend.com" maxlength="50" required="required"></td>
                    <td>Admin:</td><td><input type="checkbox" id="admin" name="admin"  value="true"></td>
                </tr>
                
                <tr><td>Password:</td><td> <input type="password" id="password1" placeholder="password" name="password1" maxlength="20"  required="required" onblur="checkPasswd();"></td>
                    <td> <input type="password" maxlength="20" placeholder="Re-try password" id="password2" name="password2" required="required" onblur="checkPasswd();"></td> 
                    <td><span id="passwdMsg"></span></td></tr>
		
                <tr><td colspan=5 align="center"><button type="submit" >REGISTER</button></td></tr></table>
		<p>Have an Account? <a href="login.jsp">login</a></p>
	</form>
</body>
</html>

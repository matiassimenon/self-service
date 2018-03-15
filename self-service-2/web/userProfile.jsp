<%-- 
    Document   : regularUserProfile.jsp
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>
<%@page import="java.util.List"%>
<%@page import="com.selfservice.model.User"%>
<%
    Boolean saveOK=request.getAttribute("saveOK")!=null? Boolean.valueOf(request.getAttribute("saveOK").toString()):true;
    Object errMessage=request.getAttribute("errMessage");
    User user1=(User)request.getSession(false).getAttribute("user");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Self service</title>
        <link rel="stylesheet"  type="text/css"  href="selfservice.css"/>
        <script src="selfservice.js"> </script>
        <script>
            window.onload=function(){
                var region="<%=user1.getRegion()%>";
                var department="<%=user1.getDepartment()%>";
                var city="<%=user1.getCity()%>";
                setSelected("department", department);
                setSelected("region", region);
                setCity(region);
                setSelected("city", city);               
            };
        </script>        
    </head>
    <body>
        <div  id="content">
        <%@include file="navigator.jsp"%>

        <h3>Profile</h3>
        <form   method="post" action="SaveUser?userProfile.jsp">
            	<table id="reg_form"  align="center" style="border:2px solid green; padding:10px 10px;" >
		<tr>
                    <td>First Name:</td><td><input type="text" name="firstname" placeholder="First name" maxlength="30" required="required" value="<%=user.getFirstname()%>"></td>
                    <td>Department:</td>
                    <td><select id="department" name="department" required="required">
                        <option value="support">Support</option>   
                        <option value="escalation">Escalation</option>   
                        <option value="sales">Sales</option>
                        <option value="rd">RD</option>
                       
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
                    <td>Username:</td><td> <input type="text" id="username" name="username" placeholder="Talend username"  maxlength="30" required="required" readonly="true" style="background-color: graytext" value="<%=user.getUsername()%>"></td>
                    <td>City:</td><td> <select id="city" name="city" required="required">
                            <option value="">Please select...</option>
                            
                        </select> </td>
                </tr>
                <tr>
                    <td>Talend Email:</td><td> <input type="email" name="email" placeholder="test@talend.com" maxlength="50" required="required" value="<%=user.getEmail()%>"></td>
                    <%if (!user.getAdmin()) {%>
                    <td>Admin Request:</td><td><input type="checkbox" id="admin" name="admin"  value="true" <%if(user.isAdminRequest()){%>checked="checked" <%}%>></td>
                    <%}%>
                </tr>
                
                <tr><td>Password:</td><td> <input type="password" id="password1" placeholder="password" name="password1" maxlength="20"  required="required" onkeyup="checkPasswd();" value="<%=user.getPassword()%>"></td>
                    <td> <input type="password" maxlength="20" placeholder="Re-try password" id="password2" name="password2" required="required" onkeyup="checkPasswd();" value="<%=user.getPassword()%>"></td> 
                    <td><span id="passwdMsg"></span></td></tr>
		
                <tr><td colspan=5 align="center"><button id="submitBtn"  type="submit" >Save</button></td></tr></table>
        </form>
         <%if (saveOK && errMessage!= null ){%><h3 class="save_ok"><%=errMessage%></h3><%} else if(errMessage!=null){%> <h3 class="save_err"><%=errMessage%></h3> <%}%>
        </div>               
    </body>
    <%@include file="footer.jsp"%>
    
</html>

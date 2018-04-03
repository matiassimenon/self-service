<%-- 
    Document   : regularUserProfile.jsp
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>
<%@page import="java.util.List"%>
<%@page import="com.selfservice.model.User"%>
<%
   
    Object errMessage=request.getAttribute("errMessage");
%>

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
        <div  id="content">
        <%@include file="navigator.jsp"%>
        <script>
            window.onload=function(){
                var region="<%=user.getRegion()%>";
                var department="<%=user.getDepartment()%>";
                var city="<%=user.getCity()%>";
                var question="<%=user.getQuestion()%>";
                setSelected("department", department);
                setSelected("region", region);
                setCity(region);
                setSelected("city", city);     
                setSelected(document.getElementById("question"), question);
                chooseQuestion();
            };
       function chooseQuestion(){
           var question=document.getElementById("question");
           if(question.value != ""){
               document.getElementById("answer").required=true;               
           }else{
               document.getElementById("answer").required=false;
           }
       }            
        </script>   
        <h3>Profile</h3>
        <form   method="post" action="SaveUser?userProfile.jsp">
            	<table id="reg_form"  align="center" style="border:2px solid green; padding:10px 10px;" >
		<tr>
                    <td>First Name:</td><td><input type="text" name="firstname" placeholder="First name" maxlength="30" required="required" value="<%=user.getFirstname()%>"></td>
                    <td>Department:</td>
                    <td><select id="department" name="department" style="width:120px" required="required">
                        <option value="support">Support</option>   
                        <option value="escalation">Escalation</option>   
                        <option value="sales">Sales</option>
                        <option value="rd">RD</option>
                       
                    </select></td>
                </tr>
		<tr>
                    <td>Last Name:</td><td><input type="text" name="lastname" maxlength="50" placeholder="Last name"  required="required" value="<%=user.getLastname()%>"></td>
                    <td>Region:</td>
                    <td> <select id="region" name="region" required="required" style="width:120px" onchange="if(this.value != '') setCity(this.value);">
                            <option value="">Please select...</option>
                            <option value="APAC">APAC</option>
                            <option value="EMEA">EMEA</option>
                            <option value="US">US</option>
                        </select> </td>
                </tr>
                <tr>
                    <td>Username:</td><td> <input type="text" id="username" name="username" placeholder="Talend username"  maxlength="30" required="required" readonly="true" style="background-color: green" value="<%=user.getUsername()%>"></td>
                    <td>City:</td><td> <select id="city" name="city" style="width:120px" required="required">
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
                <tr><td>Question:</td> <td colspan="3" ><select name="question" id="question"  style=" width: 420px;" required="required" onchange="chooseQuestion();">
                            <option value="">Please select one question ...</option>
                            <option value="What is the first and last name of your first boyfriend or girlfriend?">What is the first and last name of your first boyfriend or girlfriend?</option>
                            <option value="Which phone number do you remember most from your childhood?">Which phone number do you remember most from your childhood?</option>
                            <option value="What was your favorite place to visit as a child?">What was your favorite place to visit as a child?</option>
                            <option value="Who is your favorite actor, musician, or artist?">Who is your favorite actor, musician, or artist?</option>
                            <option value="What is the name of your favorite pet?">What is the name of your favorite pet?</option>
                            <option value="In what city were you born?">In what city were you born?</option>
                            <option value="What is your favorite Talend product?">What is your favorite Talend product?</option>
                            <option value="What is the name of your first school?">What is the name of your first school?</option>
                        </select></td>
                
                </tr>
                <tr><td>Answer:</td> <td><input name="answer" id="answer"  ></input></td></tr>		
                <tr><td colspan=5 align="center"><button id="submitBtn"  type="submit" >Save</button></td></tr></table>
        </form>
         <% if(errMessage!=null){%> <h4><%=errMessage%></h4> <%}%>
        </div>               
    </body>
    <%@include file="footer.jsp"%>
    
</html>

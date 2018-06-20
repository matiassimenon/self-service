<%-- 
    Document   : profile
    Created on : 2018-6-1, 9:54:23
    Author     : aiming
--%>
<%@page import="com.selfservice.model.User"%>
<%
    User user1 = (User)request.getSession(false).getAttribute("user");
    if(user1 == null){
        user1= new User();
    }
%>
<style>
        select{
            width: 200px;
        }    
     td{
                border: solid 0px #a0c6e5; height: 20px;               
      }  
    
</style>
<table id="reg_form"  align="center" cellpadding="5px;" style="border:1px solid green;" >
		<tr>
                    <td class="td1">First Name:</td><td><input type="text" name="firstname" placeholder="First name" maxlength="30" required="required" value="<%=user1.getFirstname()%>"></td>
                    <td class="td1">Department:</td>
                    <td><select name="department" id="department" required="required" >
                        <option value="support">Support</option>   
                        <option value="escalation">Escalation</option>   
                        <option value="sales">Sales</option>
                        <option value="rd">R&D</option>
                        <option value="csa">CSA</option>
                        <option value="pm">PM</option>
                        <option value="ps">PS</option>
                    </select></td>
                </tr>
		<tr>
                    <td class="td1">Last Name:</td><td><input type="text" name="lastname"  maxlength="50" placeholder="Last name"  required="required" value="<%=user1.getLastname()%>"></td>
                    <td class="td1">Region:</td>
                    <td> <select id="region" name="region" id="region" required="required" onchange="if(this.value != '') setCity(this.options[this.selectedIndex].value);">
                            <option value="">Please select...</option>
                            <option value="APAC">APAC</option>
                            <option value="EMEA">EMEA</option>
                            <option value="US">US</option>
                        </select> </td>
                </tr>
                <tr>
                    <td class="td1">Username:</td><td> <input type="text" id="username" name="username" placeholder="Talend username" <%if(user1.getUsername().length()>0){%> readonly="readonly" style="color:#7d8993;" <%}%>  maxlength="30" required="required" value="<%=user1.getUsername()%>"></td>
                    <td class="td1">City:</td><td> <select id="city" name="city" required="required">
                            <option value="">Please select...</option>
                            
                        </select> </td>
                </tr>
                <tr>
                    <td class="td1">Talend Email:</td><td> <input type="email" name="email" placeholder="test@talend.com" pattern="[a-z0-9._%+-]+@talend.com" maxlength="50" required="required" value="<%=user1.getEmail()%>"></td>
                    <td class="td1">Admin Request:</td><td><input type="checkbox" id="admin" name="admin"  value="true" <%if(user1.isAdminRequest()){%>checked="checked" <%}%> ></td>
                </tr>
                
                <tr><td class="td1">Password:</td><td colspan="2"> <input type="password" id="password1" placeholder="password" name="password1" maxlength="20"  required="required" onkeyup="checkPasswd();" value="<%=user1.getPassword()%>">
                     <input  style="width:230px;" type="password" maxlength="20" placeholder="Re-try password" id="password2" name="password2" required="required" onkeyup="checkPasswd();" value="<%=user1.getPassword()%>"></td>
                    <td><span id="passwdMsg"></span></td></tr>
                <tr><td class="td1">Question:</td> <td colspan="3" ><select name="question" id="question" required="required" style=" width: 400px;" onchange="chooseQuestion();">
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
                <tr><td class="td1">Answer:</td> <td><input name="answer" type="password" id="answer"  ></input></td></tr>

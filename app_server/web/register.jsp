<%--
Views should be stored under the WEB-INF folder so that
they are not accessible except through controller process.

This JSP is here to provide a redirect to the dispatcher
servlet but should be the only JSP outside of WEB-INF.
--%>

<%@page import="com.selfservice.model.User"%>
<%@include  file="left.jsp" %>
<style>             
            td{
                border: solid 0px #a0c6e5; height: 20px;               
            }            
 </style> 
        <%
            if (user == null) {
                user = new User();
            }           
        %>
      
        <script>
       window.onload=function(){
           var department="<%=user.getDepartment()%>";
           var region="<%=user.getRegion()%>";
           var city="<%=user.getCity()%>";
           var question="<%=user.getQuestion()%>";
           setSelected(document.getElementById("region"), region);
           setSelected(document.getElementById("department"), department);
           if(!isEmpty(region)){
                setCity(region);
             }
          setSelected(document.getElementById("city"), city); 
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

 <div class="col-lg-8 py-4 d-flex flex-column align-items-center justify-content-top align-content-center">
                        <div class="login-form w-lg-50">
                            <p>
                            <h1 class="display-4 accent mb-5"><font color="green">Register </font></h1>
	<form id="registerForm" action="SaveUser?register.jsp" method="post" class="cozy" >
		<table id="reg_form"  align="center" style="border:1px solid green; padding:5px 5px;" >
		<tr>
                    <td>First Name:</td><td><input type="text" name="firstname" placeholder="First name" maxlength="30" required="required" value="<%=user.getFirstname()%>"></td>
                    <td>Department:</td>
                    <td><select name="department" id="department" required="required">
                        <option value="support">Support</option>   
                        <option value="escalation">Escalation</option>   
                        <option value="sales">Sales</option>
                        <option value="rd">RD</option>
                        <option value="csa">CSA</option>
                        <option value="pm">PM</option>
                        <option value="ps">PS</option>
                    </select></td>
                </tr>
		<tr>
                    <td>Last Name:</td><td><input type="text" name="lastname" maxlength="50" placeholder="Last name"  required="required" value="<%=user.getLastname()%>"></td>
                    <td>Region:</td>
                    <td> <select id="region" name="region" id="region" required="required" onchange="if(this.value != '') setCity(this.options[this.selectedIndex].value);">
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
                    <td>Talend Email:</td><td> <input type="email" name="email" placeholder="test@talend.com" pattern="[a-z0-9._%+-]+@talend.com" maxlength="50" required="required" value="<%=user.getEmail()%>"></td>
                    <td>Admin Request:</td><td><input type="checkbox" id="admin" name="admin"  value="true" <%if(user.isAdminRequest()){%>checked="checked" <%}%> ></td>
                </tr>
                
                <tr><td>Password:</td><td> <input type="password" id="password1" placeholder="password" name="password1" maxlength="20"  required="required" onkeyup="checkPasswd();" value="<%=user.getPassword()%>"></td>
                    <td> <input type="password" maxlength="20" placeholder="Re-try password" id="password2" name="password2" required="required" onkeyup="checkPasswd();" value="<%=user.getPassword()%>"></td> 
                    <td><span id="passwdMsg"></span></td></tr>
                <tr><td>Question:</td> <td colspan="3" ><select name="question" id="question" required="required" style=" width: 420px;" onchange="chooseQuestion();">
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
                <tr><td>Answer:</td> <td><input name="answer" type="password" id="answer"  ></input></td></tr>
                <tr><td colspan=5 align="center"><button  id="submitBtn" class="btn btn-success" type="submit" >Register</button></td></tr></table>
	</form>
            <p>Have an Account? <a href="login.jsp">login</a></p>
            <%if (errMessage!= null ){%><h4><%=errMessage%></h4><%} %>       
            
  </div></div>
                   </div></div>        
        </main>

        
    </body>

</html>

<%--
Views should be stored under the WEB-INF folder so that
they are not accessible except through controller process.

This JSP is here to provide a redirect to the dispatcher
servlet but should be the only JSP outside of WEB-INF.
--%>

<%@page import="com.selfservice.model.User"%>
<%@include  file="left.jsp" %>

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
                            <h1 class="display-4 accent mb-5"><font color="green">Register: </font></h1>
	<form id="registerForm" action="SaveUser?register.jsp" method="post" class="cozy" >
            <%@include file="profile.jsp" %>
                <tr><td  class="td1"><button  id="submitBtn" class="btn btn-success" type="submit" >Register</button></td> <td>Have an Account? <a href="login.jsp">login</a></td></tr></table>
	</form>
            
            <%if (errMessage!= null ){%><div><%=errMessage%></div><%} %>       
            
  </div></div>
                   </div></div>        
        </main>

        
    </body>

</html>

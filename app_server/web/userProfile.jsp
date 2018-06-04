<%-- 
    Document   : regularUserProfile.jsp
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>
<%@page import="java.util.List"%>
<%@page import="com.selfservice.model.User"%>

<%@include file="left.jsp"%>

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
       <div class="col-lg-8 py-4 d-flex flex-column align-items-left justify-content-top align-content-center">
     <%@include file="navigator.jsp"%>
     
    

        <div class="tablecontent" style=" min-height:  800px;" >
        <div class="text-lg-center color-3">Profile</div>
        <p>
        <div class="d-flex flex-column align-items-center">
        <form  method="post" action="SaveUser?userProfile.jsp">
            	<%@include file="profile.jsp" %>		
                <tr><td  class="td1"><button id="submitBtn" class="btn btn-success" type="submit" >Save</button></td></tr></table>
                <% if(errMessage!=null){%> <div><%=errMessage%></div> <%}%>
        </form>
        </div>
        </div>
        <%@include file="footer.jsp" %>
</div>
        </div></div>        
        </main>

        
    </body>

</html>

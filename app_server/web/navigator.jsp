<%-- 
    Document   : navigator
    Created on : 2018-2-21, 16:03:58
    Author     : aiming
--%>

<%@page import="com.selfservice.model.User"%>
<%@page import="com.selfservice.util.SFUtils"%>
<link rel="stylesheet" href="//apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
<%
User user = (User)request.getSession(false).getAttribute("user");
String greetString=SFUtils.getGreetingString();
%>
<div class="container">
    <div class="row">
   <%if (user != null) {%>       
   <div class="col-md-5" style="margin: 20px;" ><font color="green"><small>Good <%=greetString%>! <%=user.getFirstname()%></small></font></div>
   <div class="col-md-2"></div>
    <%}else{%>
        <div class="col-md-7"></div>
        <%}%>
        <div class="col-md-5">    
           <ul class="nav nav-pills" style="font:italic bold 9px arial,sans-serif;">
            <li><a href="https://wiki.talend.com/display/support/Support+devops/" target="_blank">Devops Wiki</a></td>
            <li><a href="https://apac.self-service.talend.com/v2/_catalog" target="_blank">APAC</a></td>
            <li><a href="https://emea.self-service.talend.com/v2/_catalog" target="_blank">EMEA</a></td>
            <li><a href="https://us.self-service.talend.com/v2/_catalog" target="_blank">US</a></td>
            <li><a href="mailto:support.devops@talend.com">Contact</a></td>
           </ul>
        </div>
    </div>
    
    <div class="row" >
        <div  class="col-md-2">           
            <image src="talend_provisioning.jpg"> </image> 
        </div>


<%if (user != null) {%>

        <%
        if (user.getAdmin()) {
        %>
        <div  class="col-md-16">
        <ul class="nav nav-tabs">
            <li ><a href="UserListServlet">Users</a></li>
            <li><a href="AdminRequestServlet">Admin Role Requests</a></li>
        <%}%>
            <li><a href="userProfile.jsp">Profile</a></li>
            <li><a href="provisionForm.jsp">Instances</a></li>
            <li><a href="TemplateListServlet">My Templates</a></li>
            <li><a href="HistoryServlet?previousRequest">My Previous Requests</a></li>
            <li><a href="HistoryServlet?historyList">History</a></li> 
            <li><a href="Logout">Logout</a></li>
        </ul>
        </div>  
<%}%>
</div>
</div>

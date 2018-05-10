<%-- 
    Document   : navigator
    Created on : 2018-2-21, 16:03:58
    Author     : aiming
--%>

<%@page import="com.selfservice.model.User"%>
<%@page import="com.selfservice.util.SFUtils"%>
<%
User user = (User)request.getSession(false).getAttribute("user");
String greetString=SFUtils.getGreetingString();
%>
<%if (user != null) {%>
    <img src="talend.png" ></img>
    <div class="label" style="font-size: small; color: green;"><b>Provisioning Platform</b></div>  
    <div  style=" position:absolute; left: 400px; color: green; font-size: small">Good <%=greetString%>! <%=user.getFirstname()%></div>
    <div class="rightalign" >
    <%} else{%>
    <img class="img_login" src="talend.png" ></img>
    <div class="label_login" style="font-size: small; color: green;"><b>Provisioning Platform</b></div>      
    <div class="rightalign_login" >
    <%}%>
    
<table cellspacing="5" align="right" id="topmenu" style="border:1px solid green; font-size: small ">
    <tr>        
        <!--<td colspan="3" class="td1"><div> <a href="https://www.talend.com/" target="_blank"><img src="talend.png" ></img></a></div>-->
        <td class="td1"><a href="https://wiki.talend.com/display/support/Support+devops/" target="_blank">Devops Wiki</a></td>
        <td class="td1"><a href="https://apac.self-service.talend.com/v2/_catalog">APAC</a></td>
        <td class="td1"><a href="https://emea.self-service.talend.com/v2/_catalog">EMEA</a></td>
        <td class="td1"><a href="https://us.self-service.talend.com/v2/_catalog">US</a></td>
        <td class="td1"><a href="mailto:support.devops@talend.com">Contact</a></td>
        
    </tr>
</table>
    </div>
      

<%if (user != null) {%>
<div class="rightalign">
    <br><br>
<table cellspacing="10" align="center" style="font-size: large">
    <tr>
       
        <td class="td1" width="30px"></td>
        <%
        if (user.getAdmin()) {
        %>
        <td class="td1"><a href="UserListServlet">Users</a></td>
        <td class="td1"><a href="AdminRequestServlet">Admin Role Requests</a></td>
        <%}%>
        <td class="td1"><a href="userProfile.jsp">Profile</a></td>
        <td class="td1"><a href="provisionForm.jsp">Instances</a></td>
        <td class="td1"><a href="TemplateListServlet">My Templates</a></td>
        <td class="td1"><a href="HistoryServlet?previousRequest">My Previous Requests</a></td>
        <td class="td1"><a href="HistoryServlet?historyList">History</a></td>  
        <td class="td1"><a href="Logout">Logout</a></td> 
    </tr>
</table>
</div>        
<%}%>

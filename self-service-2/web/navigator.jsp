<%-- 
    Document   : navigator
    Created on : 2018-2-21, 16:03:58
    Author     : aiming
--%>

<%@page import="com.selfservice.model.User"%>
<%
User user = (User)request.getSession().getAttribute("user");
%>

<table cellspacing="10" align="center" style="border:2px solid green; ">
    <tr>
        <td colspan="3" class="td1"><div> <a href="https://www.talend.com/" target="_blank"><img src="talend.png" ></img></a></div>
        <td class="td1"><a href="https://wiki.talend.com/display/support/" target="_blank">Support wiki</a></td>
        <td class="td1"><a href="https://cloud.google.com/">Google Cloud</a></td>
        <td class="td1"><a href="https://aws.amazon.com/">AWS</a></td>
        <td class="td1"><a href="https://apac-support-docker-registry/v2/_catalog">APAC repository</a></td>
        <td class="td1"><a href="https://emea-support-docker-registry/v2/_catalog">EMEA repository</a></td>
        <td class="td1"><a href="https://us-support-docker-registry/v2/_catalog">US repository</a></td>
        <td class="td1"><a href="https://help.talend.com/">Help Talend</a></td>
        
    </tr>
</table>

<%if (user != null) {%>
<table cellspacing="5" align="center" style="font-size: small">
    <tr>
        <%
        if (user.getAdmin()) {
        %>
        <td class="td1"><a href="UserListServlet">Users</a></td>
        <td class="td1"><a href="AdminRequestServlet">Admin Role Requests</a></td>
        <%}%>
        <td class="td1"><a href="userProfile.jsp">Profile</a></td>
        <td class="td1"><a href="provisionForm.jsp">Provision Form</a></td>
        <td class="td1"><a href="TemplateListServlet">My Templates</a></td>
        <td class="td1"><a href="HistoryServlet?previousRequestList.jsp">My Previous Requests</a></td>
        <td class="td1"><a href="HistoryServlet?historyList.jsp">History</a></td>  
        <td class="td1"><a href="Logout">Logout</a></td> 
    </tr>
</table>
<%}%>
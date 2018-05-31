<%-- 
    Document   : navigator
    Created on : 2018-2-21, 16:03:58
    Author     : aiming
--%>

<%@page import="com.selfservice.model.User"%>

  


<%if (user != null) {%>

        <%
        if (user.getAdmin()) {
        %>
        <div class="container">
        <nav class="nav justify-content-center nav-tabs">
             <a class="nav-link" href="UserListServlet">Users</a>
            <a class="nav-link" href="AdminRequestServlet">Admin Role Requests</a>
        <%}%>
            <a class="nav-link" href="userProfile.jsp">Profile</a>
            <a class="nav-link" href="provisionForm.jsp">Instances</a>
            <a class="nav-link" href="TemplateListServlet">My Templates</a>
            <a class="nav-link" href="HistoryServlet?previousRequest">My Previous Requests</a>
            <a class="nav-link" href="HistoryServlet?historyList">History</a> 
            <a class="nav-link" href="Logout">Logout</a>
        </nav>
        </div> 
<%}%>



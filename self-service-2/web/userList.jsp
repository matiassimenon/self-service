<%-- 
    Document   : userHistoryList
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>
<%@page import="com.selfservice.model.User"%>
<%
   User user = (User)request.getSession().getAttribute("user");
    if(user==null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Self service</title>
        <link rel="stylesheet"  type="text/css"  href="selfservice.css"/>
    </head>
    <body>
        <%@include file="navigator.jsp"%>
        <%@include file="menu.jsp"%>
        <h3>Users</h3>
        <form   method="post" action="">
            <table  align="center" style="border:2px solid green; padding:15px 15px; height:400px; width: 400px; "></table>
        </form>
    </body>
</html>

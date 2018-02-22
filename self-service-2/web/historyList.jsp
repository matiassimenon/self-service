<%-- 
    Document   : userHistoryList
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>

<%@page import="com.selfservice.model.Request"%>
<%@page import="java.util.List"%>
<%

 List<Request> list  =(List<Request>)request.getAttribute("historyList");
     
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Self service</title>
        <link rel="stylesheet"  type="text/css"  href="selfservice.css"/>
        <link rel="stylesheet"  type="text/css"  href="table.css"/>
        <script src="select.js"></script>
        <script>
        function doSearch(txt){
            document.getElementById("historyForm").action="HistoryServlet?historyList.jsp";
            document.getElementById("historyForm").submit();
        }
        </script>
    </head>
    <body>
        <%@include file="navigator.jsp"%>
        <%@include file="menu.jsp"%>
        <h3>History</h3>
        <form  id="historyForm" method="post" action="">
                <div >
                    <table  align="center"  style="  width: 800px;">
                        <tr>
                            <td class="td1" >
                                <input placeholder="Search..." type="search" id="search" name="search" onkeypress="if(event.keyCode === 13){  doSearch(this.value);}" />
                            </td>
                        </tr>
                    </table>                   
                </div>            
            <table  align="center" border="1" bordercolor="#a0c6e5" style="  width: 800px;">
                <tr>
                    <th>Request Date</th>
                    <th>Request Status</td>
                    <th>Image Name</th>
                    <th>Salesforce Case</th>
                    <th>Username</th>
                </tr>
                <%
                    for(Request his: list){
                %>
                <tr onclick="clickRow(this)">
                    <td><%=his.getRequest_date().toString()%></td>
                    <td><%=his.getRequest_status().toString()%></td>
                    <td><%=his.getImagename()%></td>
                    <td><%=his.getSalesforce_case()%></td>
                    <td><%=his.getUsername()%></td>
                </tr>
                <%}%>
            </table>
                <div >
                    <table  align="center"  style="  width: 800px;">
                        <tr>
                            <td colspan="2"class="td1" >
                                <button type="submit" >Use for Request</button>
                            </td>
                            
                        </tr>
                    </table>
                    
                </div>
        </form>
    </body>
</html>

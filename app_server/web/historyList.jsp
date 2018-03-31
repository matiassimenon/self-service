<%-- 
    Document   : userHistoryList
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.selfservice.model.User"%>
<%@page import="com.selfservice.model.Request"%>
<%@page import="java.util.List"%>
<%
 List<Request> list  =(List<Request>)request.getAttribute("historyList");
 String username=((User)request.getSession(false).getAttribute("user")).getUsername();
 String type=(String)request.getAttribute("type");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Self service</title>
        <link rel="stylesheet"  type="text/css"  href="selfservice.css"/>
        <link rel="stylesheet"  type="text/css"  href="table.css"/>
        <script src="selfservice.js"></script>
        <script>
        function doSearch(txt){
            document.getElementById("historyForm").action="HistoryServlet";
            document.getElementById("historyForm").submit();
        }
        function selectRow(row){
            if (row.selected === 'true') {
                row.bgColor = 'white';
                row.selected = 'false';
            } else {
                row.bgColor = '#22CCCC';
                row.selected = 'true';
            } 
            //reset all the left rows
            var table = row.offsetParent;
            var rows=table.rows;
            for( var i=1; i< rows.length; i++){
                if( row != rows[i]){
                    rows[i].bgColor = 'white';
                    rows[i].selected = 'false';
                    
                }
            }
            //reset the 'use for request' button status
            var status=row.cells[1].innerText;
            var uname=row.cells[4].innerText;   
            if("pending" === status && ( "previousRequest" === "<%=type%>" || ("historyList"=== "<%=type%>" && uname === "<%=username%>")) ){
                document.getElementById("historyBtn").disabled=true;
            }else{
                document.getElementById("historyBtn").disabled=false;
            }
        }
        function useForRequst1(){
            var rows=document.getElementById("historyTable").rows;          
            var requestString="request=";
            for( var i=0; i< rows.length; i++){
                if(rows[i].selected === 'true'){
                    requestString += rows[i].cells[5].children[0].value; //template_uuid
                    break;
                }
            }
            document.getElementById("historyForm").action="UseForRequestServlet?"+requestString;
            document.getElementById("historyForm").submit();
        }        
        </script>
    </head>
    <body>
        <div  id="content">
        <%@include file="navigator.jsp"%>
        <%if("historyList".equals(type)){%>
        <h3>History</h3>
        <%} else{ %>
        <h3>My Previous Requests</h3>
        <%}%>
        <form  id="historyForm" method="post" action="">
            <input type="hidden" name="type" value="<%=type%>" />     
            <table  align="center"  style="  width: 800px; border-collapse: collapse;">
                <tr>
                    <td width="650px" class="td1"></td>
                    <td class="td1" align="right" >                                
                        <input placeholder="Search..." type="search" id="search" name="search"  onkeypress="if(event.keyCode === 13){  doSearch(this.value);}" />
                    </td>
                </tr>
            </table>                   
                       
            <table  id="historyTable" align="center" border="0" bordercolor="#a0c6e5" style="  width: 800px; border-collapse: collapse;">
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
                <tr onclick="selectRow(this)">
                    <td><%=his.getRequest_date().toString()%></td>
                    <td><%=his.getRequest_status().toString()%></td>
                    <td><%=his.getImagename()%></td>
                    <td><%=his.getSalesforce_case()%></td>
                    <td><%=his.getUsername()%></td>
                    <td class="td1"><input type="hidden" value="<%=his.getTemplate_uuid()%>"/></td>
                </tr>
                <%}%>
            </table>
             <!-- pageing table-->
             <table align="center">
                 <tr>
                    <c:if test="${currentPage != 1}">
                        <td class="td1"><a href="HistoryServlet?page=${currentPage - 1}">Previous</a></td>
                    </c:if>
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                       <c:choose>
                           <c:when test="${currentPage eq i}">
                               <td class="td1">${i}</td>
                           </c:when>
                           <c:otherwise>
                               <td class="td1"><a href="HistoryServlet?page=${i}">${i}</a></td>
                           </c:otherwise>
                       </c:choose>
                   </c:forEach>    
                    <%--For displaying Next link --%>
                    <c:if test="${currentPage lt noOfPages}">
                        <td class="td1"><a href="HistoryServlet?page=${currentPage + 1}">Next</a></td>
                    </c:if>                               
                 </tr>
             </table>
            <table  align="center"  style="  width: 800px; border-collapse: collapse;">
                <tr>
                    <td width="650px" class="td1"></td>
                    <td class="td1"  align="right">
                        <button type="button" id="historyBtn" onclick="useForRequst1();" >Use for Request</button>
                    </td>
                </tr>
            </table>

        </form>
        </div>
    </body>

    <%@include file="footer.jsp"%>
</html>

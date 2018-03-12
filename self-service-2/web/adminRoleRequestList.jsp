<%-- 
    Document   : userHistoryList
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
List<User> list  =(List<User>)request.getAttribute("adminReqList");   
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Self service</title>
        <link rel="stylesheet"  type="text/css"  href="selfservice.css"/>
        <link rel="stylesheet"  type="text/css"  href="table.css"/>
    </head>
       <script>
        function doSearch(txt){
            document.getElementById("adminReqForm").action="AdminRequestServlet";
            document.getElementById("adminReqForm").submit();
        }
        
        function saveUsers(){      
            var saveString="save";
            
            var acceptReq = document.getElementsByName("acceptReq");
            var denyReq = document.getElementsByName("denyReq");
            for (var i=0; i<acceptReq.length; i++) {
                if(acceptReq[i].checked || denyReq[i].checked) {
                    var user = (acceptReq[i].checked === true)?acceptReq[i].value:denyReq[i].value;
                    saveString += "&" + user + "=" + acceptReq[i].checked;
                }
            }
            
            document.getElementById("adminReqForm").action="AdminRequestServlet?"+saveString;
            document.getElementById("adminReqForm").submit();
        }
        </script>
    <body>
        <%@include file="navigator.jsp"%>
        <h3>Admin Role Requests</h3>
    <form  id="adminReqForm" method="post" >
                <div >
                    <table  align="center"  style="  width: 1000px;">
                        <tr>
                            <td width="650px" class="td1"></td>
                            <td class="td1" align="right" >                                
                                <input placeholder="Search..." type="search" id="search" name="search"  onkeypress="if(event.keyCode === 13){  doSearch(this.value);}" />
                            </td>
                        </tr>
                    </table>                   
                </div>            
            <table  id ="adminReqTable" align="center"  bordercolor="#a0c6e5" style="  width: 1000px; border-collapse: collapse;">
                <tr>
                    <th>First Name</th>
                    <th>Last Name</td>
                    <th>User Name</th>
                    <th>E-mail</th>
                    <th>Department</th>
                    <th>City</th>
                    <th>Region</th>
                    <th>Accept Request</th>
                    <th>Deny Request</th>
                </tr>
                <%
                    for(int i=0;i<list.size(); i++)   {   
                       User user1 = list.get(i);
                %>
                <tr>
                    <td><%=user1.getFirstname()%></td>
                    <td><%=user1.getLastname()%></td>
                    <td><%=user1.getUsername()%></td>
                    <td><%=user1.getEmail()%></td>
                    <td><%=user1.getDepartment()%></td>
                    <td><%=user1.getCity()%></td>
                    <td><%=user1.getRegion()%></td> 
                    <td><input type="checkbox" name="acceptReq" onclick="this.value='<%=user1.getUsername()%>'; document.getElementById('denyReq<%=i%>').checked = false;" id ="acceptReq<%=i%>" /></td>
                    <td><input type="checkbox" name="denyReq" onclick="this.value='<%=user1.getUsername()%>'; document.getElementById('acceptReq<%=i%>').checked = false;" id ="denyReq<%=i%>" /></td>
                    
                </tr>
                <%}%>
            </table>
                <div >
                    <table  align="center"  style="  width: 1000px;">
                        <tr>
                            <td width="800px" class="td1"></td>
                            <td class="td1"  align="right">
                                <button type="submit"  onclick="saveUsers();">Save</button>
                            </td>
                            
                        </tr>
                    </table>                   
                </div>
        </form>
    </body>
</html>

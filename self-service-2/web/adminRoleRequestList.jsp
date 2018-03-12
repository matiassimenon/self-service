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
            var rows=document.getElementById("adminReqTable").rows;          
            var saveString="save";
            var isSelected=false;

            for( var i=0; i< rows.length; i++){
                var accept = rows[i].cells[8].children[0];
                
                 if (accept.checked) {
                      saveString += "&"+rows[i].cells[2].innerText + "=" + accept.checked + "&";
                      isSelected=true;
                 }
                
            }
            //if(isSelected === false) return;
            document.getElementById("msg").innerHTML = saveString;
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
                    for(User user1: list)   {         
                %>
                <tr onclick="clickRow(this)">
                    <td><%=user1.getFirstname()%></td>
                    <td><%=user1.getLastname()%></td>
                    <td><%=user1.getUsername()%></td>
                    <td><%=user1.getEmail()%></td>
                    <td><%=user1.getDepartment()%></td>
                    <td><%=user1.getCity()%></td>
                    <td><%=user1.getRegion()%></td> 
                    <td><input type="checkbox" onclick="this.value='1'; document.getElementById('denyReq').checked = false; document.getElementById('denyReq').value='0'" id ="acceptReq" /></td>
                    <td><input type="checkbox" onclick="this.value='1'; document.getElementById('acceptReq').checked = false; document.getElementById('acceptReq').value='0'" id ="denyReq" /></td>
                    
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

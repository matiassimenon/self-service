<%-- 
    Document   : userHistoryList
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>

<%@page import="com.selfservice.model.User"%>
<%@page import="java.util.List"%>
<%
List<User> list  =(List<User>)request.getAttribute("userList");   
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
            document.getElementById("userForm").action="UserListServlet";
            document.getElementById("userForm").submit();
        }
        function deleteUsers(){
            var rows=document.getElementById("userTable").rows;          
            var deleteString="delete=";
            var isSelected=false;
            for( var i=0; i< rows.length; i++){
                if(rows[i].selected == 'true'){
                    deleteString += rows[i].cells[2].innerText + "&";
                    isSelected=true;
                }
            }
            if(isSelected == false) return;
            document.getElementById("userForm").action="UserListServlet?"+deleteString;
            document.getElementById("userForm").submit();
        }
        function saveUsers(){
            var rows=document.getElementById("userTable").rows;          
            var saveString="save";
            var isSelected=false;

            for( var i=0; i< rows.length; i++){
                if(rows[i].selected == 'true'){
                    //save format: username;admin, e.g: test=true
                    var childNode=rows[i].cells[8].children[0];
                    saveString += "&"+rows[i].cells[2].innerText + "=" + childNode.checked + "&";
                    isSelected=true;
                }
            }
            if(isSelected == false) return;
            document.getElementById("userForm").action="UserListServlet?"+saveString;
            document.getElementById("userForm").submit();
        }
        </script>
    </head>
    <body>
        <%@include file="navigator.jsp"%>
        <h3>Users</h3>
        <form  id="userForm" method="post" >
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
            <table  id ="userTable" align="center"  bordercolor="#a0c6e5" style="  width: 1000px; border-collapse: collapse;">
                <tr>
                    <th>First Name</th>
                    <th>Last Name</td>
                    <th>User Name</th>
                    <th>E-mail</th>
                    <th>Department</th>
                    <th>City</th>
                    <th>Passowrd</th>
                    <th>Region</th>
                    <th>Admin</th>
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
                    <td><%=user1.getPassword()%></td>
                    <td><%=user1.getRegion()%></td> 
                    <td><input type="checkbox" onclick="this.value='1'" <%if(user1.getAdmin()){%>checked="checked"<%}%> /></td>
                    
                </tr>
                <%}%>
            </table>
                <div >
                    <table  align="center"  style="  width: 1000px;">
                        <tr>
                            <td width="800px" class="td1"></td>
                             <td class="td1"  align="right">
                             <button type="submit" onclick="deleteUsers();" >Delete User</button>
                            </td>
                            <td class="td1"  align="right">
                                <button type="submit"  onclick="saveUsers();">Save</button>
                            </td>
                            
                        </tr>
                    </table>
                    
                </div>
        </form>
    </body>
</html>

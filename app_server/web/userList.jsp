<%-- 
    Document   : userHistoryList
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.selfservice.model.User"%>
<%@page import="java.util.List"%>
<%
List<User> list  =(List<User>)request.getAttribute("userList");   
%>

<%@include file="left.jsp"%>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                    var uname= rows[i].cells[2].innerText;
                    if(uname === "<%=user.getUsername()%>" ){
                        //alert("It's not allowed to delete current login user!")
                        $('#myAlert').show();
                        return;
                    }                    
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
        
 <div class="col-lg-8 py-4 d-flex flex-column align-items-left justify-content-top align-content-center">
     <%@include file="navigator.jsp"%>
     
     <div class="tablecontent" style=" min-height:  800px;">

        <div class="text-lg-center color-3">Users</div>
        <form  id="userForm" method="post" >
                
            <table  align="center"  style="  width: 1200px;">
                <tr>
                    <td width="650px" class="td1"></td>
                    <td class="td1" align="right" >                                
                        <input placeholder="Search..." type="search" id="search" name="search"  onkeypress="if(event.keyCode === 13){  doSearch(this.value);}" />
                    </td>
                </tr>
            </table>                   
                         
            <table  id ="userTable" align="center" class="table table-hover table-condensed"  bordercolor="#a0c6e5" style="  width: 1200px; border-collapse: collapse;">
                <thead>
                    <th>First Name</th>
                    <th>Last Name</td>
                    <th>User Name</th>
                    <th>E-mail</th>
                    <th>Department</th>
                    <th>City</th>
                    <th>Region</th>
                    <th>Admin</th>
                </thead>
                <tbody>
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
                    <td><input type="checkbox" onclick="this.value='1'" <%if(user1.getAdmin()){%>checked="checked"<%}%> /></td>
                    
                </tr>
                <%}%>
                </tbody>
            </table>
            <!-- pageing table-->

            <table  align="center">
                <tr><td class="td1">
               <ul  class="pagination">
                 
                    <c:if test="${currentPage != 1}">
                        <li class="page-item"><a class="page-link" href="UserListServlet?page=${currentPage - 1}">&laquo;</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                       <c:choose>
                           <c:when test="${currentPage eq i}">
                           <li class="page-item"><a class="page-link">${i}</a></li>
                           </c:when>
                           <c:otherwise>
                           <li class="page-item"><a class="page-link" href="UserListServlet?page=${i}">${i}</a></li>
                           </c:otherwise>
                       </c:choose>
                   </c:forEach>    
                    <%--For displaying Next link --%>
                    <c:if test="${currentPage lt noOfPages}">
                    <li class="page-item"><a class="page-link" href="UserListServlet?page=${currentPage + 1}">&raquo;</a></li>
                    </c:if>                               
                 </ul> 
                    </td></tr>
            </table>
          
            <table  align="center"  style="  width: 1200px;">
                <tr>
                    <td width="1000px" class="td1"></td>
                     <td class="td1"  align="right">
                     <button type="submit" class="btn btn-success" onclick="deleteUsers();" >Delete User</button>
                    </td>
                    <td class="td1"  align="right">
                        <button type="submit" class="btn btn-success" onclick="saveUsers();">Save</button>
                    </td>
                </tr>
                <tr><td class="td1">
                    <div  id="myAlert" class="alert alert-warning collapse">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <strong>Error </strong>It's not allowed to delete current login user!
                    </div>
                    </td></tr>
            </table>
             <%if (errMessage!= null ){%><h4><%=errMessage%></h4><%} %>       
        </form>
             
        </div>
        <%@include file="footer.jsp" %>
</div>
        </div></div>        
        </main>

      
    </body>

</html>
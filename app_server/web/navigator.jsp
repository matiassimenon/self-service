<%-- 
    Document   : navigator
    Created on : 2018-2-21, 16:03:58
    Author     : aiming
--%>

<%@page import="com.selfservice.model.User"%>
<%
    User user2 = (User)request.getSession(false).getAttribute("user");
%>
<style>
    .menuClass{
        background: white; color: green;
    }

.table>tbody>tr>td,
.table>tbody>tr>th {
  border-top: none;
}          
</style>
        
        <nav class="nav justify-content-center nav-tabs">
  
           
        <div class=" btn-group dropdown">
            <button type="button" class="btn nav-item  dropdown-toggle menuClass" data-toggle="dropdown" >
              User Management
            </button>

            <div class="dropdown-menu dropdown-menu-right ">
              <% if (user2.getAdmin()) {%>  
              <a class="dropdown-item menuClass" href="UserListServlet">List of user</a>
              <a class="dropdown-item menuClass" href="AdminRequestServlet">Role Management</a>
              <%}%>
              <a class="dropdown-item menuClass" href="userProfile.jsp">Update Profile</a>
            </div>
            </div>
            
            <div class="btn-group dropdown">
            <button type="button" class="btn  dropdown-toggle menuClass" data-toggle="dropdown"  >
              Instance Management
            </button>

            <div class="dropdown-menu dropdown-menu-right">
                
              <a class="dropdown-item menuClass" href="provisionForm.jsp">Request a container</a>
              <a class="dropdown-item menuClass" href="TemplateListServlet">My Templates</a>
              
              <a class="dropdown-item menuClass" href="HistoryServlet?previousRequest">My Previous Requests</a>
              <a class="dropdown-item menuClass" href="HistoryServlet?historyList">History</a>
            </div>
            </div>
            <a class="nav-link menuClass" href="Logout" >Logout</a>
        </nav>
        
<p>




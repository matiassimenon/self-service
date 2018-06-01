<%-- 
    Document   : navigator
    Created on : 2018-2-21, 16:03:58
    Author     : aiming
--%>

<%@page import="com.selfservice.model.User"%>

    
        <nav class="nav justify-content-center nav-tabs">
  
           
        <div class="btn-group dropdown">
            <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
              User Management
            </button>

            <div class="dropdown-menu dropdown-menu-right">
                
              <a class="dropdown-item" href="UserListServlet">List of user</a>
              <a class="dropdown-item" href="AdminRequestServlet">Role Management</a>
              
              <a class="dropdown-item" href="userProfile.jsp">Update Profile</a>
            </div>
            </div>
            
            <div class="btn-group dropdown">
            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
              Instance Management
            </button>

            <div class="dropdown-menu dropdown-menu-right">
                
              <a class="dropdown-item" href="provisionForm.jsp">Request a container</a>
              <a class="dropdown-item" href="TemplateListServlet">My Templates</a>
              
              <a class="dropdown-item" href="HistoryServlet?previousRequest">My Previous Requests</a>
              <a class="dropdown-item" href="HistoryServlet?historyList">History</a>
            </div>
            </div>
            <a class="nav-link" href="Logout">Logout</a>
        </nav>
        
        <p>




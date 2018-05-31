<%-- 
    Document   : userHistoryList
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
List<User> list  =(List<User>)request.getAttribute("adminReqList");   
%>
<%@include file="left.jsp"%>
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
     <div class="col-lg-8 py-4 d-flex flex-column align-items-left justify-content-top align-content-center">
     <%@include file="navigator.jsp"%>
     
     <div class="tablecontent" style=" min-height:  800px;">

        <div class="text-lg-center color-3">Admin Role Requests</div>
        
        <form  id="adminReqForm" method="post" >

                    <table  align="center"  style="  width: 1000px;">
                        <tr>
                            <td width="650px" class="td1"></td>
                            <td class="td1" align="right" >                                
                                <input placeholder="Search..." type="search" id="search" name="search"  onkeypress="if(event.keyCode === 13){  doSearch(this.value);}" />
                            </td>
                        </tr>
                    </table>                   
          
            <table  id ="adminReqTable" align="center"class="table table-hover table-condensed"   bordercolor="#a0c6e5" style="  width: 1000px; border-collapse: collapse;">
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
            <!-- pageing table-->
             <table  align="center">
                <tr><td class="td1">
               <ul  class="pagination">
                 
                    <c:if test="${currentPage != 1}">
                        <li class="page-item"><a class="page-link" href="AdminRequestServlet?page=${currentPage - 1}">&laquo;</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                       <c:choose>
                           <c:when test="${currentPage eq i}">
                           <li class="page-item"><a class="page-link">${i}</a></li>
                           </c:when>
                           <c:otherwise>
                           <li class="page-item"><a class="page-link" href="AdminRequestServlet?page=${i}">${i}</a></li>
                           </c:otherwise>
                       </c:choose>
                   </c:forEach>    
                    <%--For displaying Next link --%>
                    <c:if test="${currentPage lt noOfPages}">
                    <li class="page-item"><a class="page-link" href="AdminRequestServlet?page=${currentPage + 1}">&raquo;</a></li>
                    </c:if>                               
                 </ul> 
                    </td></tr>
            </table>

                    <table  align="center"  style="  width: 1000px;">
                        <tr>
                            <td width="800px" class="td1"></td>
                            <td class="td1"  align="right">
                                <button type="submit" class="btn btn-success" onclick="saveUsers();">Save</button>
                            </td>
                            
                        </tr>
                    </table>                   
           
        </form>
         </div>
        <%@include file="footer.jsp" %>
</div>
        </div></div>        
        </main>

        
    </body>

</html>
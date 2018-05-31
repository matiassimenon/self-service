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

<%@include file="left.jsp"%>
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
 <div class="col-lg-8 py-4 d-flex flex-column align-items-left justify-content-top align-content-center">
     <%@include file="navigator.jsp"%>
     
    

        <div class="tablecontent" style=" min-height:  800px;" >
        
        
        <%if("historyList".equals(type)){%>
        <div class="text-lg-center color-3">History</div>
        <%} else{ %>
        <div class="text-lg-center color-3">My Previous Requests</div>
        <%}%>
        
        <form  id="historyForm"  method="post" action="" >
            <input type="hidden" name="type" value="<%=type%>" />     
            <table  align="center"  >
                <tr>
                    <td width="830px" class="td1"></td>
                    <td class="td1" align="right" >                                
                        <input placeholder="Search..." type="search" id="search" name="search"  onkeypress="if(event.keyCode === 13){  doSearch(this.value);}" />
                    </td>
                </tr>
            </table>                   
                       
            <table  id="historyTable"   class="table table-hover table-condensed " align="center" style="  width: 1000px; border-collapse: collapse;">
                <thead>
                    <th>Request Date</th>
                    <th>Request Status</td>
                    <th>Image Name</th>
                    <th>Salesforce Case</th>
                    <th>Username</th>
                </thead>
                <tbody>
                <%
                    for(Request his: list){
                %>
                <tr onclick="selectRow(this)">
                    <td><%=his.getRequest_date().toString()%></td>
                    <td><%=his.getRequest_status().toString()%></td>
                    <td><%=his.getImagename()%></td>
                    <td><%=his.getSalesforce_case()%></td>
                    <td><%=his.getUsername()%></td>
                    <td class="td1" style="display:none;"><input type="hidden" value="<%=his.getTemplate_uuid()%>"/></td>
                </tr>
                <%}%>
                </tbody>
            </table>
             <!-- pageing table-->
             <table  align="center">
                <tr><td class="td1">
               <ul  class="pagination">
                 
                    <c:if test="${currentPage != 1}">
                        <li class="page-item"><a class="page-link" href="HistoryServlet?page=${currentPage - 1}">&laquo;</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                       <c:choose>
                           <c:when test="${currentPage eq i}">
                           <li class="page-item"><a class="page-link">${i}</a></li>
                           </c:when>
                           <c:otherwise>
                           <li class="page-item"><a class="page-link" href="HistoryServlet?page=${i}">${i}</a></li>
                           </c:otherwise>
                       </c:choose>
                   </c:forEach>    
                    <%--For displaying Next link --%>
                    <c:if test="${currentPage lt noOfPages}">
                    <li class="page-item"><a class="page-link" href="HistoryServlet?page=${currentPage + 1}">&raquo;</a></li>
                    </c:if>                               
                 </ul> 
                    </td></tr>
            </table>
            <table  align="center"  >
                <tr>
                    <td width="850px" class="td1"></td>
                    <td class="td1"  align="right">
                        <button type="button" id="historyBtn" class="btn btn-success" onclick="useForRequst1();" >Use for Request</button>
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
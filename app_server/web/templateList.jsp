<%-- 
    Document   : templateList.jsp
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : Aiming
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.selfservice.model.User"%>
<%@page import="com.selfservice.model.Template"%>
<%@page import="java.util.List"%>
<%
 List<Template> list  =(List<Template>)request.getAttribute("templateList");  
Object errMessage=request.getAttribute("errMessage");
%>

<%@include file="logined_left.jsp"%>
        <script>
        function doSearch(txt){
            document.getElementById("templateForm").action="TemplateListServlet";
            document.getElementById("templateForm").submit();
        }
        function deleteTemplate(){
            var rows=document.getElementById("templateTable").rows;          
            var deleteString="delete=";
            var isSelected=false;
            for( var i=0; i< rows.length; i++){
                if(rows[i].selected == 'true'){
                    deleteString += rows[i].cells[2].innerText + "&";
                    isSelected=true;
                }
            }
            if(isSelected == false) return;
            document.getElementById("templateForm").action="TemplateListServlet?"+deleteString;
            document.getElementById("templateForm").submit();
        }
        function useForRequst(){
            var rows=document.getElementById("templateTable").rows;          
            var requestString="request=";
            for( var i=0; i< rows.length; i++){
                if(rows[i].selected === 'true'){
                    requestString += rows[i].cells[2].innerText ;
                    break;
                }
            }
            document.getElementById("templateForm").action="UseForRequestServlet?"+requestString;
            document.getElementById("templateForm").submit();
        }        
        </script>
   <div class="col-lg-8 py-4 d-flex flex-column align-items-left justify-content-top align-content-center">
     <%@include file="navigator.jsp"%>
     
    

        <div class="tablecontent" style=" min-height:  800px;" >
        <div class="text-lg-center color-3">My Templates</div>
        <form  id="templateForm" method="post" action="">

                    <table  align="center"  style="  width: 800px;">
                        <tr>
                            <td width="650px" class="td1"></td>
                            <td class="td1" align="right" >                                
                                <input placeholder="Search..." type="search" id="search" name="search"  onkeypress="if(event.keyCode === 13){  doSearch(this.value);}" />
                            </td>
                        </tr>
                    </table>                   
            
            <table  id ="templateTable" class="table table-hover table-condensed" align="center" border="1" bordercolor="#a0c6e5" style="  width: 800px; border-collapse: collapse;">
                <thead>
                    <th>Last Edit</th>
                    <th>Template Name</td>
                    
                </thead>
                <tbody>
                <%
                    for(Template his: list){
                %>
                <tr onclick="clickRow(this)">
                    <td><%=his.getLast_edit().toString()%></td>
                    <td><%=his.getTemplate_name().toString()%></td>         
                    
                    <td hidden="hidden"><%=his.getTemplate_uuid()%></td>
                </tr>
                <%}%>
                </tbody>
            </table>
            <!-- pageing table-->
             <table  align="center">
                <tr><td class="td1">
               <ul  class="pagination">
                 
                    <c:if test="${currentPage != 1}">
                        <li class="page-item"><a class="page-link" href="TemplateListServlet?page=${currentPage - 1}">&laquo;</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                       <c:choose>
                           <c:when test="${currentPage eq i}">
                           <li class="page-item"><a class="page-link">${i}</a></li>
                           </c:when>
                           <c:otherwise>
                           <li class="page-item"><a class="page-link" href="TemplateListServlet?page=${i}">${i}</a></li>
                           </c:otherwise>
                       </c:choose>
                   </c:forEach>    
                    <%--For displaying Next link --%>
                    <c:if test="${currentPage lt noOfPages}">
                    <li class="page-item"><a class="page-link" href="TemplateListServlet?page=${currentPage + 1}">&raquo;</a></li>
                    </c:if>                               
                 </ul> 
                    </td></tr>
            </table>
                    <table  align="center"  style="  width: 800px;">
                        <tr>
                            <td width="500px" class="td1"></td>
                             <td class="td1"  align="right">
                             <button type="submit" class="btn btn-success" onclick="deleteTemplate()" >Delete Template</button>
                            </td>
                            <td class="td1"  align="right">
                                <button id="requestBtn" type="button" class="btn btn-success" onclick="useForRequst();" >Use for Request</button>
                            </td>
                            
                        </tr>
                    </table>
                <%if (errMessage!= null ){%><h4><%=errMessage%></h4><%} %>      
        </form>
         </div>
        <%@include file="footer.jsp" %>
</div>
        </div></div>        
        </main>

        
    </body>
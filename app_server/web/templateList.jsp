<%-- 
    Document   : templateList.jsp
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.selfservice.model.User"%>
<%@page import="com.selfservice.model.Template"%>
<%@page import="java.util.List"%>
<%
 List<Template> list  =(List<Template>)request.getAttribute("templateList");  
Object errMessage=request.getAttribute("errMessage");
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
    </head>
    <body>
        <div  id="content">
        <%@include file="navigator.jsp"%>
        <h3>My Templates</h3>
        <form  id="templateForm" method="post" action="">

                    <table  align="center"  style="  width: 800px;">
                        <tr>
                            <td width="650px" class="td1"></td>
                            <td class="td1" align="right" >                                
                                <input placeholder="Search..." type="search" id="search" name="search"  onkeypress="if(event.keyCode === 13){  doSearch(this.value);}" />
                            </td>
                        </tr>
                    </table>                   
            
            <table  id ="templateTable" align="center" border="1" bordercolor="#a0c6e5" style="  width: 800px; border-collapse: collapse;">
                <tr>
                    <th>Last Edit</th>
                    <th>Template Name</td>
                    
                </tr>
                <%
                    for(Template his: list){
                %>
                <tr onclick="clickRow(this)">
                    <td><%=his.getLast_edit().toString()%></td>
                    <td><%=his.getTemplate_name().toString()%></td>         
                    
                    <td hidden="hidden"><%=his.getTemplate_uuid()%></td>
                </tr>
                <%}%>
            </table>
            <!-- pageing table-->
             <table align="center">
                 <tr>
                    <c:if test="${currentPage != 1}">
                        <td class="td1"><a href="TemplateListServlet?page=${currentPage - 1}">Previous</a></td>
                    </c:if>
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                       <c:choose>
                           <c:when test="${currentPage eq i}">
                               <td class="td1">${i}</td>
                           </c:when>
                           <c:otherwise>
                               <td class="td1"><a href="TemplateListServlet?page=${i}">${i}</a></td>
                           </c:otherwise>
                       </c:choose>
                   </c:forEach>    
                    <%--For displaying Next link --%>
                    <c:if test="${currentPage lt noOfPages}">
                        <td class="td1"><a href="TemplateListServlet?page=${currentPage + 1}">Next</a></td>
                    </c:if>                               
                 </tr>
             </table>
                    <table  align="center"  style="  width: 800px;">
                        <tr>
                            <td width="500px" class="td1"></td>
                             <td class="td1"  align="right">
                             <button type="submit" onclick="deleteTemplate()" >Delete Template</button>
                            </td>
                            <td class="td1"  align="right">
                                <button id="requestBtn" type="button" onclick="useForRequst();" >Use for Request</button>
                            </td>
                            
                        </tr>
                    </table>
                <%if (errMessage!= null ){%><h3><%=errMessage%></h3><%} %>      
        </form>
  </div>                    
    </body>
    <%@include file="footer.jsp"%>
</html>

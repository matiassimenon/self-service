<%-- 
    Document   : userHistoryList
    Created on : Jan 19, 2018, 11:54:19 AM
    Author     : francisco
--%>

<%@page import="com.selfservice.model.User"%>
<%@page import="com.selfservice.model.Template"%>
<%@page import="java.util.List"%>
<%
 List<Template> list  =(List<Template>)request.getAttribute("templateList");  
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
                    deleteString += rows[i].cells[3].innerText + "&";
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
                if(rows[i].selected == 'true'){
                    requestString += rows[i].cells[1].innerText + "&";
                }
            }
            document.getElementById("templateForm").action="UseForRequestServlet?"+requestString;
            document.getElementById("templateForm").submit();
        }
        </script>
    </head>
    <body>
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
                    <th>Salesforce Case</th>
                </tr>
                <%
                    for(Template his: list){
                %>
                <tr onclick="clickRow(this)">
                    <td><%=his.getLast_edit().toString()%></td>
                    <td><%=his.getTemplate_name().toString()%></td>         
                    <td><%=his.getSalesforce_case()%></td>
                    <td hidden="hidden"><%=his.getTemplate_uuid()%></td>
                </tr>
                <%}%>
            </table>

                    <table  align="center"  style="  width: 800px;">
                        <tr>
                            <td width="500px" class="td1"></td>
                             <td class="td1"  align="right">
                             <button type="submit" onclick="deleteTemplate()" >Delete Template</button>
                            </td>
                            <td class="td1"  align="right">
                                <button type="submit" >Use for Request</button>
                            </td>
                            
                        </tr>
                    </table>
                    
        </form>
    </body>
</html>

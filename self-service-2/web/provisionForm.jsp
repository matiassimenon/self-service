<%-- 
    Document   : provisionForm
    Created on : Jan 19, 2018, 11:56:16 AM
    Author     : francisco
--%>

<%@page import="com.selfservice.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Self service</title>
        <link rel="stylesheet"  type="text/css"  href="selfservice.css"/>
        <style>             
            input,select{
                width: 255px;
                color:#003366;
		background-color:#fff;
            }
        </style>
       
        <script src="select.js"> </script>
<script >

//define the os version data array
var osArr = [];
osArr['ubuntu'] =
[
 {txt:'14.04', val:'14.04'},
 {txt:'16.04', val:'16.04'},
 {txt:'17.04', val:'17.04'}
 ];
osArr['centos'] =
[
 {txt:'7.3', val:'7.3'},
 {txt:'7.4', val:'7.4'}
 ];
function setOsVersion(osVersion)
{
    setSelectOption('osVersion', osArr[osVersion], 'Please select...');
}
function generateImageName(){
    var imagename=document.getElementById("os").value + document.getElementById("osVersion").value.toString().replace("\.","")+ "-"+            
            document.getElementById("talendComponent").value+ document.getElementById("componentVersion").value.toString().replace("\.","").replace("\.","") + "-" +
            "jdk" + document.getElementById("jdk").value + "u" + document.getElementById("jdkUpdate").value + "-"+
            "tomcat" + document.getElementById("tomcatVersion").value.toString().replace("\.","");
    //window.alert(imagename);
    document.getElementById("imageName").value=imagename;
}
function saveAsTemplate(){
    document.getElementById("templateForm").action="SaveAsTemplate";
    document.getElementById("templateForm").submit();
}
function requestAction(){
    document.getElementById("templateForm").action="RequestServlet";
    document.getElementById("templateForm").submit();
}
</script>
    </head>
    <body>
        <%@include file="navigator.jsp"%>
        <h3>Provision Form</h3>
        <form  id="templateForm" method="post" action="SaveAsTemplate">
            <table  align="center" style="border:2px solid green; padding:15px 15px;">
                <tr>
                    <td >OS:</td> 
                    <td> <select id="os" name="os" required="required" onchange="if(this.value != '') setOsVersion(this.options[this.selectedIndex].value);"> 
                             <option value="">Please select...</option>
                            <option value="ubuntu">Ubuntu</option>
                            <option value="centos">CentOS</option>
                        </select> 
                    </td>
                    <td>Salesforce case: </td> <td>  <input type="text" id="salesforceCase" name="salesforceCase" maxlength="10" required="required" ></input> </td>
                </tr>                
                <tr>
                    <td>OS Version: </td>
                    <td><select id="osVersion" required="required" name="osVersion" onchange="generateImageName();">
                             <option value="">Please select...</option>
                             <!--
                            <option value="14.04">14.04</option>
                            <option value="16.04">16.04</option>
                            <option value="17.04">17.04</option>
                            <option value="7.3">7.3</option>
                            <option value="7.4">7.4</option>
                             -->
                        </select> 
                    </td>
                    <td>Registry: </td> 
                    <td> <select id="registry" name="registry">
                            <option value="apac">APAC</option>
                            <option value="emea">EMEA</option>
                            <option value="us">US</option>
                        </select> </td>
                </tr>
                <tr>
                    <td>Talend Component :</td>
                    <td> <select id="talendComponent" name="talendComponent" onchange="generateImageName();"> 
                            <option value="tac">TAC</option>
                            <option value="cmdline">CmdLine</option>
                            <option value="jobserver">Jobserver</option>
                        </select> 
                    </td>
                    <td>Image Name:  </td><td><input type="text" id="imageName" name="imageName"></input> </td>
                </tr>
                <tr><td>Talend Version :</td>
                    <td> <select id="componentVersion" name="componentVersion" onchange="generateImageName();"> 
                            <option value="6.1.1">6.1.1</option>
                            <option value="6.2.1">6.2.1</option>
                            <option value="6.3.1">6.3.1</option>
                            <option value="6.4.1">6.4.1</option>
                            <option value="6.5.1">6.5.1</option>
                        </select> 
                    </td>
                </tr>
                <tr><td>JDK Version : </td>
                    <td><select id="jdk" name="jdk" onchange="generateImageName();"> 
                            <option value="7">7</option>
                            <option value="8">8</option>
                        </select> 
                    </td>
                </tr>
                <tr><td>JDK Update : </td>
                    <td><select id="jdkUpdate" name="jdkUpdate" onchange="generateImageName();"> 
                            <option value="122">122</option>
                            <option value="144">144</option>
                            <option value="161">161</option>                                                      
                        </select> 
                    </td>
                </tr>
                <tr><td>Tomcat Version : </td>
                    <td><select id="tomcatVersion" name="tomcatVersion"  onchange="generateImageName();"> 
                            <option value="8.2">8.2</option>
                            <option value="8.5">8.5</option>
                        </select> 
                    </td>
                    
                </tr>
                <tr><td></td><td></td> <td></td>
                    <td><button type="submit" onclick="saveAsTemplate()">Save as Template</button> 
                        <button type="submit" onclick="requestAction()">Request</button></td></tr>
                
                
            </table>
            
        </form>
    </body>
</html>

<%-- 
    Document   : provisionForm
    Created on : Jan 19, 2018, 11:56:16 AM
    Author     : francisco
--%>
<%@page import="com.selfservice.model.Template"%>
<%
    Object errMessage=request.getAttribute("errMessage");
    Object fromTemplate=request.getAttribute("fromTemplate");
    Template template=(Template)request.getAttribute("template");
    if(template == null ){
        template= new Template();
    }
%>
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
       
        <script src="selfservice.js"> </script>
        <script>
            window.onload=function(){
                var os="<%=template.getOs()%>";
                var osVersion="<%=template.getOs_version()%>";
                var componentVersion="<%=template.getTalend_version()%>";
                var talendComponent="<%=template.getTalend_component()%>";
                
                var jdk="<%=template.getJdk_version()%>";
                var jdkUpdate="<%=template.getJdk_update()%>";
                var tomcatVersion="<%=template.getTomcat_version()%>";

                document.getElementById("imageName").value="<%=template.getTemplate_name()%>";               
                setSelected(document.getElementById("os"), os);
                setSelected(document.getElementById("componentVersion"), componentVersion);
                
                
                setSelected(document.getElementById("talendComponent"), talendComponent);
                setSelected(document.getElementById("jdk"), jdk);
                setSelected(document.getElementById("jdkUpdate"), jdkUpdate);
                
                checkTomcat();
                checkOsVersion();
                setSelected(document.getElementById("osVersion"), osVersion);
                setSelected(document.getElementById("tomcatVersion"), tomcatVersion);
                var fromtemplate= "<%=fromTemplate%>";
                var disable = (fromtemplate === "true");
                if(disable){
                    document.getElementById("os").disabled=true;
                    document.getElementById("componentVersion").disabled=true;
                    document.getElementById("talendComponent").disabled=true;
                    document.getElementById("jdk").disabled=true;
                    document.getElementById("jdkUpdate").disabled=true;
                    document.getElementById("osVersion").disabled=true;
                    document.getElementById("tomcatVersion").disabled=true;                                
                    document.getElementById("imageName").disabled=true;                                
                    document.getElementById("saveTemplateBtn").disabled=true;  
                }
                
            };
         function enableInput(){
                    
                    document.getElementById("os").disabled=false;
                    document.getElementById("componentVersion").disabled=false;
                    document.getElementById("talendComponent").disabled=false;
                    document.getElementById("jdk").disabled=false;
                    document.getElementById("jdkUpdate").disabled=false;
                    document.getElementById("osVersion").disabled=false;
                    document.getElementById("tomcatVersion").disabled=false;                                
                    document.getElementById("imageName").disabled=false;                                
                    //document.getElementById("saveTemplateBtn").disabled=false;                         
         }
        </script>
<script >

//define the os version data array
var osArr = [];
osArr['ubuntu'] =
[
 {txt:'12.04', val:'12.04'},
 {txt:'14.04', val:'14.04'},
 {txt:'16.04', val:'16.04'},
 {txt:'17.10', val:'17.10'}
 ];
osArr['centos'] =
[
{txt:'6.7', val:'6.7'},
{txt:'6.8', val:'6.8'},
{txt:'6.9', val:'6.9'},
{txt:'7.1', val:'7.1'},
 {txt:'7.2', val:'7.2'},
 {txt:'7.3', val:'7.3'}
 ];
function setOsVersion(osVersion)
{
    if(this.value !== '') 
        setSelectOption('osVersion', osArr[osVersion.options[osVersion.selectedIndex].value], 'Please select...');
}
function checkTomcat(){
    var versions=[{txt:'7.0', val: '7.0'},{txt:'8.0', val: '8.0'}];
    var ver=[{txt:'8.0', val: '8.0'}];
    var tomcatVersion=document.getElementById("tomcatVersion");
    var componentVersion=document.getElementById("componentVersion");
    if(document.getElementById("talendComponent").value ===  "tac"){
        tomcatVersion.removeAttribute("disabled");
        tomcatVersion.style="background-color:white";
        if(componentVersion.value === "6.5.1" || componentVersion.value === '7.0.1')
            setSelectOption('tomcatVersion',ver);
        else
            setSelectOption('tomcatVersion',versions);
    }else{
        tomcatVersion.disabled="disabled";
    }
}
function checkOsVersion(){
    var os =document.getElementById("os");
    var componentVersion=document.getElementById("componentVersion");
    if(componentVersion.value === '6.0.1'){
        if(os.value === 'ubuntu') setSelectOption('osVersion',[{txt:'12.04', val:'12.04'},{txt:'14.04', val:'14.04'}]);
        if(os.value === 'centos') setSelectOption('osVersion',[{txt:'6.6', val:'6.6'},{txt:'7.1', val:'7.1'}]);
    }
    if(componentVersion.value === '6.1.1'){
        if(os.value === 'ubuntu') setSelectOption('osVersion',[{txt:'12.04', val:'12.04'},{txt:'16.04', val:'16.04'},{txt:'17.10', val:'17.10'}]);
        if(os.value === 'centos') setSelectOption('osVersion',[{txt:'6.6', val:'6.6'},{txt:'7.1', val:'7.1'}]);
    }    
    if(componentVersion.value === '6.2.1'){
        if(os.value === 'ubuntu') setSelectOption('osVersion',[{txt:'12.04', val:'12.04'},{txt:'14.04', val:'14.04'},{txt:'16.04', val:'16.04'}]);
        if(os.value === 'centos') setSelectOption('osVersion',[{txt:'6.7', val:'6.7'},{txt:'6.8', val:'6.8'},{txt:'7.2', val:'7.2'},{txt:'7.3', val:'7.3'}]);
    }     
    if(componentVersion.value === '6.3.1'){
        if(os.value === 'ubuntu') setSelectOption('osVersion',[{txt:'12.04', val:'12.04'},{txt:'14.04', val:'14.04'},{txt:'16.04', val:'16.04'}]);
        if(os.value === 'centos') setSelectOption('osVersion',[{txt:'6.7', val:'6.7'},{txt:'6.8', val:'6.8'},{txt:'7.1', val:'7.1'},{txt:'7.2', val:'7.2'},{txt:'7.3', val:'7.3'}]);
    }  
    if(componentVersion.value === '6.4.1'){
        if(os.value === 'ubuntu') setSelectOption('osVersion',[{txt:'14.04', val:'14.04'},{txt:'16.04', val:'16.04'},{txt:'17.10', val:'17.10'}]);
        if(os.value === 'centos') setSelectOption('osVersion',[{txt:'6.8', val:'6.8'},{txt:'6.9', val:'6.9'},{txt:'7.1', val:'7.1'},{txt:'7.2', val:'7.2'},{txt:'7.3', val:'7.3'}]);
    }     
    if(componentVersion.value === '6.5.1' || componentVersion.value === '7.0.1'){
        if(os.value === 'ubuntu') setSelectOption('osVersion',[{txt:'12.04', val:'12.04'},{txt:'14.04', val:'14.04'},{txt:'16.04', val:'16.04'},{txt:'17.10', val:'17.10'}]);
        if(os.value === 'centos') setSelectOption('osVersion',[{txt:'6.7', val:'6.7'},{txt:'6.8', val:'6.8'},{txt:'6.9', val:'6.9'},{txt:'7.1', val:'7.1'},{txt:'7.2', val:'7.2'},{txt:'7.3', val:'7.3'}]);
    }      
}
function generateImageName(){
    var imagename=document.getElementById("talendComponent").value+ document.getElementById("componentVersion").value.toString().replace("\.","").replace("\.","") + "-"+
            document.getElementById("os").value + document.getElementById("osVersion").value.toString().replace("\.","").substring(0,2)+ "-"+           
              "jdk" + document.getElementById("jdk").value + "u" + document.getElementById("jdkUpdate").value ;
    if (!document.getElementById("tomcatVersion").disabled){
            imagename += "-tomcat" + document.getElementById("tomcatVersion").value.toString().replace("\.","");
        }
    //window.alert(imagename);
    document.getElementById("imageName").value=imagename;
}
function saveAsTemplate(){
    document.getElementById("salesforceCase").removeAttribute("required");
    document.getElementById("templateForm").action="SaveAsTemplate?fromTemplate="+"<%=fromTemplate%>";
    //document.getElementById("templateForm").submit();
}
function requestAction(){

    document.getElementById("salesforceCase").required="required";
    document.getElementById("templateForm").action="RequestServlet";    
    if(document.getElementById("salesforceCase") !== ""){
        enableInput();
    }
    //document.getElementById("templateForm").submit();
}
</script>
    </head>
    <body>
        <div  id="content">
        <%@include file="navigator.jsp"%>
        <h3>Provision Form</h3>
        <form  id="templateForm" method="post" action="">
            <table  align="center" style="border:2px solid green; padding:15px 15px;">
                <tr>
                    <td>Talend Component :</td>
                    <td> <select id="talendComponent" name="talendComponent" onchange="checkTomcat();  generateImageName();"> 
                            <option value="tac">TAC</option>
                            <option value="cmdline">CmdLine</option>
                            <option value="jobserver">Jobserver</option>
                        </select> 
                    </td>                    
                    <td>Salesforce case: </td> <td>  <input type="text" id="salesforceCase" name="salesforceCase"  maxlength="10" value="<%=template.getSalesforce_case()%>" ></input> </td>
                </tr>                
                <tr>
                    <td>Talend Version :</td>
                    <td> <select id="componentVersion" required="required" name="componentVersion" onchange="checkTomcat(); checkOsVersion(); generateImageName();"> 
                            <option value="">Please select...</option>
                            <option value="6.0.1">6.0.1</option>
                            <option value="6.1.1">6.1.1</option>
                            <option value="6.2.1">6.2.1</option>
                            <option value="6.3.1">6.3.1</option>
                            <option value="6.4.1">6.4.1</option>
                            <option value="6.5.1">6.5.1</option>
                           
                        </select> 
                    </td>      
                    <td>Image Name:  </td><td><input type="text" id="imageName" name="imageName"></input> </td>
                </tr>
                <tr>
                    <td >OS:</td> 
                    <td> <select id="os" name="os" required="required" onchange="setOsVersion(this);"> 
                             <option value="">Please select...</option>
                            <option value="ubuntu">Ubuntu</option>
                            <option value="centos">CentOS</option>
                        </select> 
                    </td>
                    
                </tr>
                <tr>
                    <td>OS Version: </td>
                    <td><select id="osVersion" required="required" name="osVersion" onchange=" generateImageName();">
                             <option value="">Please select...</option>
                        </select> 
                    </td>
                </tr>
                <tr><td>JDK Version : </td>
                    <td><select id="jdk" name="jdk" onchange="generateImageName();"> 
                            <option value="8">8</option>
                        </select> 
                    </td>
                </tr>
                <tr><td>JDK Update : </td>
                    <td><select id="jdkUpdate" name="jdkUpdate" onchange="generateImageName();">       
                            <option value="141">141</option>
                            <option value="144">144</option>
                            <option value="151">151</option>
                            <option value="152">152</option>
                            <option value="162">162</option>                                                      
                        </select> 
                    </td>
                </tr>
                <tr><td>Tomcat Version : </td>
                    <td><select id="tomcatVersion" name="tomcatVersion"  onchange="generateImageName();"> 
                            <option value="7.0">7.0</option>
                            <option value="8.0">8.0</option>
                        </select> 
                    </td>
                    
                </tr>
                <tr><td></td><td></td> <td></td>
                    <td><button type="submit" id="saveTemplateBtn" onclick="saveAsTemplate()">Save as Template</button> 
                        <button type="submit" onclick="requestAction()">Request</button></td></tr>
                
                
            </table>
            <input type="hidden" name="template_uuid" value="<%=template.getTemplate_uuid()%>"/>
        </form>
        <%if (errMessage!= null ){%><h3><%=errMessage%></h3><%}%>
        </div>
    </body>
    <%@include file="footer.jsp"%>
</html>

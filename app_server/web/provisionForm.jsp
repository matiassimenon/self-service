<%-- 
    Document   : provisionForm
    Created on : Jan 19, 2018, 11:56:16 AM
    Author     : aiming
--%>
<%@page import="com.selfservice.model.Template"%>
<%
    Object fromTemplate=request.getAttribute("fromTemplate");
    Template template=(Template)request.getAttribute("template");
    if(template == null ){
        template= new Template();
        template.setTalend_component("");
    }
%>
<%@include file="left.jsp"%>
<style>             
            input,select{
                width: 270px;
                color:#003366;
		background-color:#fff;
            }
            td{
                border: solid 0px #a0c6e5; height: 20px;               
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
                var db ="<%=template.getDatabase()%>";
                var db_version="<%=template.getDatabase_version()%>";
                if(talendComponent === "null")
                {// database tab
                    document.getElementById("imageName_db").value="<%=template.getTemplate_name()%>";  
                    setSelected(document.getElementById("os_db"), os);
                    setSelectOption('osVersion_db', osArr[os], 'Please select...');
                    setSelected(document.getElementById("osVersion_db"), osVersion);
                    setSelected(document.getElementById("database_db"), db);
                    setSelectOption('database_version_db', dbArr[db], 'Please select...');
                    setSelected(document.getElementById("database_version_db"), db_version);
                    displayDatabase();
                }else{//talend tab               
                    //document.getElementById("talend_a").focus();
                    if(talendComponent != ""){
                        document.getElementById("imageName").value="<%=template.getTemplate_name()%>";               
                        setSelected(document.getElementById("os"), os);
                        setSelected(document.getElementById("componentVersion"), componentVersion);

                        setSelected(document.getElementById("talendComponent"), talendComponent);
                        setSelected(document.getElementById("jdk"), jdk);
                        setSelected(document.getElementById("jdkUpdate"), jdkUpdate);
                        checkTomcat();
                        checkOsVersion();
                        setSelected(document.getElementById("tomcatVersion"), tomcatVersion);
                        setSelected(document.getElementById("osVersion"), osVersion);
                    }
                    displayTalend();
                }
             
                var fromtemplate= "<%=fromTemplate%>";
                var disable = (fromtemplate === "true");
                if(disable){
                   disableForm(true);   
                }               
            };
         function enableInput(){
             disableForm(false);
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
 {txt:'16', val:'16'},
 {txt:'17.10', val:'17.10'}
 ];
osArr['centos'] =
[
{txt:'6.7', val:'6.7'},
{txt:'6.8', val:'6.8'},
{txt:'6.9', val:'6.9'},
{txt:'7', val:'7'},
{txt:'7.1', val:'7.1'},
 {txt:'7.2', val:'7.2'},
 {txt:'7.3', val:'7.3'}
 ];
 osArr['debian'] =
[
 {txt:'8-slim', val:'8-slim'},
 {txt:'9-slim', val:'9-slim'}
 ];
 osArr['oraclelinux'] =[{txt:'7-slim', val:'7-slim'}];
 
 //define the database version data array
var dbArr=[];
dbArr['mysql'] =
[
 {txt:'5.5', val:'5.5'},
 {txt:'5.6', val:'5.6'},
 {txt:'5.7', val:'5.7'},
 {txt:'8.0', val:'8.0'}
 ];
 dbArr['postgres'] =
[
 {txt:'9.3', val:'9.3'},
 {txt:'9.4', val:'9.4'},
 {txt:'9.5', val:'9.5'},
 {txt:'9.6', val:'9.6'},
 {txt:'10', val:'10'},
 {txt:'11', val:'11'}
 ];

  dbArr['mariadb'] =
[
 {txt:'5.5', val:'5.5'},
 {txt:'10.0', val:'10.0'},
 {txt:'10.1', val:'10.1'},
 {txt:'10.2', val:'10.2'},
 {txt:'10.3', val:'10.3'}
 ];
   dbArr['mssql'] =
[
 {txt:'2017', val:'2017'}
 ];
   dbArr['oracle'] =
[
 {txt:'11.2', val:'11.2'},
 {txt:'12.1', val:'12.1'},
 {txt:'12.2', val:'12.2'}
 ];
  dbArr['ibmdb2expressc'] =
[
 {txt:'10.5', val:'10.5'}
 ];
 dbArr['cassandra'] =
[
 {txt:'2.1', val:'2.1'},
 {txt:'2.2', val:'2.2'},
 {txt:'3.0', val:'3.0'},
 {txt:'3.11', val:'3.11'}
 ];
 dbArr['elasticsearch'] =
 [
     {txt:'5.2', val:'5.2'}, {txt:'5.3', val:'5.3'}, {txt:'5.4', val:'5.4'},{txt:'5.5', val:'5.5'},{txt:'5.6', val:'5.6'},
     {txt:'6.0', val:'6.0'},{txt:'6.1', val:'6.1'},{txt:'6.2', val:'6.2'},{txt:'6.3', val:'6.3'}
 ];
 dbArr['mongo'] =
 [
     {txt:'3.2', val:'3.2'},{txt:'3.4', val:'3.4'},{txt:'3.6', val:'3.6'},{txt:'3.7', val:'3.7'},{txt:'4.0-rc', val:'4.0-rc'}
 ];
function setOsVersion(osVersion)
{
        setSelectOption('osVersion', osArr[osVersion.options[osVersion.selectedIndex].value], 'Please select...');
}
function setOsVersion_db(osVersion) //in database table
{    
        setSelectOption('osVersion_db', osArr[osVersion.options[osVersion.selectedIndex].value], 'Please select...');
}

function setDbVersion_db(db){
        setSelectOption('database_version_db', dbArr[db.options[db.selectedIndex].value], 'Please select...');
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
        tomcatVersion.readonly=true;
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
function checkDBVersion(){
    var db=document.getElementById("database_db");
    var db_version=document.getElementById("database_version_db");
    var osVersion_db=document.getElementById("osVersion_db");
    if(db.value === 'cassandra'){
        setSelectOption('os_db',[{txt:'Debian', val:'debian'}]);
        setSelectOption('osVersion_db',[{txt:'8-slim', val:'8-slim'}, {txt:'9-slim', val:'9-slim'}]);       
    }
    if(db.value === 'elasticsearch'){
        setSelectOption('os_db',[{txt:'Centos', val:'centos'}]);
        setSelectOption('osVersion_db',[{txt:'7', val:'7'}]);     
        setSelectOption('database_version_db',[{txt:'5.2', val:'5.2'},{txt:'5.3', val:'5.3'},{txt:'5.4', val:'5.4'},{txt:'5.5', val:'5.5'},{txt:'5.6', val:'5.6'},{txt:'6.0', val:'6.0'},{txt:'6.1', val:'6.1'},{txt:'6.2', val:'6.2'},{txt:'6.3', val:'6.3'}]);
    }
    if(db.value === 'ibmdb2expressc'){
        setSelectOption('os_db',[{txt:'Centos', val:'centos'}]);
        setSelectOption('osVersion_db',[{txt:'7', val:'7'}]);    
        setSelectOption('database_version_db',[{txt:'10.5', val:'10.5'}]);
    }
    if(db.value === 'mariadb'){
        setSelectOption('os_db',[{txt:'Debian', val:'debian'}]);
        setSelectOption('osVersion_db',[{txt:'7', val:'7'},{txt:'8', val:'8'}]);    
    }
    if(db.value === 'mongo'){
        setSelectOption('os_db',[{txt:'Debian', val:'debian'},{txt:'Ubuntu', val:'ubuntu'}]);
    }
    if(db.value === 'mssql'){
        setSelectOption('os_db',[{txt:'Centos', val:'centos'}]);
        setSelectOption('osVersion_db',[{txt:'7', val:'7'}]);    
        setSelectOption('database_version_db',[{txt:'2017', val:'2017'}]);
    }
    if(db.value === 'mysql'){
        setSelectOption('os_db',[{txt:'Debian', val:'debian'}]);
        setSelectOption('osVersion_db',[{txt:'9-slim', val:'9-slim'}]);    
        setSelectOption('database_version_db',[{txt:'5.5', val:'5.5'},{txt:'5.6', val:'5.6'},{txt:'5.7', val:'5.7'},{txt:'8.0', val:'8.0'}]);
    }
    if(db.value === 'oracle'){
        setSelectOption('os_db',[{txt:'Oracle linux', val:'oraclelinux'}]);
        setSelectOption('osVersion_db',[{txt:'7-slim', val:'7-slim'}]);    
        setSelectOption('database_version_db',[{txt:'11.2', val:'11.2'},{txt:'12.1', val:'12.1'},{txt:'12.2', val:'12.2'}]);
    }
    if(db.value === 'postgres'){
        setSelectOption('os_db',[{txt:'Debian', val:'Debian'}]);
        setSelectOption('osVersion_db',[{txt:'9-slim', val:'9-slim'}]);    
        setSelectOption('database_version_db',[{txt:'9.3', val:'9.3'},{txt:'9.4', val:'9.4'},{txt:'9.5', val:'9.5'},{txt:'9.6', val:'9.6'},{txt:'10', val:'10'},{txt:'11', val:'11'}]);
    }
}
function resetOSVersion_db(){
    var db=document.getElementById("database_db");
    var os_db=document.getElementById("os_db");
    if(db.value === 'mongo'){
        if(os_db.value === 'debian')setSelectOption('osVersion_db',[{txt:'9-slim', val:'9-slim'}], 'Please select...');   
        if(os_db.value === 'ubuntu')setSelectOption('osVersion_db',[{txt:'16', val:'16'}], 'Please select ...'); 
    }
}
function resetDBVersion(){
    var db=document.getElementById("database_db");
    var osVersion_db=document.getElementById("osVersion_db");
    if(db.value === 'cassandra'){      
        if(osVersion_db.value === '8-slim'){
            setSelectOption('database_version_db',[{txt:'2.1', val:'2.1'},{txt:'2.2', val:'2.2'}],'Please select..');
        }
        if(osVersion_db.value === '9-slim'){
            setSelectOption('database_version_db',[{txt:'3.0', val:'3.0'},{txt:'3.11', val:'3.11'}],'Please select..');
        }
    }
    if(db.value === 'mariadb'){
        if(osVersion_db.value === '7'){
            setSelectOption('database_version_db',[{txt:'5.5', val:'5.5'}]);
        }
        if(osVersion_db.value === '8'){
            setSelectOption('database_version_db',[{txt:'10.0', val:'10.0'},{txt:'10.1', val:'10.1'},{txt:'10.2', val:'10.2'},{txt:'10.3', val:'10.3'}],'Please select..');
        }        
    }
    if(db.value === 'mongo'){
        if(osVersion_db.value === '9-slim'){
            setSelectOption('database_version_db',[{txt:'3.2', val:'3.2'},{txt:'3.4', val:'3.4'},{txt:'3.6', val:'3.6'}], 'Please select ...');
        }
        if(osVersion_db.value === '16'){
            setSelectOption('database_version_db',[{txt:'3.7', val:'3.7'},{txt:'4.0-rc', val:'4.0-rc'}], 'Please select ...');
        }
    }
    
}
function generateImageName(){
    var imagename=document.getElementById("talendComponent").value+ document.getElementById("componentVersion").value.toString() + "-"+
            document.getElementById("os").value + document.getElementById("osVersion").value.toString()+ "-"+           
              "jdk" + document.getElementById("jdk").value + "u" + document.getElementById("jdkUpdate").value ;
    if (!document.getElementById("tomcatVersion").disabled){
            imagename += "-tomcat" + document.getElementById("tomcatVersion").value.toString();
        }
    if(document.getElementById("salesforceCase").value.length>0) imagename += "-"+ document.getElementById("salesforceCase").value;   
        
    //window.alert(imagename);
    document.getElementById("imageName").value=imagename;
}
function generateImageName_db(){
    var imagename=
            document.getElementById("os_db").value + document.getElementById("osVersion_db").value.toString().replace('-','.')+ "-"+  
            document.getElementById("database_db").value +document.getElementById("database_version_db").value.toString().replace('-','.');
    if(document.getElementById("salesforceCase_db").value.length>0) imagename += "-"+ document.getElementById("salesforceCase_db").value;   
    document.getElementById("imageName_db").value=imagename;
}

function saveAsTemplate(){
    document.getElementById("salesforceCase").removeAttribute("required");
    document.getElementById("templateForm").action="SaveAsTemplate?fromTemplate="+"<%=fromTemplate%>";
    //document.getElementById("templateForm").submit();
}
function saveAsTemplate_db(){
    document.getElementById("salesforceCase_db").removeAttribute("required");
    document.getElementById("templateForm_db").action="SaveAsTemplate?fromTemplate="+"<%=fromTemplate%>";
    //document.getElementById("templateForm").submit();
}
function requestAction(){
    document.getElementById("salesforceCase").required="required";
    document.getElementById("templateForm").action="RequestServlet";    
}
function requestAction_db(){
    document.getElementById("salesforceCase_db").required="required";
    document.getElementById("templateForm_db").action="RequestServlet";    

}
function displayDatabase(){
    
    $('#database_a').toggleClass('active');
    $('#talend_a').removeClass('active');
    document.getElementById('templateForm_db').style.display='block';
    document.getElementById('templateForm').style.display='none'; //hide talend
}
function displayTalend(){
    
   $('#talend_a').toggleClass('active');
   $('#database_a').removeClass('active');
    document.getElementById('templateForm').style.display='block';
    document.getElementById('templateForm_db').style.display='none'; //hide talend
}
function displayHadoop(){
    alert("TODO: Please waiting ....");
}
</script>
   
<div class="col-lg-8 py-4 d-flex flex-column align-items-left justify-content-top align-content-center">
     <%@include file="navigator.jsp"%>

        <div class="tablecontent" style=" min-height:  800px;" >
        <div class="text-lg-center color-3">Request Container</div>
        <p>
        <div id="formBody" style="display: flex; flex-direction: row; align-items: flex-start;  justify-content: center;">
<div class="list-group" id="myList" role="tablist">
  <a class="list-group-item list-group-item-action" id="talend_a"  onclick="displayTalend(); " data-toggle="list" href="#" role="tab">Talend Components</a>
  <a class="list-group-item list-group-item-action" id ="database_a"  onclick="displayDatabase(); " data-toggle="list" href="#" role="tab">Databases</a>

</div>
            
        <form  id="templateForm"  style="display: none;" method="post" action="">
            <table  id="talend_table"  cellpadding="5px" align="center" style="border:1px solid green;">
                <tr>
                    <td class="td1">Talend Component:</td>
                    <td> <select id="talendComponent" name="talendComponent" onchange="checkTomcat();  generateImageName();"> 
                            <option value="tac">TAC</option>
                            <option value="cmdline">CommandLine</option>
                            <option value="jobserver">JobServer</option>
                        </select> 
                    </td>    
                    <td class="td1">Talend Version:</td>
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
                </tr>                
                <tr>
                    <td class="td1" >OS:</td> 
                    <td> <select id="os" name="os" required="required" onchange="setOsVersion(this); generateImageName();"> 
                             <option value="">Please select...</option>
                            <option value="ubuntu">Ubuntu</option>
                            <option value="centos">CentOS</option>
                        </select> 
                    </td>
                    <td class="td1">Salesforce Case:</td> <td>  <input type="text" id="salesforceCase" name="salesforceCase"  maxlength="10" value="<%=template.getSalesforce_case()%>" onchange=" generateImageName();" ></input> </td>
                </tr>
                <tr>
                    <td class="td1">OS Version:</td>
                    <td><select id="osVersion" required="required" name="osVersion" onchange=" generateImageName();">
                             <option value="">Please select...</option>
                        </select> 
                    </td>
                    <td class="td1">Image Name:</td><td><input type="text" id="imageName"  name="imageName" ></input> </td>
                </tr>
                <tr><td class="td1">JDK Version:</td>
                    <td><select id="jdk" name="jdk" onchange="generateImageName();"> 
                            <option value="8">8</option>
                        </select> 
                    </td>
                </tr>
                <tr><td class="td1">JDK Update:</td>
                    <td><select id="jdkUpdate" name="jdkUpdate" onchange="generateImageName();">       
                            <option value="141">141</option>
                            <option value="144">144</option>
                            <option value="151">151</option>
                            <option value="152">152</option>
                            <option value="162">162</option>                                                      
                        </select> 
                    </td>
                </tr>
                <tr><td class="td1">Tomcat Version:</td>
                    <td><select id="tomcatVersion" name="tomcatVersion"  onchange="generateImageName();"> 
                            <option value="7.0">7.0</option>
                            <option value="8.0">8.0</option>
                        </select> 
                    </td>                    
                </tr>
                <tr><td></td><td></td> <td></td>
                    <td><button type="submit" id="saveTemplateBtn" class="btn btn-success" onclick="saveAsTemplate()">Save as Template</button> 
                        <button type="submit" class="btn btn-success" onclick="requestAction()">Request</button></td></tr>
            </table>                
            <input type="hidden" name="template_uuid" value="<%=template.getTemplate_uuid()%>"/>
            <%if (errMessage!= null ){%><div><%=errMessage%></div><%}%>
        </form>

        
        <form  id="templateForm_db"  style="display: none;" method="post" action="">
            <table id="database_table" cellpadding="5px" align="center" style="border:1px solid green; padding:0px 0px;">
                <tr>
                    <td class="td1">Database:</td>                    
                    <td> <select id="database_db" name="database" required="required" onchange="setDbVersion_db(this); checkDBVersion();generateImageName_db();"> 
                             <option value="">Please select...</option>
                            <option value="mysql">MySQL</option>
                            <option value="postgres">PostgreSQL</option>
                            <option value="mariadb">MariaDB</option>
                            <option value="mssql">MSSQL for Linux</option>
                            <option value="oracle">Oracle</option>
                            <option value="ibmdb2expressc">DB2 Express-C</option>
                            <option value="cassandra">Apache Cassandra</option>
                            <option value="elasticsearch">Elasticsearch</option>
                            <option value="mongo">MongoDB</option>
                        </select> 
                    </td>                                                       
                    <td class="td1">Salesforce Case:</td> <td>  <input type="text" id="salesforceCase_db" name="salesforceCase"  maxlength="10" value="<%=template.getSalesforce_case()%>" onchange="generateImageName_db();" ></input> </td>
                </tr>                
                <tr>
                     <td class="td1">Database Version:</td>
                    <td><select id="database_version_db" required="required" name="database_version" onchange=" generateImageName_db();">
                             <option value="">Please select...</option>
                        </select> 
                    </td>                        
                    <td class="td1">Image Name:</td><td><input type="text" id="imageName_db"  name="imageName"></input> </td>
                </tr>
                <tr> 
                    <td class="td1">OS:</td> 
                    <td> <select id="os_db" name="os" required="required" onchange="setOsVersion_db(this); resetOSVersion_db();generateImageName_db();"> 
                            <option value="">Please select...</option>
                            <option value="ubuntu">Ubuntu</option>
                            <option value="centos">CentOS</option>
                            <option value="debian">Debian</option>
                            <option value="oraclelinux">Oracle Linux</option>
                        </select> 
                    </td>     
                </tr>
                <tr>
                   <td class="td1">OS Version:</td>
                    <td><select id="osVersion_db" required="required" name="osVersion" onchange=" resetDBVersion();generateImageName_db();">
                             <option value="">Please select...</option>
                        </select> 
                    </td>
                </tr>
                
                <tr><td></td><td></td> <td></td>
                    <td><button type="submit" id="saveTemplateBtn" class="btn btn-success" onclick="saveAsTemplate_db()">Save as Template</button> 
                        <button type="submit" class="btn btn-success" onclick="requestAction_db()">Request</button></td></tr>
                
            </table>                
            <input type="hidden" name="template_uuid" value="<%=template.getTemplate_uuid()%>"/>
            <%if (errMessage!= null ){%><div><%=errMessage%></div><%}%>
        </form>               
        </div>
            
        </div>
        <%@include file="footer.jsp" %>
</div>
        </div></div>        
        </main>

        
    </body>

</html>
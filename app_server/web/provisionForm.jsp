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
                   //enable sales_force 
//                   var salesforces=document.getElementsByName("salesforceCase");
//                   for(var i=0; i<salesforces.length; i++){
//                       salesforces[i].readonly=false;
//                   }
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
 //define the database version data array
var dbArr=[];
dbArr['mysql'] =
[
 {txt:'5.5', val:'5.5'},
 {txt:'5.6', val:'5.6'},
 {txt:'5.7', val:'5.7'},
 {txt:'8.0', val:'8.0'}
 ];
 dbArr['postgresql'] =
[
 {txt:'9.3', val:'9.3'},
 {txt:'9.4', val:'9.4'},
 {txt:'9.5', val:'9.5'},
 {txt:'9.6', val:'9.6'},
 {txt:'10.0', val:'10.0'}
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
 {txt:'MSSQL for Linux', val:'2017'}
 ];

   dbArr['oracle'] =
[
 {txt:'11gr2', val:'11gr2'},
 {txt:'12cr1', val:'12cr1'}
 ];
  dbArr['db2'] =
[
 {txt:'db2express-c', val:'express-c'}
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
            document.getElementById("os_db").value + document.getElementById("osVersion_db").value.toString()+ "-"+  
            document.getElementById("database_db").value + "-"+document.getElementById("database_version_db").value.toString();
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
    //if(document.getElementById("salesforceCase").value !== ""){
    //    enableInput();
    //}
}
function requestAction_db(){
    document.getElementById("salesforceCase_db").required="required";
    document.getElementById("templateForm_db").action="RequestServlet";    
    //if(document.getElementById("salesforceCase_db").value !== ""){
    //    enableInput();
    //}
}
function displayDatabase(){
    
    $('#database_a').toggleClass('active');
    $('#talend_a').removeClass('active');
    document.getElementById('templateForm_db').style.display='block';
    //document.getElementById('templateForm_db').style.backgroundColor='#47a3da';
    //document.getElementById('templateForm_db').style.color='#fff';
    document.getElementById('templateForm').style.display='none'; //hide talend
}
function displayTalend(){
    
   $('#talend_a').toggleClass('active');
   $('#database_a').removeClass('active');
    document.getElementById('templateForm').style.display='block';
    //document.getElementById('templateForm').style.backgroundColor='#47a3da';
    //document.getElementById('templateForm').style.color='#fff';
    document.getElementById('templateForm_db').style.display='none'; //hide talend
}
function displayHadoop(){
    alert("TODO: Please waiting ....");
}
</script>
   
<div class="col-lg-8 py-4 d-flex flex-column align-items-left justify-content-top align-content-center">
     <%@include file="navigator.jsp"%>
     
    

        <div class="tablecontent" style=" min-height:  800px;" >
        <div class="text-lg-center color-3">Request a container</div>
        <p>
        <div id="formBody" style="display: flex; flex-direction: row; align-items: flex-start;  justify-content: center;">
<div class="list-group" id="myList" role="tablist">
  <a class="list-group-item list-group-item-action" id="talend_a"  onclick="displayTalend(); " data-toggle="list" href="#" role="tab">Talend component</a>
  <a class="list-group-item list-group-item-action" id ="database_a"  onclick="displayDatabase(); " data-toggle="list" href="#" role="tab">Databases</a>

</div>
            
        <form  id="templateForm"  style="display: none;" method="post" action="">
            <table  id="talend_table"  cellpadding="5px" align="center" style="border:1px solid green;">
                <tr>
                    <td class="td1">Talend Component :</td>
                    <td> <select id="talendComponent" name="talendComponent" onchange="checkTomcat();  generateImageName();"> 
                            <option value="tac">TAC</option>
                            <option value="cmdline">CmdLine</option>
                            <option value="jobserver">Jobserver</option>
                        </select> 
                    </td>    
                    <td class="td1">Talend Version :</td>
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
                    <td> <select id="os" name="os" required="required" onchange="setOsVersion(this);"> 
                             <option value="">Please select...</option>
                            <option value="ubuntu">Ubuntu</option>
                            <option value="centos">CentOS</option>
                        </select> 
                    </td>
                    <td class="td1">Salesforce case: </td> <td>  <input type="text" id="salesforceCase" name="salesforceCase"  maxlength="10" value="<%=template.getSalesforce_case()%>" onchange=" generateImageName();" ></input> </td>
                </tr>
                <tr>
                    <td class="td1">OS Version: </td>
                    <td><select id="osVersion" required="required" name="osVersion" onchange=" generateImageName();">
                             <option value="">Please select...</option>
                        </select> 
                    </td>
                    <td class="td1">Image Name:  </td><td><input type="text" id="imageName"  name="imageName" ></input> </td>
                </tr>
                <tr><td class="td1">JDK Version : </td>
                    <td><select id="jdk" name="jdk" onchange="generateImageName();"> 
                            <option value="8">8</option>
                        </select> 
                    </td>
                </tr>
                <tr><td class="td1">JDK Update : </td>
                    <td><select id="jdkUpdate" name="jdkUpdate" onchange="generateImageName();">       
                            <option value="141">141</option>
                            <option value="144">144</option>
                            <option value="151">151</option>
                            <option value="152">152</option>
                            <option value="162">162</option>                                                      
                        </select> 
                    </td>
                </tr>
                <tr><td class="td1">Tomcat Version : </td>
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
                    <td class="td1">OS:</td> 
                    <td> <select id="os_db" name="os" required="required" onchange="setOsVersion_db(this);"> 
                            <option value="">Please select...</option>
                            <option value="ubuntu">Ubuntu</option>
                            <option value="centos">CentOS</option>
                        </select> 
                    </td>                    
                    <td class="td1">Salesforce case: </td> <td>  <input type="text" id="salesforceCase_db" name="salesforceCase"  maxlength="10" value="<%=template.getSalesforce_case()%>" onchange="generateImageName_db();" ></input> </td>
                </tr>                
                <tr>
                    <td class="td1">OS Version: </td>
                    <td><select id="osVersion_db" required="required" name="osVersion" onchange="generateImageName_db();">
                             <option value="">Please select...</option>
                        </select> 
                    </td>    
                    <td class="td1">Image Name:  </td><td><input type="text" id="imageName_db"  name="imageName"></input> </td>
                </tr>
                <tr> 
                    <td class="td1">Database:</td>                    
                    <td> <select id="database_db" name="database" required="required" onchange="setDbVersion_db(this);"> 
                             <option value="">Please select...</option>
                            <option value="mysql">MySQL</option>
                            <option value="postgresql">PostgreSQL</option>
                            <option value="mariadb">MariaDB</option>
                            <option value="mssql">MSSQL for Linux</option>
                            <option value="oracle">Oracle</option>
                            <option value="db2">IBM db2</option>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td class="td1">Database Version: </td>
                    <td><select id="database_version_db" required="required" name="database_version" onchange=" generateImageName_db();">
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
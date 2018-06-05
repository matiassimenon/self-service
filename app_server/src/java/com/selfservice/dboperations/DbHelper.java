/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.dboperations;

import com.selfservice.model.Template;
import com.selfservice.model.User;
import com.selfservice.util.SFUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;

/**
 * Db opertions
 *
 * @author aiming
 */
public class DbHelper {

    /**
     * Insert template data from provisionForm to db
     *
     * @param request form request from provisonForm.jsp
     * @param con db connection
     * @return Template
     * @throws SQLException
     */
    public static Template insertTemplate(HttpServletRequest request, Connection con) throws SQLException {
        String os = request.getParameter("os");
        String osVersion = request.getParameter("osVersion");
        String talendComponent = request.getParameter("talendComponent");
        String imageName = request.getParameter("imageName");
        String componentVersion = request.getParameter("componentVersion");
        String jdk = request.getParameter("jdk");
        String jdkUpdate = request.getParameter("jdkUpdate");
        String tomcatVersion = request.getParameter("tomcatVersion");
        String template_uuid = request.getParameter("template_uuid");
        String database = request.getParameter("database");
        String database_version = request.getParameter("database_version");
        String fromTemplate = request.getParameter("fromTemplate");
        String salesforce_case= request.getParameter("salesforceCase");
        int ret = 0;
        if (template_uuid==null || template_uuid.length() == 0) {
            template_uuid = SFUtils.getUUID(9);
        }
        User user = (User) request.getSession().getAttribute("user");
        String username = user.getUsername();
        username = (username == null ? "test" : username);

        PreparedStatement ps2 = null, ps = null;

        //save to TEMPLATE 

        String sql = "";
        String operation = "";
        if (!"null".equals(fromTemplate)) {
            //update if from template
            operation = "replace ";
        } else {
            //if not from template, always insert
            operation = "insert ";
            template_uuid = SFUtils.getUUID(9);
        }
        //begin transaction
        //insert to template table
        sql = operation + " into TEMPLATE(template_uuid, template_name, username, creation_date, last_edit) values(?,?,?,?,?) ";
        ps = con.prepareStatement(sql);
        ps.setString(1, template_uuid);
        ps.setString(2, imageName);
        ps.setString(3, username);
        ps.setDate(4, new Date(System.currentTimeMillis()));
        ps.setDate(5, new Date(System.currentTimeMillis()));
        ret = ps.executeUpdate();
        if (talendComponent != null) {// from Talend product tab
            sql = operation + " into TALEND_TEMPLATE(template_uuid, os, os_version, talend_version, talend_component,  jdk_version, jdk_update, tomcat_version) values(?,?,?,?,?,?,?,?) ";
            ps2 = con.prepareStatement(sql);
            ps2.setString(1, template_uuid);
            ps2.setString(2, os);
            ps2.setString(3, osVersion);
            ps2.setString(4, componentVersion);
            ps2.setString(5, talendComponent);

            ps2.setString(6, jdk);
            ps2.setString(7, jdkUpdate);
            ps2.setString(8, tomcatVersion);

            ret = ps2.executeUpdate();
        } else { // from Database tab
            sql = operation + " into DB_TEMPLATE(template_uuid, os, os_version, db, db_version) values(?,?,?,?,?) ";
            ps2 = con.prepareStatement(sql);
            ps2.setString(1, template_uuid);
            ps2.setString(2, os);
            ps2.setString(3, osVersion);
            ps2.setString(4, database);
            ps2.setString(5, database_version);
            ret = ps2.executeUpdate();
        }

        Template template = new Template();
        template.setTemplate_name(imageName);
        template.setTemplate_uuid(template_uuid);
        template.setOs_version(osVersion);
        template.setOs(os);
        template.setJdk_update(jdkUpdate);
        template.setJdk_version(jdk);
        template.setTalend_component(talendComponent);
        template.setTalend_version(componentVersion);
        template.setTomcat_version(tomcatVersion);
        template.setDatabase(database);
        template.setDatabase_version(database_version);
        template.setUsername(username);
        if(salesforce_case!= null)   template.setSalesforce_case(salesforce_case);

        return template;
    }
    
}

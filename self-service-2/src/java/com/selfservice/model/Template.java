/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.model;

import java.util.Date;

/**
 *
 * @author francisco
 */
public class Template {
    private String template_uuid="", username, os, os_version, talend_version, talend_component, jdk_version, jdk_update, tomcat_version;
    private Date last_edit, creation_date;
    private String template_name="";
    private String salesforce_case="";

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public String getTemplate_uuid() {
        return template_uuid;
    }

    public void setTemplate_uuid(String template_uuid) {
        this.template_uuid = template_uuid;
    }
   

    public Template() {
        
    }

    public Date getLast_edit() {
        return last_edit;
    }

    public void setLast_edit(Date last_edit) {
        this.last_edit = last_edit;
    }

    public String getTemplate_name() {
        return template_name;
    }

    public void setTemplate_name(String template_name) {
        this.template_name = template_name;
    }

    public String getSalesforce_case() {
        return salesforce_case;
    }

    public void setSalesforce_case(String salesforce_case) {
        this.salesforce_case = salesforce_case;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getOs_version() {
        return os_version;
    }

    public void setOs_version(String os_version) {
        this.os_version = os_version;
    }

    public String getTalend_version() {
        return talend_version;
    }

    public void setTalend_version(String talend_version) {
        this.talend_version = talend_version;
    }

    public String getTalend_component() {
        return talend_component;
    }

    public void setTalend_component(String talend_component) {
        this.talend_component = talend_component;
    }

    public String getJdk_version() {
        return jdk_version;
    }

    public void setJdk_version(String jdk_version) {
        this.jdk_version = jdk_version;
    }

    public String getJdk_update() {
        return jdk_update;
    }

    public void setJdk_update(String jdk_update) {
        this.jdk_update = jdk_update;
    }

    public String getTomcat_version() {
        return tomcat_version;
    }

    public void setTomcat_version(String tomcat_version) {
        this.tomcat_version = tomcat_version;
    }

    public Date getCreation_date() {
        return creation_date;
    }

    public void setCreation_date(Date creation_date) {
        this.creation_date = creation_date;
    }
    
    
}

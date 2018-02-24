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
    private Date last_edit;
    private String template_name;
    private String salesforce_case;
    private String template_uuid;

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
    
    
}

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
public class Request {
   
    private Date request_date;
    private String request_status, imagename;
    private String salesforce_case, username;

    public Request() {
    }

    public Date getRequest_date() {
        return request_date;
    }

    public void setRequest_date(Date request_date) {
        this.request_date = request_date;
    }

    public String getRequest_status() {
        return request_status;
    }

    public void setRequest_status(String request_status) {
        this.request_status = request_status;
    }

    public String getImagename() {
        return imagename;
    }

    public void setImagename(String imagename) {
        this.imagename = imagename;
    }

    public String getSalesforce_case() {
        return salesforce_case;
    }

    public void setSalesforce_case(String salesforce_case) {
        this.salesforce_case = salesforce_case;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    
}

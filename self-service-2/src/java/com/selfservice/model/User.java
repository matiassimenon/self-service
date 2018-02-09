/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.model;

/**
 *
 * @author francisco
 */

public class User {
    
    private String username, password, email;
    private String firstname, lastname;
    private String department, city, region;
    private boolean admin;

    public User() {
    }
    
    public User(String email, String username, String department, boolean admin, String city, String firstname,String lastname,String password, String region ) {
        this.email = email;
        this.username = username;
        this.department = department;
        this.admin = admin;
        this.city = city;
        this.firstname = firstname;
        this.lastname = lastname;
        this.password = password;
        this.region = region;
    }
    
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getFirstname() {
        return firstname;
    }
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    public String getLastname() {
        return lastname;
    }
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
    public String getDepartment() {
        return department;
    }
    public void setDepartment(String department) {
        this.department = department;
    }
    public boolean getAdmin() {
        return admin;
    }
    public void setAdmin(boolean admin) {
        this.admin = admin;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
            this.city = city;
    }
        public String getRegion() {
        return region;
    }
    public void setRegion(String region) {
            this.region = region;
    }
}

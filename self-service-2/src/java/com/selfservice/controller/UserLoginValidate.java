package com.selfservice.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.selfservice.servers.DbConnection;

import com.selfservice.model.User;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author francisco
 */
public class UserLoginValidate {

    public static List<User> getUsers(String username, String password) throws Exception {
        List<User> list = new ArrayList<>();
        //take a list to store the values which are in db

        Connection con = DbConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("select firstname, lastname, username, email, department, city, password, region, admin, admin_request from self_service_db.USER where username=? and password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            User pObject = new User();
            pObject.setFirstname(rs.getString(1)); //if the values exist in db then											
            pObject.setLastname(rs.getString(2));     // set them to setters and getters,then to list, and finally return the list
            pObject.setUsername(rs.getString(3));
            pObject.setEmail(rs.getString(4));
            pObject.setDepartment(rs.getString(5));
            pObject.setCity(rs.getString(6));
            pObject.setPassword(rs.getString(7));
            pObject.setRegion(rs.getString(8));
            int admin = rs.getInt(9);
            int adminRequest = rs.getInt(10);
            pObject.setAdmin(admin == 1 ? true : false);
            pObject.setAdminRequest(adminRequest == 1 ? true : false);
            list.add(pObject);
        }
        rs.close();
        ps.close();
        con.close();

        return list;  //returns the list		
    }

    public static List<User> getUsers(String username) {
        List<User> list = new ArrayList<>();
        try {

            //take a list to store the values which are in db
            Connection con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select firstname, lastname, username, email, department, city, password, region, admin, admin_request from self_service_db.USER where username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User pObject = new User();
                pObject.setFirstname(rs.getString(1)); //if the values exist in db then
                pObject.setLastname(rs.getString(2));     // set them to setters and getters,then to list, and finally return the list
                pObject.setUsername(rs.getString(3));
                pObject.setEmail(rs.getString(4));
                pObject.setDepartment(rs.getString(5));
                pObject.setCity(rs.getString(6));
                pObject.setPassword(rs.getString(7));
                pObject.setRegion(rs.getString(8));
                int admin = rs.getInt(9);
                int adminRequest = rs.getInt(10);
                pObject.setAdmin(admin == 1 ? true : false);
                pObject.setAdminRequest(adminRequest == 1 ? true : false);
                list.add(pObject);
            }
            rs.close();
            ps.close();
           
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(UserLoginValidate.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;  //returns the list	
    }
}

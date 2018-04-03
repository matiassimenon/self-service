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
import com.selfservice.util.SFUtils;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author aiming
 */
public class UserHelper {

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
            pObject.setAdmin(admin == 1);
            pObject.setAdminRequest(adminRequest == 1);
            list.add(pObject);
        }
        rs.close();
        ps.close();
        con.close();

        return list;  //returns the list		
    }

    public static List<User> getUsers(String username) throws SQLException {
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
                pObject.setAdmin(admin == 1);
                pObject.setAdminRequest(adminRequest == 1);
                list.add(pObject);
            }
            rs.close();
            ps.close();

            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return list;  //returns the list	
    }

    public static User getUser(String username_email) throws SQLException {
        try {

            //take a list to store the values which are in db
            Connection con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select username, email, question, answer from self_service_db.USER where username=? or email=?");
            ps.setString(1, username_email);
            ps.setString(2, username_email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User pObject = new User();
                pObject.setUsername(rs.getString(1));
                pObject.setEmail(rs.getString(2));
                pObject.setQuestion(rs.getString(3));
                pObject.setAnswer(rs.getString(4));

                return pObject;
            }
            rs.close();
            ps.close();

            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return null;
    }

    public static boolean savePassword(String username, String newPasswd) throws SQLException{
        String encryptedPassword = SFUtils.getSecurePassword(newPasswd);
        String sql = "update USER set password=? where username=?";

        Connection conn = null;

        try {
            conn = DbConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, encryptedPassword);
            ps.setString(2, username);

            ps.executeUpdate();

            conn.close();

            return true;
        } catch (SQLException ex) {
            
            throw ex;
        }finally{
                    if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex1) {
                    throw ex1;
                }
            }
        }
        
    }
}

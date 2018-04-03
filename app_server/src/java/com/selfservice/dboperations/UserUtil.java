/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.dboperations;

import com.selfservice.controller.UserListServlet;
import com.selfservice.model.User;
import com.selfservice.servers.DbConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class UserUtil {

    public static List<User> getUsers() {
        List<User> users = new ArrayList();
        Connection conn = null;
        try {
            conn = DbConnection.getConnection();
            if (conn != null) {
                String sql = "select * from USER";
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sql);
                while (rs.next()) {
                    User user = new User();
                    user.setFirstname(rs.getString(1));
                    user.setLastname(rs.getString(2));
                    user.setUsername(rs.getString(3));
                    user.setEmail(rs.getString(4));
                    user.setDepartment(rs.getString(5));
                    user.setCity(rs.getString(6));
                    user.setPassword(rs.getString(7));
                    user.setRegion(rs.getString(8));
                    int isAdmin = rs.getInt(9);
                    user.setAdmin((isAdmin == 1));
                    int isAdminReq = rs.getInt(10);
                    user.setAdminRequest((isAdminReq == 1));
                    users.add(user);
                }
                conn.close();
            }
        } catch (SQLException e) {

            Logger.getLogger(UserListServlet.class.getName()).log(Level.SEVERE, null, e);

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return users;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.controller;

import com.selfservice.model.User;
import com.selfservice.servers.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Actions in userList.jsp
 *
 * @author aiming
 */
public class UserListServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection con = null;
        List<User> list = new ArrayList<>();
        PrintWriter out = response.getWriter();
        User user = (User) request.getSession(false).getAttribute("user");
        try {
            con = DbConnection.getConnection();
            String deleteString = request.getQueryString();

            PreparedStatement ps;
            String sql = null;
            int ret = 0;
            //delete users
            if (deleteString != null && deleteString.contains("delete")) {

                String[] deleteNames = deleteString.replace("delete=", "").split("&");
                sql = "delete from USER where username in ";
                String names = "(";
                for (int i = 0; i < deleteNames.length; i++) {
                    String name = deleteNames[i].replace("&", "");
                    if (i == deleteNames.length - 1) {

                        names += "'" + name + "'";
                    } else {
                        names += "'" + name + "',";
                    }
                }
                names += ")";
                sql += names;
                System.out.println("deleteUser sql-->" + sql);
                ps = con.prepareStatement(sql);
                ret = ps.executeUpdate();
                ps.close();
            }
            //save users
            if (deleteString != null && deleteString.contains("save")) {

                String[] saveusers = deleteString.replace("save", "").split("&");

                for (String user1 : saveusers) {
                    //format: username=admin
                    if (user1.length() > 0) {
                        String[] update = user1.split("=");
                        String username = update[0];
                        String isAdmin = update[1];
                        if(isAdmin.equalsIgnoreCase("true")){
                            sql = "update USER set admin=1, admin_request=0 where username=?";
                        }else{
                            sql = "update USER set admin=0 where username=?";
                        }
                        ps = con.prepareStatement(sql);
                        ps.setString(1, username);
                        ret = ps.executeUpdate();
                        ps.close();
                        //update the session if it's the current user
                        if (username.equalsIgnoreCase(user.getUsername())) {
                            user.setAdmin(isAdmin.equalsIgnoreCase("true"));
                        }
                    }
                }
            }

            //get user list 
            sql = "select  firstname, lastname, username, email, department, city, password, region, admin from USER";

            String sTxt = request.getParameter("search");
            if (sTxt != null && sTxt.length() > 0) {
                sql = sql + " where  firstname like '%" + sTxt + "%' or lastname like '%" + sTxt + "%' or username like '%" + sTxt + "%' or email like '%" + sTxt + "%' or department like '%" + sTxt + "%'";
                sql += " or city like '%" + sTxt + "%' or region like '%" + sTxt + "%'";
            }
            sql = sql + " order by firstname ASC";
            //add paging sql
            int page = 1; //current page;
            int recordsPerPage = 12;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            int beginIndex = (page - 1) * recordsPerPage;

            String pageSql = "select o.* from (" + sql + ") o limit " + beginIndex + ", " + recordsPerPage;
            ps = con.prepareStatement(pageSql);
            ResultSet rs = ps.executeQuery();
            System.out.println("userList sql-->" + sql);

            while (rs.next()) {
                User object = new User();
                object.setFirstname(rs.getString(1));
                object.setLastname(rs.getString(2));
                object.setUsername(rs.getString(3));
                object.setEmail(rs.getString(4));
                object.setDepartment(rs.getString(5));
                object.setCity(rs.getString(6));
                object.setPassword(rs.getString(7));
                object.setRegion(rs.getString(8));
                int iadmin = rs.getInt(9);
                object.setAdmin((iadmin == 1));
                list.add(object);
            }
            rs.close();
            ps.close();
            //get thet total count
            String totalSql = "select count(*) from (" + sql + ") o";
            ps = con.prepareStatement(totalSql);
            rs = ps.executeQuery();
            int total = 0;
            if (rs.next()) {
                total = rs.getInt(1);
            }
            rs.close();
            ps.close();
            //setup the paging attribute
            int noOfPages = (int) Math.ceil(total * 1.0 / recordsPerPage);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);

            request.setAttribute("userList", list);
            request.getRequestDispatcher("userList.jsp").include(request, response);
            //detroy the current user's session if it's deleted
            sql = "select * from USER where username='" + user.getUsername() + "'";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (!rs.next()) {
                request.getSession(false).invalidate();
            }
            rs.close();
            ps.close();
           
        } catch (SQLException ex) {
            String err = ex.getLocalizedMessage();
            request.setAttribute("errMessage", "<font color='red'>Save Failed!  " + err + "</font>");
            Logger.getLogger(UserListServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("userList.jsp").forward(request, response);

        } finally {

            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

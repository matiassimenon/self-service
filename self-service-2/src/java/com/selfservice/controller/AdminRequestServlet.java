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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zqin
 */
public class AdminRequestServlet extends HttpServlet {

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
        
        List<User> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        
        try{
            conn = DbConnection.getConnection();
            String sql = "select  firstname, lastname, username, email, department, city, region from USER where admin_request=1";
            
            String sTxt = request.getParameter("search");
            if (sTxt != null && sTxt.length() > 0) {
                sql = sql + " and  (firstname like '%" + sTxt + "%' or lastname like '%" + sTxt + "%' or username like '%" + sTxt + "%' or email like '%" + sTxt + "%' or department like '%" + sTxt + "%'";
                sql +=  " or city like '%" + sTxt + "%' or region like '%" + sTxt + "%')";
            }
            sql = sql + " order by firstname ASC";
            System.out.println("userList sql-->" + sql);
            
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                User user = new User();
                user.setFirstname(rs.getString(1));
                user.setLastname(rs.getString(2));
                user.setUsername(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setDepartment(rs.getString(5));
                user.setCity(rs.getString(6));
                user.setRegion(rs.getString(7));
                list.add(user);
            }
            
            rs.close();
            conn.close();
            
            request.setAttribute("adminReqList", list);
            request.getRequestDispatcher("/adminRoleRequestList.jsp").include(request, response);
        } catch (SQLException e) {
            if (conn!=null) {
                try {
                        conn.rollback();
                    } catch (SQLException ex1) {
                        Logger.getLogger(UserListServlet.class.getName()).log(Level.SEVERE, null, ex1);
                    } finally {
                        if (conn != null) {
                            try {
                                conn.close();
                            } catch (SQLException ex) {
                                ex.printStackTrace();
                            }
                        }
                }
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

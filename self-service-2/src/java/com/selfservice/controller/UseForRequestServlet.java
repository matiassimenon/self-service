/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.controller;

import com.selfservice.dboperations.RequestServlet;
import com.selfservice.dboperations.SaveAsTemplate;
import com.selfservice.model.User;
import com.selfservice.servers.DbConnection;
import com.selfservice.util.SFUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 'Use for request' from templateList.jsp
 *
 * @author aiming
 */
public class UseForRequestServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        User user = (User) request.getSession().getAttribute("user");
        String username = user.getUsername();
        username = (username == null ? "test" : username);
        Connection con = null;
        PreparedStatement ps;
        try {
            con = DbConnection.getConnection();
            String insertString=request.getQueryString();
            if(insertString !=null && insertString.contains("request")){
                
                String[] templateNames=insertString.replace("request=", "").split("&");
                
            }
            //save to REQUEST table
            String request_uuid = SFUtils.getUUID(9);
            String sql = "insert into REQUEST(request_uuid, request_date, request_status, salesforce_case, username, template_uuid) values(?,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, request_uuid);
            ps.setDate(2, new Date(System.currentTimeMillis()));
            ps.setString(3, "pending"); //init status is 'pending'
           // ps.setString(4, salesforceCase);
            ps.setString(5, username);
           // ps.setString(6, template_uuid);
            int ret = ps.executeUpdate();
            //save successfully
            //TODO Request to backend

            if (ret > 0) {
                request.getRequestDispatcher("provisionForm.jsp").include(request, response);
                out.print("<h3 class='save_ok'>Request Successfully!!</h3>");
            }
        } catch (SQLException ex) {
            try {
                if (con != null) {
                    con.rollback();
                }
                Logger.getLogger(SaveAsTemplate.class.getName()).log(Level.SEVERE, null, ex);
                request.getRequestDispatcher("provisionForm.jsp").include(request, response);
                String err = ex.getLocalizedMessage();
                String outstr = "<h3 class='save_err'>Request Failed!  " + err + "</h3>";
                out.print(outstr);
            } catch (SQLException ex1) {
                Logger.getLogger(RequestServlet.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SaveAsTemplate.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.dboperations;

import com.selfservice.model.Template;
import com.selfservice.servers.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 'Save as Template' in provisionForm.jsp
 *
 * @author francisco
 */
@WebServlet(name = "SaveAsTemplate", urlPatterns = {"/SaveAsTemplate"})
public class SaveAsTemplate extends HttpServlet {

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
        try {          
            con = DbConnection.getConnection();
            con.setAutoCommit(false);
            Template template = DbHelper.insertTemplate(request, con);
            //commit the transaction
            con.commit();           
            //clear template_uuid;
            
            request.setAttribute("template", template);
            request.setAttribute("errMessage", "<font color='green'>Successful Save!</font>");
            request.getRequestDispatcher("provisionForm.jsp").include(request, response);
            //out.print("<h3 class='save_ok'>Successful Save.</h3>");

        } catch (SQLException ex) {
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException ex1) {
                Logger.getLogger(SaveAsTemplate.class.getName()).log(Level.SEVERE, null, ex1);
            }
            request.setAttribute("errMessage", "<font color='red'>Save Failed!" + ex.getLocalizedMessage() + "</font>");
            Logger.getLogger(SaveAsTemplate.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("provisionForm.jsp").include(request, response);
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

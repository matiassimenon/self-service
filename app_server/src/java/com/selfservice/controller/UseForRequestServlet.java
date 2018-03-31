/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.controller;

import com.selfservice.dboperations.SaveAsTemplate;
import com.selfservice.model.Template;
import com.selfservice.servers.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 'Use for request' from templateList.jsp, history.jsp
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
        
        Connection con = null;
        PreparedStatement ps;
        try {
            con = DbConnection.getConnection();
            String insertString=request.getQueryString();
            if(insertString !=null && insertString.contains("request=")){
                int pos= insertString.indexOf('=');
                if(pos>0){
                    String template_uuid=insertString.substring(pos+1);
                    String sql="select template_uuid, template_name, username, creation_date, last_edit, os, os_version, talend_version, talend_component, jdk_version, jdk_update, tomcat_version from TEMPLATE where template_uuid=? ";
                    ps = con.prepareStatement(sql);
                    ps.setString(1, template_uuid);
                    ResultSet rs=ps.executeQuery();
                    if(rs.next()){
                        Template template=new Template();
                        template.setTemplate_uuid(rs.getString(1));
                        template.setTemplate_name(rs.getString(2));
                        template.setUsername(rs.getString(3));
                        template.setCreation_date(rs.getDate(4));
                        template.setLast_edit(rs.getDate(5));
                        template.setOs(rs.getString(6));
                        template.setOs_version(rs.getString(7));
                        template.setTalend_version(rs.getString(8));
                        template.setTalend_component(rs.getString(9));
                        template.setJdk_version(rs.getString(10));
                        template.setJdk_update(rs.getString(11));
                        template.setTomcat_version(rs.getString(12));
                        request.setAttribute("template", template);
                        request.setAttribute("fromTemplate", "true");
                        //forward to provisionForm.jsp 
                        request.getRequestDispatcher("provisionForm.jsp").forward(request, response);
                    }
                        rs.close();
                        ps.close();                    
                }
                
            }
            
        } catch (SQLException ex) {
                String err = ex.getLocalizedMessage();
                request.setAttribute("errMessage", "<font color='red'>Request Failed!  " + err + "</font>");
   
                Logger.getLogger(UseForRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.getRequestDispatcher("templateList.jsp").forward(request, response);

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

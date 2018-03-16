/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.dboperations;

import com.selfservice.model.Template;
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
        PrintWriter out = response.getWriter();

        response.setContentType("text/html;charset=UTF-8");
        String os = request.getParameter("os");
        String osVersion = request.getParameter("osVersion");
        String registry = request.getParameter("registry");
        String talendComponent = request.getParameter("talendComponent");
        String imageName = request.getParameter("imageName");
        String componentVersion = request.getParameter("componentVersion");
        String jdk = request.getParameter("jdk");
        String jdkUpdate = request.getParameter("jdkUpdate");
        String tomcatVersion = request.getParameter("tomcatVersion");
        String template_uuid = request.getParameter("template_uuid");
        if (template_uuid.length() == 0) {
            template_uuid = SFUtils.getUUID(9);
        }
        User user = (User) request.getSession().getAttribute("user");
        String username = user.getUsername();
        username = (username == null ? "test" : username);
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            //save to TEMPLATE 
            String fromTemplate = request.getQueryString();
            String sql = "";
            if ( ! "null".equals(fromTemplate)) {
                //update if from template
                sql = "replace ";
            } else {
                //if not from template, always insert
                sql = "insert ";
                template_uuid = SFUtils.getUUID(9);
            }

            sql = sql+ " into TEMPLATE(template_uuid, template_name, username, creation_date, last_edit, os, os_version, talend_version, talend_component, jdk_version, jdk_update, tomcat_version) values(?,?,?,?,?,?,?,?,?,?,?,?) ";
            System.out.println("saveToTemplate sql-->" + sql);
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, template_uuid);
            ps.setString(2, imageName);
            ps.setString(3, username);
            ps.setDate(4, new Date(System.currentTimeMillis()));
            ps.setDate(5, new Date(System.currentTimeMillis()));
            ps.setString(6, os);
            ps.setString(7, osVersion);
            ps.setString(8, componentVersion);
            ps.setString(9, talendComponent);
            ps.setString(10, jdk);
            ps.setString(11, jdkUpdate);
            ps.setString(12, tomcatVersion);
            int ret = ps.executeUpdate();

            //save successfully
            if (ret > 0) {
                Template template = new Template();
                template.setTemplate_name(imageName);
                template.setTemplate_uuid(template_uuid);
                template.setOs_version(osVersion);
                template.setOs(os);
                template.setJdk_update(jdkUpdate);
                template.setJdk_version(jdk);
                template.setTalend_component(talendComponent);
                template.setTalend_version(componentVersion);
                template.setTomcat_version(tomcatVersion);
                template.setUsername(username);
                request.setAttribute("template", template);
                request.setAttribute("errMessage", "<font color='green'>Save Successfully!!</font>");
                request.getRequestDispatcher("provisionForm.jsp").include(request, response);
                //out.print("<h3 class='save_ok'>Save Successfully!!</h3>");
            }
        } catch (SQLException ex) {
            request.setAttribute("errMessage", "<font color='red'>Save Failed!" + ex.getLocalizedMessage() + "</font>");
            Logger.getLogger(SaveAsTemplate.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("provisionForm.jsp").include(request, response);
            //String err=ex.getLocalizedMessage();
            //String outstr= "<h3 class='save_err'>Save Failed!  "+ err+ "</h3>";
            //out.print(outstr);
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

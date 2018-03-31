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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 'Reqest' in provisionForm.jsp
 *
 * @author aiming
 */
public class RequestServlet extends HttpServlet {

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
        String salesforceCase = request.getParameter("salesforceCase");
        String template_uuid = request.getParameter("template_uuid");
        User user = (User) request.getSession(false).getAttribute("user");
        String username = user.getUsername();
        username = (username == null ? "test" : username);
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql;
            int ret;
            PreparedStatement ps;
            if(template_uuid.length()==0){//insert one template record
                template_uuid=SFUtils.getUUID(9);
                System.out.print(template_uuid);
                sql = "insert into TEMPLATE(template_uuid, template_name, username, creation_date, last_edit, os, os_version, talend_version, talend_component, jdk_version, jdk_update, tomcat_version) values(?,?,?,?,?,?,?,?,?,?,?,?) ";
                ps = con.prepareStatement(sql);
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
                ret = ps.executeUpdate();
            }

            //save to REQUEST table
            String request_uuid = SFUtils.getUUID(9);
            sql = "insert into REQUEST(request_uuid, request_date, request_status, salesforce_case, username, template_uuid) values(?,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, request_uuid);
            ps.setDate(2, new Date(System.currentTimeMillis()));
            ps.setString(3, "pending"); //init status is 'pending'
            ps.setString(4, salesforceCase);
            ps.setString(5, username);
            ps.setString(6, template_uuid);
            ret = ps.executeUpdate();
            //save successfully
            //TODO Request to backend

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
                template.setSalesforce_case(salesforceCase);
                request.setAttribute("template", template);
                request.setAttribute("errMessage", "<font color='green'>Request Successfully!!</font>");
                request.getRequestDispatcher("provisionForm.jsp").forward(request, response);
                //out.print("<h3 class='save_ok'>Request Successfully!!</h3>");
            }
        } catch (SQLException ex) {
            request.setAttribute("errMessage", "<font color='red'>Request Failed!" + ex.getLocalizedMessage() +"</font>");
            Logger.getLogger(SaveAsTemplate.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("provisionForm.jsp").forward(request, response);
            //String err=ex.getLocalizedMessage();
            //String outstr= "<h3 class='save_err'>Request Failed!  "+ err+ "</h3>";
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
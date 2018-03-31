/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.dboperations;

import com.selfservice.servers.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.selfservice.model.User;
import com.selfservice.util.SFUtils;
import javax.servlet.http.HttpSession;

/**
 * Register in register.jsp, and save action in userProfile.jsp
 *
 * @author aiming
 */
public class SaveUser extends HttpServlet {

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
        String jspPage = request.getQueryString();

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        String region = request.getParameter("region");
        String city = request.getParameter("city");
        String admin = request.getParameter("admin");
        int isAdminRequest = "true".equals(admin) ? 1 : 0;
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        password1 = SFUtils.getSecurePassword(password1);
        Connection con = null;
        PreparedStatement ps = null;
        User user = (User) request.getSession(false).getAttribute("user");
        if (user == null) {
            user = new User();
        }
        try {
            con = DbConnection.getConnection();

            //insert to User
            String sql = null;

            boolean isInsert = "register.jsp".equals(jspPage);
            if (isInsert) {
                sql = "insert into USER(firstname, lastname, username, email, department, city, password, region, admin, admin_request)values(?,?,?,?,?,?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, firstname);
                ps.setString(2, lastname);
                ps.setString(3, username);
                ps.setString(4, email);
                ps.setString(5, department);
                ps.setString(6, city);
                ps.setString(7, password1);
                ps.setString(8, region);
                ps.setInt(9, 0);
                ps.setInt(10, isAdminRequest);
            }

            //update user           
            if (!isInsert) {
                sql = "update USER set firstname=?, lastname=?, email=?, department=?, city=?, password=?, region=?, admin_request=? where username=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, firstname);
                ps.setString(2, lastname);
                ps.setString(3, email);
                ps.setString(4, department);
                ps.setString(5, city);
                ps.setString(6, password1);
                ps.setString(7, region);
                ps.setInt(8, isAdminRequest);
                ps.setString(9, username);
                //update the user in the session
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.setAttribute("user", user);
                }                
            }

            if (sql != null) {
                int ret = ps.executeUpdate();
                if (ret > 0) {
                    user.setUsername(username);
                    user.setFirstname(firstname);
                    user.setLastname(lastname);
                    user.setCity(city);
                    user.setDepartment(department);
                    user.setEmail(email);
                    user.setRegion(region);
                    user.setAdminRequest(isAdminRequest == 1);
                    user.setPassword(password2);

                    request.setAttribute("user", user);
                    request.setAttribute("errMessage", "<font color='green'>Save Successfully!!</font>");
                    request.getRequestDispatcher(jspPage).include(request, response);
                    //out.print("<h3 class='save_ok'>Save Successfully!!</h3>");
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(SaveUser.class.getName()).log(Level.SEVERE, null, ex);
            String err = ex.getLocalizedMessage();
            String outstr = "<font color='red'> Save Failed!  " + err + "</font>";
            request.setAttribute("errMessage", outstr);
            request.getRequestDispatcher(jspPage).include(request, response);
            //out.print(outstr);

        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(SaveUser.class.getName()).log(Level.SEVERE, null, ex);
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
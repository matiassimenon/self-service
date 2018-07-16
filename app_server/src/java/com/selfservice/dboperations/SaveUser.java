/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.dboperations;

import com.selfservice.controller.UserHelper;
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
import com.selfservice.util.SHA;
import java.util.List;
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
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        String encryptAnswer = "";
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        password1 = SHA.getSHA256(password1);
        Connection con = null;
        PreparedStatement ps = null;
        User user = (User) request.getSession(false).getAttribute("user");
        if (user == null) {
            user = new User();
        }
        try {
            con = DbConnection.getConnection();
            user.setUsername(username);
            user.setFirstname(firstname);
            user.setLastname(lastname);
            user.setCity(city);
            user.setDepartment(department);
            user.setEmail(email);
            user.setRegion(region);
            user.setAdminRequest(isAdminRequest == 1);
            user.setPassword(password2);
            user.setQuestion(question);
            if (answer.length() > 0) {
                encryptAnswer = SHA.getSHA256(answer);
            }
            user.setAnswer(encryptAnswer);

            request.setAttribute("user", user);
            //insert to User
            String sql = null;

            boolean isInsert = "register.jsp".equals(jspPage);
            if (isInsert) {
                List<User> list = UserHelper.getUsers(username);
                if (list.size() > 0) {//user already exists
                    throw new SQLException("The username " + username + " already in use!");
                }
                sql = "insert into USER(firstname, lastname, username, email, department, city, password, region, admin, admin_request, question, answer)values(?,?,?,?,?,?,?,?,?,?,?,?)";
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
                ps.setString(11, question);
                ps.setString(12, encryptAnswer);
            }

            //update user           
            if (!isInsert) {
                sql = "update USER set firstname=?, lastname=?, email=?, department=?, city=?, password=?, region=?, admin_request=?,  question=?, answer=? where username=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, firstname);
                ps.setString(2, lastname);
                ps.setString(3, email);
                ps.setString(4, department);
                ps.setString(5, city);
                ps.setString(6, password1);
                ps.setString(7, region);
                ps.setInt(8, isAdminRequest);

                ps.setString(9, question);

                ps.setString(10, encryptAnswer);

                ps.setString(11, username);
                //update the user in the session
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.setAttribute("user", user);
                }
            }

            if (sql != null) {
                int ret = ps.executeUpdate();
                
                request.setAttribute("errMessage", "<font color='green'>Save Succeded.</font>");
                request.getRequestDispatcher(jspPage).include(request, response);
                //out.print("<h3 class='save_ok'>Save Succeded.</h3>");
                
            }

        } catch (SQLException ex) {
            Logger.getLogger(SaveUser.class.getName()).log(Level.SEVERE, null, ex);
            String err = ex.getLocalizedMessage();
            String outstr = "<font color='red'> Save Failed: " + err + "</font>";
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

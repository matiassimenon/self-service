/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.controller;

import com.selfservice.dboperations.UserUtil;
import com.selfservice.model.User;
import com.selfservice.servers.DbConnection;
import com.selfservice.util.Mail;
import com.selfservice.util.SFUtils;
import com.selfservice.util.SeverletUtil;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Not used due to mail issue: as it's not allowed to send mail in GCP instance
 * @author zqin
 */
@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/ResetPasswordServlet"})
public class ResetPasswordServlet extends HttpServlet {
    
    private User registerUser = null;

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
        
        String step = request.getParameter("step");
        request.getQueryString();
        String redirectUrl = "login.jsp";
        String subject = "Self Service: Reset Password (Do Not Reply!)";
        
        if (step.equals("1")) {
            redirectUrl = "/resetPassword.jsp?step=1";
            String email = request.getParameter("email");
            String message = checkEmail(email);

            if (message == null && registerUser != null) {
               
                String url = SeverletUtil.getProjectContextUrl(request) + "/resetPassword.jsp?step=2&email=" + email +"&id=" + request.getSession().getId();
                message = "You're trying to reset the password, please click the following link in 5 minutes:";
                String content = buildContent(registerUser,message,url);
                
                try {
                    Mail.send(email, subject, content);
                    message = "A mail had sent to your email box: " + email + ", please click the link to finish reset password.";
                    request.getSession().setMaxInactiveInterval(300);
                } catch (MessagingException ex) {
                    Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
                    message = "<font color='red'>Sent mail failed, the email address is unreachable!</font>";
                }
            }
            request.setAttribute("message", message);            
        } else if (step.equals("2")) {
            redirectUrl = "/resetPassword.jsp?step=2&id="+request.getSession().getId();
            String newpass = request.getParameter("password1");
            String email = request.getParameter("email");
            if (newpass != null && email != null) {
                boolean isSaved = savePassword(email, newpass);
                String message = "";
                if(isSaved) {
                    String url = SeverletUtil.getProjectContextUrl(request) + "/login.jsp";
                    message = "<p>  Congrats! Your new password had changed successfully, please click the following link to login: </p>";
                    String content = buildContent(registerUser,message,url);
                    
                    try {
                        Mail.send(email, subject, content);
                    } catch (MessagingException ex) {
                        Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }                    
                    
                    message = "New Password saved, page will redirect to login after 5s.";
                    response.setHeader("Refresh","5;url=login.jsp");
                } else {
                    message = "<font color = red> Saved failed! Please contact the Devops Team Administrator for detail information. </font>";
                }
                
                request.setAttribute("message", message);
            }
        }

        request.getRequestDispatcher(redirectUrl).include(request, response);
    }
    
    protected String checkEmail (String email) {
        String message = null;
        
        if (email!=null) {
            if (!email.matches("^([\\w-\\.]+)@talend.com")) {
                message = "<font color='red'>It's not a talend email, please check again</font>";
            } else {
                List<User> users = UserUtil.getUsers();
                for (User user: users) {
                    if (email.equalsIgnoreCase(user.getEmail())) {
                        registerUser = user;
                        break;
                    }
                }
                
                if (registerUser == null) {
                    message = "<font color='red'>This email dosen't belong to any register user</font>";
                }
            }
        }
        
        return message;
    }
    
    protected boolean savePassword(String email, String newpass) {

        String encryptedPassword = SFUtils.getSecurePassword(newpass);
        String sql = "update USER set password=? where email=?";
        
        Connection conn = null;
        
        try {
            conn = DbConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, encryptedPassword);
            ps.setString(2, email);
            
            ps.executeUpdate();
            
            conn.close();
            
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
            if (conn != null) {
                try {
                    conn.rollback();
                    conn.close();
                } catch (SQLException ex1) {
                    Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex1);
                }
            }
            return false;
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

    private String buildContent(User registerUser, String msg, String url) {
        StringBuilder sb = new StringBuilder();
        
        sb.append("<p align='left'>Dear ").append(registerUser.getFirstname()).append(" ").append(registerUser.getLastname()).append(",</p>");
        sb.append(msg);
        
        sb.append("<p><a href='").append(url).append("'>").append(url).append("</a></p>");
        
        sb.append("<hr><p align='left'>Talend DevOps Team</p>");
        
        return sb.toString();
    }

}

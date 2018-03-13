/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.controller;

import com.selfservice.dboperations.UserHelper;
import com.selfservice.model.User;
import com.selfservice.util.Mail;
import java.io.IOException;
import java.io.PrintWriter;
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
 *
 * @author Administrator
 */
@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/ResetPasswordServlet"})
public class ResetPasswordServlet extends HttpServlet {

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
        
        String email = request.getParameter("email");
        String message = checkEmail(email);
        
        if (message == null) {
            String subject = "Self Service: Reset Password (Do Not Reply!)";
            String href = "http://localhost:8080/resetPassword.jsp?email=" + email;
            String content = "<p align='left'>Dear User,</p> <p>  You're trying to reset the password, please click the following link:</p> <p><a href='"+href+"'>"+href+" </p>";
            try {
                Mail.send(email, subject, content);
                message = "A mail had sent to your email box: " + email + ", please click the link to finish reset password.";
            } catch (MessagingException ex) {
                Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
                message = "Sent mail failed, the email box is unreachable!";
            }
        }
        request.setAttribute("message", message);
        
        request.getRequestDispatcher("/resetPassword.jsp").include(request, response);
    }
    
    protected String checkEmail (String email) {
        String message = null;
        
        if (email!=null) {
            if (!email.matches("^([\\w-\\.]+)@talend.com")) {
                message = "It's not a valid talend email, please check again";
            } else {
                List<User> users = UserHelper.getUsers();
                User registerUser = null;
                for (User user: users) {
                    if (email.equalsIgnoreCase(user.getEmail())) {
                        registerUser = user;
                        break;
                    }
                }
                
                if (registerUser == null) {
                    message = "This email dosn't belong to any register user";
                }
            }
        }
        
        return message;
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

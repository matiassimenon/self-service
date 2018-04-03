/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.controller;

import com.selfservice.model.User;
import com.selfservice.util.SHA;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aiming
 */
public class ForgotPasswdServlet extends HttpServlet {

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
        String step=request.getParameter("step");
        try{           
            if("1".equals(step)){
                String username_email=request.getParameter("username_email");
                User user= UserHelper.getUser(username_email);
                if(user == null){
                    throw new SQLException("The username/email " + username_email + " does not exist!");
                }
                request.getSession(false).setAttribute("resetUser", user);
                request.getSession(false).setMaxInactiveInterval(300); //5 mins
                request.getRequestDispatcher("forgotPasswd2.jsp").forward(request, response);
            }
            
            if("2".equals(step)){
                User user=(User)request.getSession(false).getAttribute("resetUser");
                String answer=request.getParameter("answer");
                if(user.getAnswer().equals( SHA.getSHA256(answer))){//next step
                    request.getRequestDispatcher("forgotPasswd3.jsp").forward(request, response);
                }else{
                    throw new SQLException("Answer is not correct, try again!");
                }
            }
            if("3".equals(step)){
                String passwd=request.getParameter("password1");
                String username=request.getParameter("username");
                if(UserHelper.savePassword(username, passwd)){
                    request.setAttribute("errMessage", "<font color='green'> Reset password successfully!</font>  <a href='login.jsp'>Login</a>");
                    request.getRequestDispatcher("forgotPasswd3.jsp").forward(request, response);
                }                
            }
        }catch(SQLException e){
            String errmsg= "<font color='red'>" + e.getMessage() + "</font>";            
            request.setAttribute("errMessage", errmsg);
            if("1".equals(step)){
                request.getRequestDispatcher("forgotPasswd1.jsp").forward(request, response);
            }
            if("2".equals(step)){
                request.getRequestDispatcher("forgotPasswd2.jsp").forward(request, response);
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

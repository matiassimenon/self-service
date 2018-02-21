/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.controller;

import com.selfservice.servers.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 *
 * @author francisco
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

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
        PrintWriter out=response.getWriter();
        String firstname=request.getParameter("firstname");
        String lastname=request.getParameter("lastname");
        String username=request.getParameter("username");
        String email=request.getParameter("email");
        String department=request.getParameter("department");
        String region=request.getParameter("region");
        String city=request.getParameter("city");
        String admin=request.getParameter("admin");
        int  isAdmin="true".equals(admin)?1:0;
        String password1=request.getParameter("password1");
        String password2=request.getParameter("password2");
        
        try {
            Connection con=DbConnection.getConnection();
            //insert to User
            String sql="insert into USER(firstname, lastname, username, email, department, city, password, region, admin)values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, username);
            ps.setString(4, email);
            ps.setString(5, department.toUpperCase());
            ps.setString(6, city);
            ps.setString(7, password1);
            ps.setString(8, region);
            ps.setInt(9, isAdmin);
            int ret=ps.executeUpdate();
            if(ret ==1){
                 request.getRequestDispatcher("register.jsp").include(request, response);
                 out.print("<h3 class='save_ok'>Register Successfully!!</h3>");
            }
           
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("register.jsp").include(request, response);
            String err=ex.getLocalizedMessage();
            String outstr= "<h3 class='save_err'>Register Failed!  "+ err+ "</h3>";
            out.print(outstr);
            
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

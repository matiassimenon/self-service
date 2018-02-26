/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.controller;

import com.selfservice.model.Request;
import com.selfservice.model.User;
import com.selfservice.servers.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Actions in history.jsp
 * @author aiming
 */
public class HistoryServlet extends HttpServlet {

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
        List<Request> list = new ArrayList<>();
        try {
            con = DbConnection.getConnection();
            User user = (User) request.getSession().getAttribute("user");
            String username = user.getUsername();
            String page = request.getQueryString();

            String sql = "select req.request_date, req.request_status, temp.template_name, req.salesforce_case, req.username from REQUEST req, TEMPLATE temp where req.template_uuid= temp.template_uuid";
            sql = sql + " and req.username='" + username + "'";

            if (page != null) {
                //MyPrvious request
                if (page.contains("previousRequestList")) {
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                    sql = sql + " and req.request_date < '" + df.format(new Date()) + "'";
                }               
            }
            //Search Request
            String sTxt = request.getParameter("search");
            if (sTxt != null && sTxt.length() > 0) {

                sql = sql + " and ( template_name like '%" + sTxt + "%' or req.salesforce_case like '%" + sTxt + "%' or request_status like '%" + sTxt + "%' )";
            }
            //add order
            sql = sql + " order by last_edit DESC";
            System.out.println("history sql-->" + sql);

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Request object = new Request();

                object.setRequest_date(rs.getDate(1));
                object.setRequest_status(rs.getString(2));
                object.setImagename(rs.getString(3));
                object.setSalesforce_case(rs.getString(4));
                object.setUsername(rs.getString(5));

                list.add(object);
            }
            request.setAttribute("historyList", list);
            request.getRequestDispatcher(page).include(request, response);
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
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

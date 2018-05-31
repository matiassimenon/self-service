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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Actions in history.jsp
 *
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
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Request> list = new ArrayList<>();
        try {
            con = DbConnection.getConnection();
            User user = (User) request.getSession(false).getAttribute("user");
            String username = user.getUsername();
            String typeString = request.getQueryString();
            String type = request.getParameter("type");

            String sql = "select req.request_date, req.request_status, temp.template_name, req.salesforce_case, req.username, temp.template_uuid from REQUEST req INNER JOIN TEMPLATE temp on req.template_uuid= temp.template_uuid and req.username = temp.username ";

            if ((typeString != null && typeString.contains("previousRequest")) || (type != null && type.contains("previousRequest"))) {//MyPrvious request

                sql = sql + " and req.username='" + username + "'";
                type = "previousRequest";
            } else {
                type = "historyList";
            }
            //Search Request
            String sTxt = request.getParameter("search");
            if (sTxt != null && sTxt.length() > 0) {
                sql = sql + " and ( template_name like '%" + sTxt + "%' or req.salesforce_case like '%" + sTxt + "%' or req.username like '%" + sTxt + "%' or request_status like '%" + sTxt + "%' )";
            }
            //add order
            sql = sql + " order by request_date DESC";
            //add paging sql
            int page = 1; //current page;
            int recordsPerPage = 12;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            int beginIndex = (page - 1) * recordsPerPage;

            String pageSql = "select o.* from (" + sql + ") o limit " + beginIndex + ", " + recordsPerPage;
            ps = con.prepareStatement(pageSql);
            rs = ps.executeQuery();
            System.out.println("history sql-->" + sql);
            while (rs.next()) {
                Request object = new Request();
                object.setRequest_date(rs.getDate(1));
                object.setRequest_status(rs.getString(2));
                object.setImagename(rs.getString(3));
                object.setSalesforce_case(rs.getString(4));
                object.setUsername(rs.getString(5));
                object.setTemplate_uuid(rs.getString(6));
                list.add(object);
            }
            request.setAttribute("historyList", list);

            rs.close();
            ps.close();
            //get thet total count
            String totalSql = "select count(*) from (" + sql + ") o";
            ps = con.prepareStatement(totalSql);
            rs = ps.executeQuery();
            int total = 0;
            if (rs.next()) {
                total = rs.getInt(1);
            }
            rs.close();
            ps.close();
            //setup the paging attribute
            int noOfPages = (int) Math.ceil(total * 1.0 / recordsPerPage);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            //set back the type: historyList or previousRequestList
            request.setAttribute("type", type);
            request.getRequestDispatcher("historyList.jsp").forward(request, response);
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

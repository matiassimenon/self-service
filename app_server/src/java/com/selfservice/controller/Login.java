package com.selfservice.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.selfservice.model.User;
import com.selfservice.util.SFUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Login action in login.jsp
 *
 * @author aiming
 */
public class Login extends HttpServlet {

    /**
     *
     */
    private static final long serialVersiowenUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        password = SFUtils.getSecurePassword(password);
        List<User> list = new ArrayList<>(); //take a list
        try {
            list = UserHelper.getUsers(username);
        } catch (SQLException ex) {
            req.setAttribute("errMessage", ex.getMessage());
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        try {

            if (!(list.isEmpty())) {
                User user = null;
                for (User user1 : list) {
                    if (user1.getPassword().equals(password)) {
                        user = user1;
                        user.setPassword("");
                        break;
                    }
                }
                if (user == null) {//password is not correct
                    req.setAttribute("errMessage", "Login failed: Password is invalid!");
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                    return;
                }
                req.getSession(false).setAttribute("user", user);
                //setup session timeout, never timeout
                //req.getSession(false).setMaxInactiveInterval(-1);
                req.getRequestDispatcher("userProfile.jsp").forward(req, resp);

            } else {
                req.setAttribute("errMessage", "User Does Not Exist! <a href='register.jsp'>Register Here</a>");
                //if no values are found then the User does not exist
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            String err = e.getMessage();
            String errmsg =  err;
            req.setAttribute("errMessage", errmsg);
            req.getRequestDispatcher("login.jsp").forward(req, resp);

            // out.print(errmsg);
        }
    }

}

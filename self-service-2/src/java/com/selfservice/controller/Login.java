package com.selfservice.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.selfservice.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Login action in login.jsp
 *
 * @author francisco
 */
public class Login extends HttpServlet {

    /**
     *
     */
    private static final long serialVersiowenUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        try {

            String username = req.getParameter("username");
            String password = req.getParameter("password");

            List<User> list = new ArrayList<>(); //take a list
            list = UserLoginValidate.getUsers(username); //send the values user_name and password to vadlidate class of getUsers method and storing the resultset in list
            if (!(list.isEmpty())) {
                User user = null;
                for (User user1 : list) {
                    if (user1.getPassword().equals(password)) {
                        user = user1;
                    }
                }
                if (user == null) {//password is not correct
                    req.getRequestDispatcher("login.jsp").include(req, resp);
                    out.print("<p  class='save_err' >Login failed! Password is invalid!");
                    return;
                }
                req.getSession().setAttribute("user", user);

                req.getRequestDispatcher("userProfile.jsp").include(req, resp);

            } else {
                //if no values are found then the User does not exist
                req.getRequestDispatcher("login.jsp").include(req, resp);
                out.print("<p  class='save_err' >User Does Not Exist!");
                out.print("<a href='register.jsp'>Register Here</a></p>");
            }
        } catch (Exception e) {
            req.getRequestDispatcher("login.jsp").include(req, resp);
            String err = e.getMessage();
            String errmsg = "<p class='save_err'>Login failed! " + err + "</p>";
            out.print(errmsg);

        }
    }

}

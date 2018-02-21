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
import javax.servlet.http.Cookie;

/**
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

            User pObject = new User(username, password);

            //pObject.setUsername(username);  //setting them to setters and getters
            //pObject.setPass(password);
            List<User> list = new ArrayList<>(); //take a list

            list = UserLoginValidate.getUsers(username, password); //send the values user_name and password to vadlidate class of getUsers method and storing the resultset in list
            if (!(list.isEmpty())) {                   
                    Utility.addUserToCookie(resp, username); 
                    User user=list.get(0);                   
                    req.getSession().setAttribute("user", user);
                    
                    if(user.getAdmin()){
                        req.getRequestDispatcher("adminProfile.jsp").include(req, resp);
                    }else{
                        req.getRequestDispatcher("regularUserProfile.jsp").include(req, resp);
                    }
                    
//                //if list has some values then you are logged in
//                out.print("<h1 align='center'>Successful Log In</h1>");
//                out.print("<table align ='center' border='1' cellspacing='5' cellpadding='5'><tr><th>ID</th><th>NAME</th><th>Password</th><th>Email</th></tr>");
//                for (User i : list) {
//                    //printing all the values in the list
//                    out.print("<td>" + i.getUsername() + "</td>");
//                    out.print("<td>" + i.getPassword() + "</td>");
//                }
//                out.print("</table>");

            } else {
                //if no values are found then the User does not exist
                req.getRequestDispatcher("login.jsp").include(req, resp);
                out.print("<p  class='save_err' >User Does Not Exist!");
                out.print("<a href='register.jsp'>Register Here</a></p>");
            }
        } catch (Exception e) {
            req.getRequestDispatcher("login.jsp").include(req, resp);
            String err=e.getMessage();
            String errmsg= "<p class='save_err'>Login failed! "+ err + "</p>";
            out.print(errmsg);
//executes when user enters invalid details

        }
    }

}

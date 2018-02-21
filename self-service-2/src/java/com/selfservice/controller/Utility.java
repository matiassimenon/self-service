/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aiming
 */
public class Utility {
    public static final String USER="user";
    /**
     *  Get the username from the cookie
     * @param request
     * @return 
     */
    public static String getUserName(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
    	if(cookies != null){
    	for(Cookie cookie : cookies){
    		if(cookie.getName().equals(USER)){
    			return cookie.getValue();
    			
    		}
    	}
    	}
        return null;
    }
    /**
     * Add user to cookie for validation
     * @param resp
     * @param username 
     */
    public static void addUserToCookie(HttpServletResponse resp, String username){
            Cookie loginCookie = new Cookie(USER,username);
            //setting cookie to expiry in 30 mins
            loginCookie.setMaxAge(30*60);            
            resp.addCookie(loginCookie);
            
    }
}

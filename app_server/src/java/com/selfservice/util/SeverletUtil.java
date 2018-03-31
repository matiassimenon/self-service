/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.util;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author zqin
 */
public class SeverletUtil {
    public static String getProjectContextUrl(HttpServletRequest request) {
        
        StringBuilder url = new StringBuilder();
        if (request != null) {
            url.append(request.getScheme()).append("://").append(request.getServerName());
            if (request.getServerPort() != 80 && request.getServerPort() != 443) {
                url.append(":").append(request.getServerPort());
            }
            
            url.append(request.getContextPath());
        }
        
        return url.toString();
    }
    
    public static String getFullUrl(HttpServletRequest request) {
        StringBuilder url = new StringBuilder();
        if (request != null) {
            String servletPath = request.getServletPath();
            String pathInfo = request.getPathInfo();
            String queryString = request.getQueryString(); 
            url.append(getProjectContextUrl(request)).append(servletPath);
            if (pathInfo != null) {
                 url.append(pathInfo);
            }
             if (queryString != null) {
                 url.append("?").append(queryString);
            }       
        }
        
        return url.toString();
    }
}

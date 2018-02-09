/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.servers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author francisco
 */
@WebServlet(name = "DbConnection", urlPatterns = {"/DbConnection"})
public class DbConnection extends HttpServlet {
	public static Connection getConnection() throws SQLException{ //making a static connection,shares to all classes
		Connection con=null; // creating connection
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://104.196.137.158:3306/self_service_db?useSSL=false","TALEND_USER","TALEND_USER/talend123!");
						
		} catch (ClassNotFoundException | SQLException e) {
			con.close();
			//throws an error if at all its unable to create an connection
			System.out.println(e);
		}	
		return con; // we return the connection and we can get the connection wherever needed.
	}		
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.servers;

import com.selfservice.util.FileUtil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author francisco
 */
@WebServlet(name = "DbConnection", urlPatterns = {"/DbConnection"})
public class DbConnection   {
    
    
	public static Connection getConnection() throws SQLException{ //making a static connection,shares to all classes
		Connection con=null; // creating connection
		try {
                    //get the db connection from the configuration.properties file
                    Properties p = FileUtil.getProperties("/configuration.properties");
                    String dburl=p.getProperty("database.url");
                    String dbdriver=p.getProperty("database.driver");
                    String dbuser=p.getProperty("database.username");
                    String dbpasswd=p.getProperty("database.password");
                    
                    Class.forName(dbdriver);
                    con=DriverManager.getConnection(dburl,dbuser,dbpasswd);

		} catch (ClassNotFoundException | SQLException e) {
			con.close();
			//throws an error if at all its unable to create an connection
			System.out.println(e);
		}	
		return con; // we return the connection and we can get the connection wherever needed.
	}		
}

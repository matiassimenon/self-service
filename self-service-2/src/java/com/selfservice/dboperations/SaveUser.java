/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.dboperations;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.selfservice.servers.DbConnection;
import com.selfservice.model.User;
import java.sql.SQLException;
/**
 *
 * @author francisco
 */
public class SaveUser {

	public static int save(User pObject){
		int flag=0;
		try {
			Connection con=DbConnection.getConnection(); //getting the connection method here from dbconnection
                        // INSERT INTO `self_service_db`.`USER` (`email`, `username`, `department`, `admin`, `eng_type`, `city`, `firstname`, `lastname`, `password`, `region`) 
                        // VALUES ('fgalindo@talend.com', 'fgalindo', 'rnd', '1', 'devops', 'atl', 'francisco', 'galindo', 'password', 'US');
			PreparedStatement ps = con.prepareStatement("insert into self_service_db.USER values(?,?,?,?,?,?,?,?,?);");
                        ps.setString(1, pObject.getFirstname());
			ps.setString(2, pObject.getLastname());
                        ps.setString(3, pObject.getUsername());//sending up the values received from user to the database table
                        ps.setString(4, pObject.getEmail());
			ps.setString(5, pObject.getDepartment());
                        ps.setString(6, pObject.getCity());
                        ps.setString(7, pObject.getPassword());
                        ps.setString(8, pObject.getRegion());
                        ps.setBoolean(9, pObject.getAdmin());
			flag=ps.executeUpdate(); //value changes if it is executed
			con.close();
		} catch (SQLException e) {
		System.out.println(e);
		}
		return flag; // returns greater than zero if inserted into database
	}	
}

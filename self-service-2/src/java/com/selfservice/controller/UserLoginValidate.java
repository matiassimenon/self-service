package com.selfservice.controller;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.selfservice.servers.DbConnection;

import com.selfservice.model.User;


/**
 *
 * @author francisco
 */
public class UserLoginValidate {
	public static List<User> getUsers(String username, String password){		
		List<User>list = new ArrayList<>();
		//take a list to store the values which are in db
		 try{  
			Connection con=DbConnection.getConnection();  
			PreparedStatement ps=con.prepareStatement("select * from self_service_db.USER where username=? and password=?"); 
			ps.setString(1,username);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){  				
				User pObject=new User(); 
				pObject.setUsername(rs.getString(1)); //if the values exist in db then											
				pObject.setPassword(rs.getString(2));     // set them to setters and getters,then to list, and finally return the list
				list.add(pObject);
			}  
			con.close();  
		}catch(Exception ex){ex.printStackTrace();}  		  
		return list;  //returns the list		
	}
}
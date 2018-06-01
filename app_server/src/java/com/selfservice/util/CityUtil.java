/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.util;

import java.util.HashMap;

/**
 *
 * @author aiming
 */
public class CityUtil {
    public static  HashMap<String,String> cityMap =new HashMap<>();
    static {
        cityMap.put("blr", "Bangalore");
	cityMap.put("bjs", "Beijing");
	cityMap.put("sin", "Singapore");
	cityMap.put("swz", "Sydney");
	cityMap.put("tyo", "Tokyo");
	
	cityMap.put( "atl","Atlanta");
	cityMap.put( "bos","Boston");
	cityMap.put( "irv","Irvine");
	cityMap.put( "rwc","Redwood City");
	cityMap.put( "yul","Montreal");
	
	cityMap.put( "lhr","Maidenhead");
	cityMap.put( "bcn","Barcelona");
	cityMap.put( "cgn","Bonn");
	cityMap.put( "grz","Feldkirchen");
	cityMap.put( "nte","Nantes");
	cityMap.put( "nue","Nurnberg");
	cityMap.put( "sur","Suresnes");
	cityMap.put( "zrh","Alpnach");
    }
    
}

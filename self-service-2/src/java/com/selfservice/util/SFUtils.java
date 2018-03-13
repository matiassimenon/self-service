/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.util;


import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

/**
 *
 * @author aiming
 */
public class SFUtils {
    /**
     * return numbers uuid
     * @return 
     */
    public static String getUUID(int num){
        Random rand = new Random(); 
        String number="";
        for(int i=0; i<num; i++){
            number +=rand.nextInt(9);
        }
        return number;
    }
    
    /**
     *  return the time string: morning or afternoon
     * @return 
     */
    public static String getGreetingString(){
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        String meridiem = cal.getDisplayName(Calendar.AM_PM, Calendar.SHORT, Locale.US);
        //System.out.println("meridiem-->"+ meridiem);
        
        return "PM".equals(meridiem)?"afternoon": "morning";
    }
    
    /**
     * The alogrithm is SHA-256
     * @param plainPassowrd
     * @return 
     */
     public static String getSecurePassword(String plainPassowrd)
    {
          return SHA.getSHA256(plainPassowrd.getBytes());
    }
}


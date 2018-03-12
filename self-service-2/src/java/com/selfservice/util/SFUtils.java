/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.util;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
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
     * @param passwordToHash
     * @return 
     */
     public static String getSecurePassword(String passwordToHash)
    {
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(getSalt());
            byte[] bytes = md.digest(passwordToHash.getBytes());
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        return generatedPassword;
    }

    //Add salt
    private static byte[] getSalt() throws NoSuchAlgorithmException
    {
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        return salt;
    }     
}


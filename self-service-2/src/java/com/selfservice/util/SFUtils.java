/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.util;


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
}

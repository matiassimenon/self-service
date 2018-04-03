/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.util;

/**
 *
 * @author aiming
 */
import java.security.MessageDigest;

public class SHA {

    private static final String SHA_256 = "SHA-256";
    private static final char[] HexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    public static String getSHA256(byte[] source) {
        String toReturn = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(source);
            byte[] tmp = md.digest();
            byte element = -1;
            int ind = 0;
            char[] arr = new char[32];
            for (int i = 0; i < 16; i++) {
                element = tmp[i];
                arr[(ind++)] = HexDigits[(element >>> 4 & 0xF)];
                arr[(ind++)] = HexDigits[(element & 0xF)];
            }
            toReturn = new String(arr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toReturn;
    }

    public static String getSHA256(String text) {
        return getSHA256(text.getBytes());
        
    }

    public static void main(String[] args) {
        String s = "password";
        String t = getSHA256(s.getBytes());
        System.out.println(t);
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.selfservice.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author zqin
 */
public class FileUtil {
    
    public static Properties getProperties(String relativePath) {
        Properties properties =new Properties();
        
        if (relativePath != null) {
            InputStream in = FileUtil.class.getResourceAsStream(relativePath);
            try {
                properties.load(in);
                return properties;
            } catch (IOException ex) {
                Logger.getLogger(FileUtil.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return properties;
    }
}

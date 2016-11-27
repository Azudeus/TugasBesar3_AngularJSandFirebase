/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.session;

import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author user
 */
public class TokenMap {
    public static HashMap<String,Date> hmap = new HashMap();
    
    public static void insertMap(String key, Date value) {
         hmap.put(key,value);
    }
    
    public static Date findMapByKey(String key) {
        return hmap.get(key);
    }
    
        
    
    
}

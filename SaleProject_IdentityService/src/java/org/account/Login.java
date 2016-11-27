/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.account;

import java.sql.*;

/**
 *
 * @author Personal
 */
import java.util.logging.Level;
import java.util.logging.Logger;
public class Login {

    public static boolean checkUser(String email, String password) {
        boolean st=false;
        try {            
            //loading drivers for mysql
            Connection con = DBConnect.connect();

            PreparedStatement ps =con.prepareStatement
                ("select * from account where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs =ps.executeQuery();
            st = rs.next();         
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return st;
    }
    
    public static Integer findUserId(String email, String password) {
        int ret = 0;
        try {      
            //loading drivers for mysql
            Connection con = DBConnect.connect();

            PreparedStatement ps =con.prepareStatement
                ("select account_id from account where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs =ps.executeQuery();
            if (rs.next()){
                ret = rs.getInt("account_id");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
    }
    
    public static String findUsernamebyId(int id) {
        String ret ="";
        try {
            Connection con = DBConnect.connect();
            PreparedStatement ps = con.prepareStatement
                    ("select username from account where account_id=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                ret = rs.getString("username");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
    }
    
       
}

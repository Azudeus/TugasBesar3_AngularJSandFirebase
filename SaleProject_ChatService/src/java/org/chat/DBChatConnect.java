/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Personal
 */
public class DBChatConnect {
    final static String JDBC_DRIVER="com.mysql.jdbc.Driver";
    final static String DB_URL="jdbc:mysql://localhost/salechat";
    final static String USER = "root";
    final static String PASS = "";
    
    public static Connection connect() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(DB_URL,USER,PASS);
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.chat;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;
import org.json.JSONObject;
import java.util.List;
import java.util.Map;
import java.util.Set;


/**
 *
 * @author Personal
 */
public class FBSendMessage {
    public static void executePost(String username,String text) {
  HttpURLConnection connection = null;

  try {
    //Create connection
    URL url = new URL("https://fcm.googleapis.com/fcm/send");
    connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("POST");
    connection.setRequestProperty("Content-Type", 
        "application/json");
    connection.setRequestProperty("Authorization", 
        "key=AIzaSyACwFde7PJEWwVbpt3o1i8atKeVtlCvN_M");
    
    JSONObject message = new JSONObject();
    String key_send = "key=";
    key_send=searchFBToken(username);
    message.put("to",key_send);
    //message.put("priority","high");
 
    JSONObject content = new JSONObject();
    content.put("title", username);
    content.put("text",text);
    message.put("notification",content);
    
    
    connection.setUseCaches(false);
    connection.setDoOutput(true);

    //Send request
    DataOutputStream wr = new DataOutputStream (
        connection.getOutputStream());
    wr.writeBytes(message.toString());
    System.out.println(message.toString());
//    System.out.println(wr);
    wr.close();


    
    System.out.println("success");
    //Get Response  
    InputStream is = connection.getInputStream();
    BufferedReader rd = new BufferedReader(new InputStreamReader(is));
    StringBuilder response = new StringBuilder(); // or StringBuffer if Java version 5+
    String line;
    while ((line = rd.readLine()) != null) {
      response.append(line);
      response.append('\r');
    }
    rd.close();
    System.out.println(response.toString());

  } catch (IOException | NullPointerException e) {
        e.printStackTrace();
  } finally {
    if (connection != null) {
      connection.disconnect();
    }
  }
}
    public static String searchFBToken(String username){
        String ret = "";
        try{
            Connection con = DBChatConnect.connect();
            PreparedStatement ps =con.prepareStatement
                    ("SELECT * FROM registry WHERE username=?");
            ps.setString(1,username);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                ret = res.getString("fbtoken");
            }else {
                System.out.println("Error");
            }
        } catch(ClassNotFoundException | SQLException ex) {

        }
        return ret;
    }
    
    
}

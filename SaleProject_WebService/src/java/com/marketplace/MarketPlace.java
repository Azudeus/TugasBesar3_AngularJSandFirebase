
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplace;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import com.marketplace.product;
import java.sql.*;
import java.util.*;

/**
 *
 * @author user
 */
@WebService(serviceName = "MarketPlace")
public class MarketPlace {
    private Connection conn;
    private String url;
    private String dbName;
    private String driver;
    private String userName;
    private String password;

    
     private void initialize(String password){
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        this.password = password;
        
    }
    
    private void initialize(String username, String password){
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = username;
        this.password = password;
      
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetAllProduct")
    public List<product> GetAllProduct() {
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";
        List<product> allProduct = new ArrayList<product>();
       

                 try {
              Class.forName(driver).newInstance();
              conn = DriverManager.getConnection(url+dbName,userName,password);
              System.out.println("Connected to the database");
              Statement stmt=conn.createStatement();  
              ResultSet rs=stmt.executeQuery("select * from product");
          
              while(rs.next()){
                product temp = new product();
                temp.product_id =rs.getInt("product_id");
                 System.out.println(temp.product_id);
                temp.product_name = rs.getString("product_name");
                temp.username = rs.getString("username");
                temp.product_description = rs.getString("product_description");
                temp.product_price = rs.getDouble("product_price");
                temp.likes=rs.getInt("likes");
                temp.purchase = rs.getInt("purchase");
                temp.product_datetime = rs.getString("product_datetime");
                temp.imgsrc = rs.getString("imgsrc");
                
                System.out.println(temp.product_datetime);
                allProduct.add(temp);      
              } 
              conn.close();
              return allProduct;
            } catch (Exception e) {
                System.out.println(e);                
            }
            return null;
    }
    
     public List<product> SearchProductWithAccount(String username){
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";
        List<product> allProduct = new ArrayList<product>();
        
            try {
              Class.forName(driver).newInstance();
              conn = DriverManager.getConnection(url+dbName,userName,password);
              System.out.println("Connected to the database");
              Statement stmt=conn.createStatement();  
              ResultSet rs=stmt.executeQuery("select * from product where username like '" + username + "';");
          
              while(rs.next()){
                product temp = new product();
                temp.product_id =rs.getInt("product_id");
                 System.out.println(temp.product_id);
                temp.product_name = rs.getString("product_name");
                temp.username = rs.getString("username");
                temp.product_description = rs.getString("product_description");
                temp.product_price = rs.getDouble("product_price");
                temp.likes=rs.getInt("likes");
                temp.purchase = rs.getInt("purchase");
                temp.product_datetime = rs.getString("product_datetime");
                temp.imgsrc = rs.getString("imgsrc");
                allProduct.add(temp);      
              } 
              conn.close();
              return allProduct;
            } catch (Exception e) {
                
                
                
            }
            return null;
         
     }
     
           public List<product> SearchProductWithProductName(String productname){
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";
        List<product> allProduct = new ArrayList<product>();
        
            try {
              Class.forName(driver).newInstance();
              conn = DriverManager.getConnection(url+dbName,userName,password);
              System.out.println("Connected to the database");
              Statement stmt=conn.createStatement();  
              ResultSet rs=stmt.executeQuery("select * from product where product_name like '%" + productname + "%';");
          
              while(rs.next()){
                product temp = new product();
                temp.product_id =rs.getInt("product_id");
                 System.out.println(temp.product_id);
                temp.product_name = rs.getString("product_name");
                temp.username = rs.getString("username");
                temp.product_description = rs.getString("product_description");
                temp.product_price = rs.getDouble("product_price");
                temp.likes=rs.getInt("likes");
                temp.purchase = rs.getInt("purchase");
                temp.product_datetime = rs.getString("product_datetime");
                temp.imgsrc = rs.getString("imgsrc");
                allProduct.add(temp);      
              } 
              conn.close();
              return allProduct;
            } catch (Exception e) {
                System.out.println(e);
                
                
            }
            return null;
         
     }
     
     public product SearchProductWithProductId(int productId){
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";
 
        
            try {
              Class.forName(driver).newInstance();
              conn = DriverManager.getConnection(url+dbName,userName,password);
              System.out.println("Connected to the database");
              Statement stmt=conn.createStatement();  
              ResultSet rs=stmt.executeQuery("select * from product where product_id =" + productId  +";");
          
              while(rs.next()){
                product temp = new product();
                temp.product_id =rs.getInt("product_id");
                 System.out.println(temp.product_id);
                temp.product_name = rs.getString("product_name");
                temp.username = rs.getString("username");
                temp.product_description = rs.getString("product_description");
                temp.product_price = rs.getDouble("product_price");
                temp.likes=rs.getInt("likes");
                temp.purchase = rs.getInt("purchase");
                temp.product_datetime = rs.getString("product_datetime");
                temp.imgsrc = rs.getString("imgsrc");
                return temp;
              } 
              conn.close();
            
            } catch (Exception e) {
                System.out.println(e);
                
                
            }
            return null;
         
     }
      
    public account GetAccWithAccountId(int accountId){
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleAccount";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";
 
        
            try {
              Class.forName(driver).newInstance();
              conn = DriverManager.getConnection(url+dbName,userName,password);
              System.out.println("Connected to the database");
              Statement stmt=conn.createStatement();  
              ResultSet rs=stmt.executeQuery("select * from account where account_id =" + accountId  +";");
          
              while(rs.next()){
                account temp = new account();
                temp.account_id =rs.getInt("account_id");
                temp.username = rs.getString("username");
                temp.email = rs.getString("email");
                temp.password = rs.getString("password");
                temp.name = rs.getString("name");
                temp.address = rs.getString("address");
                temp.postal=rs.getInt("postal");
                temp.number=rs.getInt("number");
                return temp;
              } 
              conn.close();
            
            } catch (Exception e) {
                System.out.println(e);
                
                
            }
            return null;
         
     }
     

    /**
     * Web service operation
     */
    @WebMethod(operationName = "CheckLike")
    public int CheckLike(int productId, int accountId) {
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";

        
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+dbName,userName,password);
            System.out.println("Connected to the database");
            Statement stmt=conn.createStatement();  
            ResultSet rs=stmt.executeQuery("SELECT EXISTS(SELECT * FROM likes where product_id ="+ productId +" and account_id =" + accountId + ") as exist;");
            while(rs.next()){
                return rs.getInt("exist");
            }
            
            

        } catch (Exception e){
            
            
        }
        
        //TODO write your implementation code here:
        return -1;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "AddLike")
    public int AddLike(int productId ,int accountId ) {
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";
         if(CheckLike(productId,accountId) == 1){
             try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+dbName,userName,password);
            System.out.println("Connected to the database");
            Statement stmt=conn.createStatement();  
         
            int rs=stmt.executeUpdate("UPDATE product SET likes = likes + 1 WHERE product_id =" + productId +";");
            
            rs=stmt.executeUpdate("INSERT INTO likes(product_id, account_id) VALUES ("+ productId + ","+ accountId + ");");
            return 1;
            

        } catch (Exception e){
            return 0;
            
        }
       }
         
        return 0;
    }
    @WebMethod(operationName = "DelLike")
    public int DelLike(int productId ,int accountId ) {
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";
              
         try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+dbName,userName,password);
            System.out.println("Connected to the database");
            Statement stmt=conn.createStatement();  
           
            int rs=stmt.executeUpdate("UPDATE product SET likes = likes - 1 WHERE product_id =" + productId +";");
            
            rs=stmt.executeUpdate("DELETE FROM likes where product_id = "+ productId + " and account_id = "+ accountId + ";");
            return 1;
            

        } catch (Exception e){
            return 0;
            
        }
        
    }
    
    @WebMethod(operationName = "AddPurchase")
    public int AddPurchase(String productId ,String accountId, String consignee, String full_address, String postal_code, String phone_number, String credit_number, String credit_veri, String quantity, String product_name, String product_username, String product_description, String product_price,String imgsrc) {
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";
              
         try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+dbName,userName,password);
            System.out.println("Connected to the database");
            Statement stmt=conn.createStatement();  
            int rs=stmt.executeUpdate("INSERT INTO purchases(product_id,account_id, consignee ,full_address,postal_code,phone_number,credit_number,credit_veri,quantity,product_name,product_username,product_description,product_price,imgsrc)  VALUES ("+ productId + ","+ accountId + ",'" + consignee +  "', '" + full_address +"','"+ postal_code +"','" + phone_number + "','"+ credit_number +"',"+ credit_veri +","+quantity +",'"+ product_name +"','"+ product_username +"','" + product_description+ "',"+product_price+",'"+ imgsrc+"'); ");
            rs=stmt.executeUpdate("UPDATE product SET purchase = purchase + 1 WHERE product_id =" + productId +";");
           // System.out.println("INSERT INTO purchases(product_id,account_id, consignee ,full_address,postal_code,phone_number,credit_number,credit_veri,quantity,product_name,product_username,product_description,product_price,imgsrc) VALUES ("+ productId + ","+ accountId + ",'" + consignee +   "', '" + full_address +"','"+ postal_code +"','" + phone_number + "','"+ credit_number +"',"+ credit_veri +","+quantity +",'"+ product_name +"','"+ product_username +"','" + product_description+ "',"+product_price+"); ");
            return 1;
            

        } catch (Exception e){
            System.out.println(e);
            return 0;
            
        }
        
    }
    
    public List<purchases> GetPurchase(int account_id) {
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";
        List<purchases> allPurchase = new ArrayList<purchases>();
        
            try {
              Class.forName(driver).newInstance();
              conn = DriverManager.getConnection(url+dbName,userName,password);
              System.out.println("Connected to the database");
              Statement stmt=conn.createStatement();  
              ResultSet rs=stmt.executeQuery("select * from purchases where account_id = " + account_id + ";");
          
              while(rs.next()){
                purchases temp = new purchases();
                temp.purchase_id =rs.getInt("purchase_id");
                temp.product_id =rs.getInt("product_id");
                temp.account_id =rs.getInt("account_id");
                temp.consignee = rs.getString("consignee");
                temp.full_address = rs.getString("full_address");
                temp.postal_code = rs.getString("postal_code");
                temp.phone_number =rs.getString("phone_number");
                temp.credit_number = rs.getString("credit_number");
                temp.credit_veri = rs.getInt("credit_veri");
                temp.quantity = rs.getInt("quantity");
                temp.product_name = rs.getString("product_name");
                temp.product_description = rs.getString("product_description");
                temp.product_price =rs.getInt("product_price");
                temp.username = rs.getString("product_username");
                temp.purchase_datetime = rs.getString("purchase_datetime");
                temp.imgsrc = rs.getString("imgsrc");
             
                System.out.println(temp.product_price);
                allPurchase.add(temp);      
              } 
              conn.close();
              return allPurchase;
            } catch (Exception e) {
                System.out.println(e);
                
                
            }
            return null;
    }
    
    public List<purchases> GetPurchaseByName (String username) {
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";
        List<purchases> allPurchase = new ArrayList<purchases>();
        
            try {
              Class.forName(driver).newInstance();
              conn = DriverManager.getConnection(url+dbName,userName,password);
              System.out.println("Connected to the database");
              Statement stmt=conn.createStatement();  
              ResultSet rs=stmt.executeQuery("select * from purchases where product_username like '"+ username +"';");
          
              while(rs.next()){
                purchases temp = new purchases();
                temp.purchase_id =rs.getInt("purchase_id");
                temp.product_id =rs.getInt("product_id");
                temp.account_id =rs.getInt("account_id");
                temp.consignee = rs.getString("consignee");
                temp.full_address = rs.getString("full_address");
                temp.postal_code = rs.getString("postal_code");
                temp.phone_number =rs.getString("phone_number");
                temp.credit_number = rs.getString("credit_number");
                temp.credit_veri = rs.getInt("credit_veri");
                temp.quantity = rs.getInt("quantity");
                temp.product_name = rs.getString("product_name");
                temp.product_description = rs.getString("product_description");
                temp.product_price =rs.getInt("product_price");
                temp.username = rs.getString("product_username");
                temp.purchase_datetime = rs.getString("purchase_datetime");
                temp.imgsrc = rs.getString("imgsrc");
             
                allPurchase.add(temp);      
              } 
              conn.close();
              return allPurchase;
            } catch (Exception e) {
                System.out.println(e);
                
                
            }
            return null;
    }
    
    
     public int AddProduct(String product_name ,String username, String product_description, String product_price, String imgsrc) {
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";
              
         try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+dbName,userName,password);
            System.out.println("Connected to the database");
            Statement stmt=conn.createStatement();  
            int rs=stmt.executeUpdate("insert into product (product_name,username,product_description,product_price,likes,purchase,imgsrc)" +
"values ('"+product_name+"','"+ username + "','"+ product_description +"',"+product_price+",0,0,'" +imgsrc +"');");
           // System.out.println("INSERT INTO purchases(product_id,account_id, consignee ,full_address,postal_code,phone_number,credit_number,credit_veri,quantity,product_name,product_username,product_description,product_price,imgsrc) VALUES ("+ productId + ","+ accountId + ",'" + consignee +   "', '" + full_address +"','"+ postal_code +"','" + phone_number + "','"+ credit_number +"',"+ credit_veri +","+quantity +",'"+ product_name +"','"+ product_username +"','" + product_description+ "',"+product_price+"); ");
            return 1;
            

        } catch (Exception e){
            System.out.println(e);
            return 0;
            
        }
        
    }
     
     public int DelProduct (String product_id){
            conn = null;
            url = "jdbc:mysql://localhost:3306/";
            dbName = "SaleProject";
            driver = "com.mysql.jdbc.Driver";
            userName = "root";
            password = "";
            
            try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+dbName,userName,password);
            System.out.println("Connected to the database");
            Statement stmt=conn.createStatement();  
            int rs=stmt.executeUpdate("delete from product where product_id = " + product_id +";" );
           // System.out.println("INSERT INTO purchases(product_id,account_id, consignee ,full_address,postal_code,phone_number,credit_number,credit_veri,quantity,product_name,product_username,product_description,product_price,imgsrc) VALUES ("+ productId + ","+ accountId + ",'" + consignee +   "', '" + full_address +"','"+ postal_code +"','" + phone_number + "','"+ credit_number +"',"+ credit_veri +","+quantity +",'"+ product_name +"','"+ product_username +"','" + product_description+ "',"+product_price+"); ");
            return 1;
            

        } catch (Exception e){
            System.out.println(e);
            return 0;
            
        }
            
            

              
        
        
        
        
        }

        public int EditProduct(String product_id, String product_name , String product_description, String product_price, String imgsrc) {
        conn = null;
        url = "jdbc:mysql://localhost:3306/";
        dbName = "SaleProject";
        driver = "com.mysql.jdbc.Driver";
        userName = "root";
        password = "";
              
         try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+dbName,userName,password);
            System.out.println("Connected to the database");
            Statement stmt=conn.createStatement();
            
            
//            int rs=stmt.executeUpdate("UPDATE product SET likes = likes + 1 WHERE product_id =" + productId +";");
            

            int rs=stmt.executeUpdate("UPDATE product SET product_name = '"+ product_name + "' where product_id = " + product_id + ";");
            rs=stmt.executeUpdate("UPDATE product SET product_description = '"+ product_description + "' where product_id = " + product_id + ";");
            rs=stmt.executeUpdate("UPDATE product SET product_price = '"+ product_price + "' where product_id = " + product_id + ";");
           return 1;
            

        } catch (Exception e){
            System.out.println(e);
            return 0;
            
        }
        
    }

}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplace;

import java.sql.Date;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
//import java.util.Date;


/**
 *
 * @author user
 */

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Product")
public class product {
    @XmlElement(name = "product_id")
    public int product_id;
    @XmlElement(name = "product_name")
    public String product_name;
    @XmlElement(name = "username")
    public String username;
    @XmlElement(name = "product_description")
    public String product_description;
    @XmlElement(name = "product_price")
    public double product_price;
    @XmlElement(name = "likes")
    public int likes;
    @XmlElement(name = "purchase")
    public int purchase;
    @XmlElement(name = "product_datetime")
    public String product_datetime;
    @XmlElement(name = "imgsrc")
    public String imgsrc;
    
    public product(){
        //donothing
    }
    
    public product(int id, String name, String username, String desc, 
            double price, String imgsrc){
        product_id = id;
        product_name = name;
        this.username = username;
        product_description = desc;
        product_price = price;
        likes = 0;
        purchase = 0;
        this.imgsrc = imgsrc;
    }
    
    public product(product anotherProduct){
        product_id = anotherProduct.product_id;
        product_name = anotherProduct.product_name;
        username = anotherProduct.username;
        product_description = anotherProduct.product_description;
        product_price = anotherProduct.product_price;
        likes = anotherProduct.likes;
        purchase = anotherProduct.purchase;
        product_datetime = anotherProduct.product_datetime;
        imgsrc = anotherProduct.imgsrc;
    }
}

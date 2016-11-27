/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplace;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author user
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Purchases")
public class purchases {
    @XmlElement(name = "purchase_id")
    public int purchase_id;
    @XmlElement(name = "product_id")
    public int product_id;
    @XmlElement(name = "account_id")
    public int account_id;
    @XmlElement(name = "consignee")
    public String consignee;
    @XmlElement(name = "full_address")
    public String full_address;
    @XmlElement(name = "postal_code")
    public String postal_code;
    @XmlElement(name = "phone_number")
    public String phone_number;
    @XmlElement(name = "credit_number")
    public String credit_number;
    @XmlElement(name = "credit_veri")
    public int credit_veri;
    @XmlElement(name = "quantity")
    public int quantity;
    @XmlElement(name = "product_name")
    public String product_name;
    @XmlElement(name = "username")
    public String username;
    @XmlElement(name = "product_description")
    public String product_description;
    @XmlElement(name = "product_price")
    public int product_price;
    @XmlElement(name = "purchase_datetime")
    public String purchase_datetime;
    @XmlElement(name = "imgsrc")
    public String imgsrc;  
}
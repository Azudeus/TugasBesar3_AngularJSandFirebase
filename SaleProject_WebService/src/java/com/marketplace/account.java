
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
@XmlType(name = "Account")
public class account {
    @XmlElement(name = "account_id")
    public int account_id;
    @XmlElement(name = "username")
    public String username;
    @XmlElement(name = "email")
    public String email;
    @XmlElement(name = "password")
    public String password;
    @XmlElement(name = "name")
    public String name;
    @XmlElement(name = "address")
    public String address;
    @XmlElement(name = "postal")
    public int postal;
    @XmlElement(name = "number")
    public int number;
    
}
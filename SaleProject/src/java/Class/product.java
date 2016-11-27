/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;



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
    public int product_datetime;
    @XmlElement(name = "imgsrc")
    public String imgsrc;  
}

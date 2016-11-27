<%-- 
    Document   : catalogsearch
    Created on : Nov 12, 2016, 10:16:06 PM
    Author     : user
--%>

<%@page import="com.marketplace.Account"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.marketplace.Product"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<!DOCTYPE html>
<html>
    <body>
        <%@include file="header.jsp" %>   

        <%-- set variable --%>
        <%
            List<Product> Products;
            int account_id = Integer.parseInt(((String)session.getAttribute("account_id")).trim());        %>
         <%-- start web service invocation --%>
         <%
            Account dummy; 
            com.marketplace.MarketPlace_Service service = new com.marketplace.MarketPlace_Service();
            com.marketplace.MarketPlace port = service.getMarketPlacePort();
            dummy = port.getAccWithAccountId(account_id);
            Products = port.searchProductWithAccount(dummy.getUsername().trim());
        %>
         <%-- end web service invocation --%>

        
        <p id = "SubHeader">What are you going to sell today?</p>
        <hr>        
   
     
         
   

        <% 
              for(int i = 0; i < Products.size(); i++){
                 Product temp = Products.get(i);
       
              
                int CheckLike = port.checkLike(temp.getProductId(), account_id);
                 out.println(
                "<p id = 'product'><b>" + temp.getUsername() +"</b> <br> added this on " + temp.getProductDatetime()  +"<hr>"
                +"<table class = 'producttable'>"
                +"<tr>"
                +"<td rowspan = '5' width = 128px> <img src = 'img/" + temp.getImgsrc() + "' style = 'width:128px;height:128px;' > </td>"
                +"<td colspan = '2'> <span id = 'itemname'>" + temp.getProductName() + "</span></td>"
                +"</tr>"
                +"<tr>"
                +"<td><span id = 'price'> Rp."+ (int)temp.getProductPrice() +"</td>"
                +"<td colspan = '2'> "+ temp.getLikes() +" likes</td>"
                +"</tr>"
                +"<tr>"
                +"<td>" + temp.getProductDescription() + "</td>"
                +"<td colspan ='2'>" + temp.getPurchase() + " Purchases</td>"
                +"</tr>"
                +"<tr height = 22> <td colspan = '3'> </td> </tr>"
                +"<tr>"
                +"<td></td>"
                +"<td class = 'likebuy'> <form action = 'edit.jsp'> <input type='hidden' name='account_id' value=" + account_id +"> <input type='hidden' name='product_id' value="+temp.getProductId()+">"                
                +"<input type='submit' value='edit' class = 'linkButton yellowlink'> </form></td>"                       
                +"<td class = 'likebuy'> <form action = 'delete.jsp'><input type='hidden' name='account_id' value=" + account_id +"> <input type='hidden' name='product_id' value="+temp.getProductId()+">"
                +"<input type='submit' value='delete' class = 'redlink linkButton'></form></td>"
                +"</tr></table><br><hr>"
                 
                 );
             }
        %>
        
        
        
        
        
        
    </body>
</html>

<%-- 
    Document   : purchases
    Created on : Nov 11, 2016, 8:12:50 AM
    Author     : user
--%>

<%@page import="com.marketplace.Account"%>
<%@page import="com.marketplace.Purchases"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
    
        <%-- start web service invocation --%>
    <%
    int account_id = 1;
    List<Purchases> PurchasesList = null;

     
        com.validator.Validator_Service service2 = new com.validator.Validator_Service();
	com.validator.Validator port2 = service2.getValidatorPort();
        int resulta = port2.authToken(token);
	if(resulta == 2 ){
            out.println("<script>alert('token sudah kadaluarsa');</script> ");
            out.println("<form method='post' action='connector.jsp' id='formLogout'>");
            out.println("<input type='hidden' name='title' value='logout'>");
            out.println("<input type='hidden' name='access_token' value="+token+">");
            out.println("</form>");
            out.println("<script>document.forms['formLogout'].submit();</script>"); 
        }
       
    try {
        Account dummy; 
        com.marketplace.MarketPlace_Service service = new com.marketplace.MarketPlace_Service();
        com.marketplace.MarketPlace port = service.getMarketPlacePort();
        dummy = port.getAccWithAccountId(account_id);
   
	PurchasesList = port.getPurchaseByName(dummy.getUsername().trim());
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%>
    <html>
     <p id = "SubHeader">Here are your Sales</p>
        <hr>        
        <br>
    
            <% 
              for(int i = 0; i < PurchasesList.size(); i++){
                 Purchases temp = PurchasesList.get(i);
                 out.println(
                temp.getPurchaseDatetime() +
                "<hr><table class = 'producttable'>"
                +"<tr>"
                +"<td rowspan = '5' width = 128px> <img src = 'img/" + temp.getImgsrc() + "' style = 'width:128px;height:128px;' > </td>"
                +"<td colspan> <span id = 'itemname'>" + temp.getProductName() + "</span></td>"
                +"<td>Delivery to <b>"+ temp.getConsignee() +"</b></td>"
                +"</tr>"
                +"<tr>"
                +"<td><span id = 'price'> Rp."+ (int)temp.getQuantity() * (int)temp.getProductPrice() +"</td>"
                +"<td> "+ temp.getFullAddress() +"</td>"
                +"</tr>"
                +"<tr>"
                +"<td>" + temp.getQuantity() + " pcs</td>"
                +"<td>" + temp.getPostalCode()  + "</td>"
                +"</tr>"
                +"<tr><td> @ "+ temp.getProductPrice() + "  </td> <td>"+ temp.getPhoneNumber()  + " </td> </tr>"
                +"<tr>"
                +"<td>bought from "+ temp.getUsername() +  "</td> <br> <hr>"
                 
                 );
             }
        %>
    </body>
</html>

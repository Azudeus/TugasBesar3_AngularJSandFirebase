<%-- 
    Document   : edit
    Created on : Nov 14, 2016, 3:02:55 PM
    Author     : user
--%>

<%@page import="com.marketplace.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script src="script/validateEdit.js"></script>
               <%@include file="header.jsp" %>   
       
       

        <%-- start web service invocation --%>
         <%
           
        com.validator.Validator_Service service2 = new com.validator.Validator_Service();
	com.validator.Validator port2 = service2.getValidatorPort();
        String userAgent = request.getHeader("User-Agent");
        userAgent = userAgent.replaceAll("\\s","");
        String ipAddress = request.getRemoteAddr();

        int resulta = port2.authToken(token,userAgent,ipAddress);
	if(resulta == 2 ){
            out.println("<script>alert('token sudah kadaluarsa');</script> ");
            out.println("<form method='post' action='connector.jsp' id='formLogout'>");
            out.println("<input type='hidden' name='title' value='logout'>");
            out.println("<input type='hidden' name='access_token' value="+token+">");
            out.println("</form>");
            out.println("<script>document.forms['formLogout'].submit();</script>"); 
        }  
             
           int account_id = Integer.parseInt(((String)session.getAttribute("account_id")).trim());
           int product_id = Integer.parseInt(request.getParameter("product_id"));
      
            Account dummy; 
            com.marketplace.MarketPlace_Service service = new com.marketplace.MarketPlace_Service();
            com.marketplace.MarketPlace port = service.getMarketPlacePort();
            dummy = port.getAccWithAccountId(account_id);
            Product currentProduct = port.searchProductWithProductId(product_id);
        %>
         <%-- end web service invocation --%>
        
        <p id = "SubHeader">Please update your product here</p>
        <form action='edit_action.jsp' method='post' >
        Name <br>
        <input type='text' name='name' id='formField' value='<%out.println(currentProduct.getProductName());  %>'><br><br>
        Description(max 200 chars) <br>
            <textarea rows='3' cols='200' name='description' id='formField'><% out.println(currentProduct.getProductDescription()); %></textarea><br><br>
        Price (IDR)<br>
            <input type='text' name='price' id='formField' value='<% out.println((int)currentProduct.getProductPrice()); %>'><br><br>
        Photo <br>
            <input type ='file' name= 'photochoose'>
            <input type="hidden" name = "product_id" value="<%out.println(product_id);%>">
     <table>
         <div class ="right">
            <input type = "submit" id = "addbutton" class ="button" value ="EDIT"> 
            <input type = "button" id = "cancelbutton" class ="button" value ="CANCEL">
        </div>
     </table>
        </form>
   
    </body>
</html>

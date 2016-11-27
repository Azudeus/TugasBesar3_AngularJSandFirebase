<%-- 
    Document   : likes
    Created on : Nov 13, 2016, 2:33:53 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <body>
        <%
        String token = ((String) session.getAttribute("token")).trim();
     
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
            
        int accountId = Integer.parseInt(request.getParameter("account_id"));
        int productId = Integer.parseInt(request.getParameter("product_id"));
        String type = request.getParameter("type");
//        out.println("account id = " +accountId);
//        out.println("product_id = "+productId);
//        out.println("type = " + type);
        com.marketplace.MarketPlace_Service service = new com.marketplace.MarketPlace_Service();
        com.marketplace.MarketPlace port = service.getMarketPlacePort();
        if(type.equals("add")){
            
            int result = port.addLike(productId,accountId);
        }
        else{
        
            int result = port.delLike(productId,accountId);
        
        }
 
        %>

        
      <% response.sendRedirect("catalog.jsp"); %>

    </body>
</html>

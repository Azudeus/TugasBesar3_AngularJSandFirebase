<%-- 
    Document   : delete
    Created on : Nov 13, 2016, 10:57:00 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%-- start web service invocation --%><hr/>
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
        
    try {
	com.marketplace.MarketPlace_Service service = new com.marketplace.MarketPlace_Service();
	com.marketplace.MarketPlace port = service.getMarketPlacePort();
	 // TODO initialize WS operation arguments here
	java.lang.String arg0 = request.getParameter("product_id");
        
	// TODO process result here
	int result = port.delProduct(arg0);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
    
     <% response.sendRedirect("your_product.jsp"); %>

    </body>
</html>

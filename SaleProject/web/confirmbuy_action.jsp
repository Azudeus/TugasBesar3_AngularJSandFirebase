<%-- 
    Document   : confrimbuy_action
    Created on : Nov 13, 2016, 12:52:07 PM
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
        
    try {
	com.marketplace.MarketPlace_Service service = new com.marketplace.MarketPlace_Service();
	com.marketplace.MarketPlace port = service.getMarketPlacePort();
	 // TODO initialize WS operation arguments here
      out.println("asu");
	 // TODO initialize WS operation arguments here
	java.lang.String arg0 = request.getParameter("product_id");
        java.lang.String arg1 = request.getParameter("account_id");
	java.lang.String arg2 = request.getParameter("consignee");
	
        java.lang.String arg3 = request.getParameter("full_address");
	java.lang.String arg4 = request.getParameter("postal_code");
	java.lang.String arg5 = request.getParameter("phone_number");
	java.lang.String arg6 = request.getParameter("credit_number");
	java.lang.String arg7 = request.getParameter("credit_veri");
	java.lang.String arg8 = request.getParameter("quantity");
	java.lang.String arg9 = request.getParameter("product_name");
	java.lang.String arg10 = request.getParameter("product_username");
	java.lang.String arg11 = request.getParameter("product_description");
	java.lang.String arg12 = request.getParameter("product_price");
	java.lang.String arg13 = request.getParameter("imgsrc");
        
  

	// TODO process result here
	int result = port.addPurchase(arg0.trim(), arg1.trim(), arg2.trim(), arg3.trim(), arg4.trim() ,arg5.trim() ,arg6.trim() ,arg7.trim() ,arg8.trim() ,arg9.trim() ,arg10.trim() ,arg11.trim() ,arg12.trim() ,arg13.trim());
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
     <% response.sendRedirect("purchases.jsp"); %>
    </body>
</html>

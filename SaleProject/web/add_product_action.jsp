<%-- 
    Document   : add_product_action
    Created on : Nov 13, 2016, 10:38:10 PM
    Author     : user
--%>

<%@page import="com.marketplace.Account"%>
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
        
        Account cur = null;
            int asd = Integer.parseInt(((String)session.getAttribute("account_id")).trim());
            try{
                com.marketplace.MarketPlace_Service service = new com.marketplace.MarketPlace_Service();
                com.marketplace.MarketPlace port = service.getMarketPlacePort();
                cur = port.getAccWithAccountId(asd);
            }
            catch (Exception ex){
            
            }
    try {
	com.marketplace.MarketPlace_Service service = new com.marketplace.MarketPlace_Service();
	com.marketplace.MarketPlace port = service.getMarketPlacePort();
	 // TODO initialize WS operation arguments here
	java.lang.String arg0 = request.getParameter("name");
	java.lang.String arg1 = cur.getUsername();
	java.lang.String arg2 = request.getParameter("description");
	java.lang.String arg3 = request.getParameter("price");
	java.lang.String arg4 = "dump";
	// TODO process result here
	int result = port.addProduct(arg0, arg1, arg2, arg3, arg4);
	out.println("Result = "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>

    <% response.sendRedirect("your_product.jsp"); %>
    </body>
</html>

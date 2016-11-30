<%-- 
    Document   : header
    Created on : Nov 11, 2016, 8:06:43 AM
    Author     : user
--%>
 <%@page import="com.marketplace.Account"%>
 <% 
            String token = ((String) session.getAttribute("token")).trim();
            String username = ((String) session.getAttribute("username")).trim();
 %>

<%
            Account cur = null;
            int asd = Integer.parseInt(((String)session.getAttribute("account_id")).trim());
            try{
                com.marketplace.MarketPlace_Service service = new com.marketplace.MarketPlace_Service();
                com.marketplace.MarketPlace port = service.getMarketPlacePort();
                cur = port.getAccWithAccountId(asd);
            }
            catch (Exception ex){
            
            }

 %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="style.css">
<html>
    <h1 id = "title"><span id="sale">Sale</span><span id="project">Project</span></h1>

    <h2 id = "hellouser">Hi, <%out.println(username); %> !</h2>
    
    <form method="post" action="connector.jsp" id="formLogout">
    <input type="hidden" name="title" value="logout">
    <input type="hidden" name="username" value=<%=username%>>
    <input type="hidden" name="access_token" value=<%=token%>>
    <h2 id = "logout"><a href="javascript:;" class = "redlink" onclick="document.getElementById('formLogout').submit();">logout</a></h2><br>  
    </form>
    
    <table width = "100%" id = 'catalog'>
        <tr>
            <td class = 'nobg'>
                <a href=catalog.jsp> CATALOG </a>
            </td>
            <td class = 'nobg'>
                <a href=your_product.jsp> YOUR PRODUCT </a>
            </td>
            <td class = 'nobg'>
                <a href=add_product.jsp> ADD PRODUCT </a>
            <td class = 'nobg'>
                <a href=sales.jsp> SALES </a>
            </td>
            <td class = 'nobg'>
                <a href=purchases.jsp> PURCHASES </a>
            </td>
        </tr>
    </table>

</html>

<%-- 
    Document   : register
    Created on : Nov 13, 2016, 4:05:24 PM
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Register Page</h1>
        <form method="post" action="connector.jsp">
        <input type="hidden" name="title" value="register">
        Username:<input type="text" name="username" /><br/>
        Email ID:<input type="text" name="email" /><br/>
        Password:<input type="password" name="password" /><br/>
        Name:<input type="text" name="name" /><br/>
        Address:<input type="text" name="address" /><br/>
        Postal:<input type="number" name="postal" /><br/>
        Number:<input type="number" name="number" /><br/>
        <input type="submit" value="Register me" />
        </form>
    </body>
</html>

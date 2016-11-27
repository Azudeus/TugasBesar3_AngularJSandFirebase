<%-- 
    Document   : index
    Created on : Nov 13, 2016, 4:25:13 AM
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
        <h1>Login Page</h1>
        <form method="post" action="LoginServlet">
        Email ID:<input type="text" name="email" /><br/>
        Password:<input type="password" name="password" /><br/>
        <input type="submit" value="login" />
        </form>
        <a href="register.jsp">Click here to register</a>
    </body>
</html>

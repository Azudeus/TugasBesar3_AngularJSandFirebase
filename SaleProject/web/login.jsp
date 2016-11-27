<%-- 
    Document   : login
    Created on : Nov 13, 2016, 9:23:45 AM
    Author     : Personal
--%>
<link rel="stylesheet" type="text/css" href="style.css">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page
        </title>
    </head>
    <body>
        <h1 id="title"><span id="sale">Sale</span><span id="project">Project</span></span></h1>
        <h3 id="subHeader"> Please Login </h3>
        <hr>
        <form method="post" action="connector.jsp">
        <input type="hidden" name="title" value="login">
        Email OR Username <br>
        <input type="text" name="email" id = "formField" /><br/><br/>
        Password:<input type="password" name="password" id = "formField" /><br/>
        <div id="submitAlign"><div class="right">
        <input type="submit" value="login" class ="button" />
        </div>
        </form>
        <h2 id="account">Don't have an account yet? Register <a href="register.jsp" class="bluelink">here</a>
    </body>
</html>

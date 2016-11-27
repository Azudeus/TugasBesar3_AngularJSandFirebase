<%-- 
    Document   : register
    Created on : Nov 13, 2016, 4:05:24 PM
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 id="title"><span id = "sale">Sale</span><span id="project">Project </span></h1>
        <h3 id="subHeader"> Please Register </h3>
        <form method="post" action="connector.jsp">
<!--    <input type="hidden" name="title" value="register">
        Username:<input type="text" name="username" /><br/>
        Email ID:<input type="text" name="email" /><br/>
        Password:<input type="password" name="password" /><br/>
        Name:<input type="text" name="name" /><br/>
        Address:<input type="text" name="address" /><br/>
        Postal:<input type="number" name="postal" /><br/>
        Number:<input type="number" name="number" /><br/>
        <input type="submit" value="Register me" />-->
        <input type="hidden" name="title" value="register">
        <div id="formField">
        Full Name <br>
        <input type="text" name="name" id="formField"><br><br>

        Username <br>
        <input type="text" name="username" id="formField"><br><br>

        Email <br>
        <input type="text" name="email" id="formField"><br><br>

        Password <br>
        <input type="password" name="password" id="formField"><br><br>

        Confirm Password <br>
        <input type="password" name="confirm" id="formField"><br><br>

        Full Address <br>
        <textarea rows="3" cols="50" name="address" id="formField"></textarea><br><br>

        Postal Code<br>
        <input type="text" name="postal" id="formField"><br><br>

        Phone Number<br>
        <input type="text" name="number" id="formField"><br><br>

        <div id="submitAlign">
        <input type="submit" value="Register" class="button"><br>
        </div>
        </div>
        </form>
    </body>
</html>

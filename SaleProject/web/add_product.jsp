<%-- 
    Document   : add_catalog
    Created on : Nov 11, 2016, 8:09:23 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title> Add Product </title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript" src ="myAddProduct.js"></script>
</head>
<body>
    <%@include file="header.jsp" %>
         <%
            int account_id = Integer.parseInt(((String)session.getAttribute("account_id")).trim());
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
         %>

    <p id = "SubHeader">Please add your product here.
    <hr>
    <form action="add_product_action.jsp" method="post" name ="myProductForm" onsubmit="return myProductValidate(myProductForm)" >
            <span id = "fName"> Name </span><br>
            <input type ="text" name ="name" class = "width100"><br><br>
            <span id = "fDesc"> Description (max 200 chars) </span><br>
            <input type ="text" name ="description" class = "width100 height100"  ><br><br>
            <span id = "fPrice"> Price(IDR) </span><br>
            <input type ="text" name ="price" class = "width100" ><br><br>
            <span id = "pphoto"> Photo </span> <br>
            <input type ="file" name = "photochoose">
            <input type="hidden" name = "account_id" value="<%out.println(account_id);%>">
                    <div class ="right">
            <input type = "submit" id = "addbutton" class ="button" value ="ADD"> 
            <input type = "button" id = "cancelbutton" class ="button" value ="CANCEL" 
                         onclick = "myProductCancel(<>)">
                    </div>
    </form>
    <!--
    <div id = MyForm>
            <span id = "fName"> Name </span><br>
            <input type ="text" id ="Name"><br>
            <span id = "fDesc"> Description (max 200 chars) </span><br>
            <input type ="text" id ="description"><br>
            <span id = "fPrice"> Price(IDR) </span><br>
            <input type ="text" id ="price"><br>
            <span id = "pphoto"> Photo </span> <br>
            <input type ="file" name= "photochoose">
            <input type="hidden" id = "ausername" value="<?php $username?>"</p>
         <table>
             <td> <input type = "submit" id = "addbutton" value ="ADD" onclick="myProductValidate(false)"> 
             <td> <input type = "button" id = "cancelbutton" value ="CANCEL" 
                         onclick = "myProductCancel(<?php echo($account_id) ?>)">
         </table>
    </div>
    -->
</body>
</html>
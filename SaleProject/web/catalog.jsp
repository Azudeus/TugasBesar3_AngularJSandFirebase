<%-- 
    Document   : catalog
    Created on : Nov 11, 2016, 7:54:13 AM
    Author     : user
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.marketplace.Product"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<%@include file="request.jsp"%>

<script src="https://www.gstatic.com/firebasejs/3.6.1/firebase.js"></script>

<!DOCTYPE html>
<html>
    <body>
        <%@include file="header.jsp" %>   
        <%-- set variable --%>
        <%
            List<Product> Products;
            int account_id = Integer.parseInt(((String)session.getAttribute("account_id")).trim());
        %>
        
        
        
        
        
        
        <%-- start web service invocation --%>
         <%
             
        com.validator.Validator_Service service2 = new com.validator.Validator_Service();
	com.validator.Validator port2 = service2.getValidatorPort();
     
        int result = port2.authToken(token);
	if(result == 2 ){
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
             // TODO process result here
             Products = port.getAllProduct();
        
         } catch (Exception ex) {
             throw new RuntimeException("Error condition!!!");
         }
     
         %>
         <%-- end web service invocation --%>


        
        <p id = "SubHeader">What are you going to buy today?</p>
        <hr>        
   
                     
        <form name="search" action="catalogsearch.jsp" method="POST">
        <table border='0' width = '100%'>
                <tr>
                        <td colspan="2"><div id="formField"><input type="text" name="key" id="formField" placeholder="Search catalog ..."></div></td>
                        <td><div id="formField"><input type="submit" value="GO" class="button"></div></td>
                </tr>
                <tr>
                        <td width="10%" rowspan="2">by</td>
                        <td><input type="radio" name="type" value="product" required>product</td>
                        <td width="10%"></td>
                </tr>
                </tr>
                        <td><input type="radio" name="type" value="store">store</td>
        </table>
        </form>


   

        <% 
              for(int i = 0; i < Products.size(); i++){
                 Product temp = Products.get(i);
       
                com.marketplace.MarketPlace_Service service = new com.marketplace.MarketPlace_Service();
                com.marketplace.MarketPlace port = service.getMarketPlacePort();
                int CheckLike = port.checkLike(temp.getProductId(), account_id);
                 out.println(
                "<p id = 'product'><b>" + temp.getUsername() +"</b> <br> added this on " + temp.getProductDatetime()  +"<hr>"
                +"<table class = 'producttable'>"
                +"<tr>"
                +"<td rowspan = '5' width = 128px> <img src = 'img/" + temp.getImgsrc() + "' style = 'width:128px;height:128px;' > </td>"
                +"<td colspan = '2'> <span id = 'itemname'>" + temp.getProductName() + "</span></td>"
                +"</tr>"
                +"<tr>"
                +"<td><span id = 'price'> Rp."+ (int)temp.getProductPrice() +"</td>"
                +"<td colspan = '2'> "+ temp.getLikes() +" likes</td>"
                +"</tr>"
                +"<tr>"
                +"<td>" + temp.getProductDescription() + "</td>"
                +"<td colspan ='2'>" + temp.getPurchase() + " Purchases</td>"
                +"</tr>"
                +"<tr height = 22> <td colspan = '3'> </td> </tr>"
                +"<tr>"
                +"<td></td>"
                +"<td class = 'likebuy'> <form action = 'likes.jsp'> <input type='hidden' name='account_id' value=" + account_id +"> <input type='hidden' name='product_id' value="+temp.getProductId()+">");
                if(CheckLike > 0)
                    out.println("<input type='hidden' name='type' value='del'> <input type='submit' value='liked' class = 'redlink linkButton'>");     
                else
                    out.println("<input type='hidden' name='type' value='add'> <input type='submit' value='like' class = 'linkButton bluelink '>");  
                out.println("</form></td>"
                +"<td class = 'likebuy'> <form action = 'confirmbuy.jsp'><input type='hidden' name='account_id' value=" + account_id +"> <input type='hidden' name='product_id' value="+temp.getProductId()+">"
                +"<input type='submit' value='BUY' class = 'greenlink linkButton'></form></td>"
                +"</tr></table><br><hr>"
                 
                 );
             }
        %>
        
        
        
        
        
    </body>
</html>

<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyBMPf5WlueEyB3gfXTBdomgpHqSkFbL3EA",
    authDomain: "saleproject-11a54.firebaseapp.com",
    databaseURL: "https://saleproject-11a54.firebaseio.com",
    storageBucket: "saleproject-11a54.appspot.com",
    messagingSenderId: "573176900803"
  };
  firebase.initializeApp(config);
  
  const messaging = firebase.messaging();
  
  messaging.onTokenRefresh(function(){
      messaging.getToken()
              .then(function(token) {
                console.log('Token refreshed');
                setTokenSentToServer(false);
                setTokenSentToServer(refreshedToken);
                resetUI();
              })
          .catch(function(err) {
              console.log('Unable to retrieve refreshed token',err);
              showToken('Unable to retrieve refreshed token',err);
      });
  });
  
  messaging.requestPermission()
          .then(function(){
              console.log('Have Permission');
              return messaging.getToken();
  })
          .catch(function(err) {
              console.log('Error Occured.');
  })
          .then(function(token){
              if (token) {
                  console.log(token);
                  sendTokenToServer(token);
//                  updateUIForPushEnabled(token);
              } else {
                  console.log('No instance ID Token available.Request permission to get one');
                  updateUIForPushPermissionEnabled();
//                  setTokenSentToServer(false);
              }
  })
          .catch(function(err){
              console.log('An error occured while retrieving token',err);
//              showToken('Error retrieving Instance ID TOken',err);
//              setTokenSentToServer(false);
  });
  
  messaging.onMessage(function(payload) {
      console.log('onMessage: ',payload);
      appendMessage(payload);
  });
  
  function showToken(token) {
      var tokenElement = document.querySelector('token');
      tokenElement.textContent = token;
  }
  
  function sendTokenToServer(token) {
      if(!isTokenSentToServer()) {
          console.log('Sending token to server');
          setTokenSentToServer(true);
      } else {
          console.log('Token already sent sent to server');
      }
  }
 
  function isTokenSentToServer() {
      if (window.localStorage.getItem('sentToServer') == 1) {
          return true;
      } else {
          return false;
      }
  }
 
  function setTokenSentToServer(sent) {
      if(sent) {
          window.localStorage.setItem('sentToServer',1);          
      } else {
          window.localStorage.setItem('sentToServer',0);
      }
  }
  
  function deleteToken() {
      messaging.getToken()
              .then(function(token) {
                  messaging.deleteToken(token)
                  .then(function() {
                      console.log('Token deleted');
                      setTokenSentToServer(false);
                      resetUI();
                  })
                          .catch(function(err) {
                              console.log('Unable to delete token ',err);
                  });
      }).catch(function(err) {
          console.log('Error retrieving token ', err);
          showToken('Error retrieving token ', err);
      });
  }
  
  function appendMessage(payload) {
      const messageElement = document.querySelector('#message');
      const dataHeaderElement = document.createElement('h5');
      const dataElement= document.createElement('pre');
      dataElement.style='overflow-x:hidden';
      dataHeaderElement.textContent = 'Received Message:';
      dataElement.textContent = JSON.stringify(payload,null,2);
      messagesElement.appendChild(dataHeaderElement);
      messagesElement.appendChild(dataElement);
  }

  function clearMessages() {
      const messageElement = document.querySelector('#messages');
      while (messageElement.hasChildNodes()) {
          messageElement.removeChild(messageElement.lastChild);
      }
  }
  
</script>

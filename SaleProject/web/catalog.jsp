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
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>


<style>
/* The Modal (background) */


/* Modal Content */
.modal{
    display : none ;

}

.modal-content {
    position: fixed;
    bottom: 0;
    right : 20px;
    background-color: #fefefe;
    width: 30%;
    -webkit-animation-name: slideIn;
    -webkit-animation-duration: 0.4s;
    animation-name: slideIn;
    animation-duration: 0.4s
}

/* The Close Button */
.close {
    color: black;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 15px;
    border-style : ridge;
    height: 30px;
    background-color :  #fefefe;
    color: black;
}

.modal-body {padding: 2px 16px;
    border-left : ridge;
    border-right : ridge;
}

.modal-footer {
    padding: 2px 16px;
    background-color: #fefefe;
    color: white;
    border-style : ridge;
}

/* Add Animation */
@-webkit-keyframes slideIn {
    from {bottom: -300px; opacity: 0} 
    to {bottom: 0; opacity: 1}
}

@keyframes slideIn {
    from {bottom: -300px; opacity: 0}
    to {bottom: 0; opacity: 1}
}

@-webkit-keyframes fadeIn {
    from {opacity: 0} 
    to {opacity: 1}
}

@keyframes fadeIn {
    from {opacity: 0} 
    to {opacity: 1}
}

textarea:focus, input:focus{
    outline: none;
}

</style>

<!DOCTYPE html>
<html>
    <body>
        <%@include file="header.jsp" %>   
        <%-- set variable --%>
        <%
            List<Product> Products;
            int account_id = Integer.parseInt(((String)session.getAttribute("account_id")).trim());
        %>
        
        <h1>Testing here</h1>
        <div id="token_div">
            token div
        </div>
        <div id="permission_div">
            permission div
        </div>
        <p id="message">
            message here
        </p>
        <p id="token">
            
        </p>

    <form method="post" action="connector.jsp" id="formSendMessage">
    <input type="hidden" name="title" value="send">
    <input type="hidden" name="fbtoken" value=<%=token%>>
    <input type="hidden" name="username" value=<%=username%>>
    <input type="hidden" name="message" value="asd">    
    <h2><a href="javascript:;" class = "redlink" onclick="document.getElementById('formSendMessage').submit();">sendMessage</a></h2><br>  
    </form>        

        
    <form method="post" action="connector.jsp" id="formSendMessage">
    <input type="hidden" name="title" value="send">
    <input type="hidden" name="fbtoken" value=<%=token%>>
    <input type="hidden" name="username" value=<%=username%>>
    <input type="hidden" name="message" value="asd">    
    <h2><a href="javascript:;" class = "redlink" onclick="document.getElementById('formSendMessage').submit();">sendMessage</a></h2><br>  
    </form>        
        
        
        
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

</div>


            <!-- Trigger/Open The Modal -->
    <button id="myBtn">Open Modal</button>

    <!-- The Modal -->
    <div ng-app="BasicChat">
    <div ng-controller="chat" id = "chatController">
    <div id="myModal" class="modal">
      
      <!-- Modal content -->
      <div class="modal-content">
        <div class="modal-header">
            <span class="close"><a href='#' onclick='closeModal()'>&times</a></span>
               {{messageuser}}   
          <br>
        </div>
        <div class="modal-body" ng-repeat = "message in asd">
         {{message.username}} : {{message.message}}
        </div>
        <div class="modal-footer">
          <form ng-submit="send()">
                <input ng-model="textbox" style="border:none">
          </form>
        </div>
      </div>

      </div>
    </div>

   

        <% 
              for(int i = 0; i < Products.size(); i++){
                 Product temp = Products.get(i);
       
                com.marketplace.MarketPlace_Service service = new com.marketplace.MarketPlace_Service();
                com.marketplace.MarketPlace port = service.getMarketPlacePort();
                int CheckLike = port.checkLike(temp.getProductId(), account_id);
                 out.println(
                "<p id = 'product'><b><a href='#' onclick='openModal(this)' username = " + temp.getUsername() + " >" + temp.getUsername() +"</a></b>"
                + " <br> added this on " + temp.getProductDatetime()  +"<hr>"
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
        
        
        </div>
    
        
    </body>
</html>
<!-- Angular js -->
<script>
var message = {username : "rellons", message : "halo"};
var message2 = {username : "azudeus", message : "halo juga"};
    
var app = angular.module("BasicChat", []);
app.controller("chat", ['$scope', function($scope) {
    $scope.asd = [message,message2];
    $scope.messageuser = "azudeus";
    
    $scope.send = function() {
        console.log("asd");
        var messagetemp = {username : "rellons", message :this.textbox};
        $scope.asd.push(messagetemp);
        $scope.textbox = '';
    };
    
    $scope.updateUsername = function(a){
        $scope.messageuser = a;
        
    };
    
   

}]);
</script>

<script>
// Get the modal
var modal = document.getElementById('myModal');


     function openModal(element){
        modal.style.display = "block";
        var username = element.getAttribute("username");
        var scope = angular.element(document.getElementById('chatController')).scope();
        scope.$apply(function(){scope.updateUsername(username);});
    }

    function closeModal(){
        modal.style.display = "none";
    }


//// When the user clicks anywhere outside of the modal, close it
//window.onclick = function(event) {
//    if (event.target == modal) {
//        modal.style.display = "none";
//    }
//}
</script>

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
  const tokenDivId = 'token_div';
  const permissionDivId = 'permission_div';
  
  messaging.onTokenRefresh(function(){
      console.log("Refreshed")
      messaging.getToken()
              .then(function(token) {
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
              var tk = messaging.getToken();
              return tk;
  })
          .catch(function(err) {
              console.log('Error Occured.');
  })
          .then(function(token){
              if (token) {
                  console.log(token);
                  sendTokenToServer(token);
                  updateUIForPushEnabled(token);
              } else {
                  console.log('No instance ID Token available.Request permission to get one');
                  updateUIForPushPermissionEnabled();
                  setTokenSentToServer(false);
              }
  })
          .catch(function(err){
              console.log('An error occured while retrieving token',err);
              showToken('Error retrieving Instance ID TOken',err);
              setTokenSentToServer(false);
  });
  
  messaging.onMessage(function(payload) {
      console.log('onMessage: ',payload);
      appendMessage(payload);
  });
  
  function showToken(token) {
      var tokenElement = document.querySelector('#token');
      tokenElement.textContent = token;
  }
  
  function sendTokenToServer(token) {
      if(!isTokenSentToServer()) {
          console.log('Sending token to server');
          setTokenSentToServer(true);
      } else {
          console.log('Token already sent to server');
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
      const messagesElement = document.querySelector("#message");
      const dataHeaderElement = document.createElement('h5');
      const dataElement= document.createElement('pre');
      dataElement.style='overflow-x:hidden';
      dataHeaderElement.textContent = 'Received Message'; 
     dataElement.textContent = JSON.stringify(payload,null,2);
      messagesElement.appendChild(dataHeaderElement);
      messagesElement.appendChild(dataElement);
  }

  function clearMessages() {
      const messagesElement = document.querySelector("#message");
      while (messagesElement.hasChildNodes()) {
          messagesElement.removeChild(messagesElement.lastChild);
      }
  }
  
  function resetUI() {
      clearMessages();
      showToken('loading...');
      messaging.getToken().
              then(function(token) {
                  if(token) {
                      sendTokenToServer(token);
                      updateUIForPushEnabled(token);
                  } else {
                      console.log('No Instance Token ID available. Requesting permission');
                      updateUIForPushPermissionRequired();
                      setTokenToServer(false);
                  }
      })
              .catch(function(err) {
                  console.log('Error retrieving token',err);
                  showToken('Error retrieving ID Token',err);
                  setTokenSentToServer(false);          
      });
  }
  

  function updateUIForPushEnabled(currentToken) {
    showHideDiv(tokenDivId, true);
    showHideDiv(permissionDivId, false);
    showToken(currentToken);
  }
  
    function updateUIForPushPermissionRequired() {
    showHideDiv(tokenDivId, false);
    showHideDiv(permissionDivId, true);
  }
    function showHideDiv(divId, show) {
    const div = document.querySelector('#' + divId);
    if (show) {
      div.style = "display: visible";
    } else {
      div.style = "display: none";
    }
  }
  
  
</script>

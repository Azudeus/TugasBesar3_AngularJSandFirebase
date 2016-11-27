    <%-- 
    Document   : chat
    Created on : Nov 27, 2016, 10:45:07 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>


<style>
/* The Modal (background) */


/* Modal Content */
.modal-content {
    position: fixed;
    bottom: 0;
    right : 20px;
    background-color: #fefefe;
    border-style : solid;
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

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
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
</style>


<script>
var message = {username : "rellons", message : "halo"};
var message2 = {username : "azudeus", message : "halo juga"};
    
var app = angular.module("BasicChat", []);
app.controller("chat", function($scope) {
    $scope.asd = [message,message2];
    
    $scope.send = function() {
        console.log("asd");
        var messagetemp = {username : "rellons", message :this.textbox};
        $scope.asd.push(messagetemp);
        $scope.textbox = '';
    };
});
</script>





</body>
</html>

<!-- Trigger/Open The Modal -->
<button id="myBtn">Open Modal</button>

<!-- The Modal -->
<div id="myModal" class="modal" ng-app="BasicChat">
  <div ng-controller="chat">
  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times</span>
      azudeus<br>
    </div>
    <div class="modal-body" ng-repeat = "message in asd">
     {{message.username}} : {{message.message}}
    </div>
    <div class="modal-footer">
      <form ng-submit="send()">
            <input ng-model="textbox">
      </form>
    </div>
  </div>
 
  </div>
</div>


<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>


</html>
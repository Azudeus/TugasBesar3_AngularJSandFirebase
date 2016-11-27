
function money_f(x){
  var r = Math.floor( x / 1000 );
  var x = Math.floor( x % 1000 );

  var x_str = x.toString();
  while( x_str.length < 3 ) x_str = "0" + x_str;

  if( r == 0 )
    return "IDR " + x;
  else
    return money_f(r) + "." + x_str;
}

function writePriceConfirm(a){
	document.getElementById("price").innerHTML = money_f(a);
}

function writeTotalPrice(a, b){
	var ID = 'total_price_'+b;
	document.getElementById(ID).innerHTML = money_f(a);	
}

function writePrice(a, b){
	var ID = 'price_'+b;
	document.getElementById(ID).innerHTML = money_f(a);	
}
function buy(element){
	var value = parseInt( element.value );
	var price = parseInt (element.getAttribute("price"));
	if( !isNaN(value) ){
		document.getElementsByClassName("total_price")[0].innerHTML = money_f(value * price);
	}
	else{
		document.getElementsByClassName("total_price")[0].innerHTML = "Please insert integer";
	}

}

function buyVerification(){
	var quantity = document.getElementsByName("quantity")[0].value;
	var cvc = document.getElementsByName("credit_veri")[0].value;
	var credit_number = document.getElementsByName("credit_number")[0].value;
	var consignee = document.getElementsByName("consignee")[0].value;
	var address = document.getElementsByName("full_address")[0].value;
	var post = document.getElementsByName("postal_code")[0].value;
	var phone = document.getElementsByName("phone_number")[0].value;
	
	if((quantity.length == 0) ||(cvc.length ==0 ) || (credit_number.length == 0) || (consignee.length == 0) || (address.length == 0) || (post.length == 0) || (phone.length ==0)){
		alert ("Field must be not empty");
		return false;
		
	}
	if (isNaN(quantity)) {
		alert("quantity must be number");
		return false;
	}

	var credit_number_regex = /^\d{12}$/;
	
	if(!credit_number_regex.test(credit_number)){
		alert("Credit number must be 12 digit")
		return false;
	}
	

	var cvc_regex = /^\d{3}$/;
	if(!cvc_regex.test(cvc)){
		alert("CVC must be 3 digit");
		return false;	
	}
	
		
	
}
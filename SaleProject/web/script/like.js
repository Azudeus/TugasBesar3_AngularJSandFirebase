
function like(element){
	var p_id = 'like_count_' + element.getAttribute("product_id");
	var product_id = element.getAttribute("product_id");
	var account_id = element.getAttribute("account_id");
	xhttp = new XMLHttpRequest();
	
	if (element.innerHTML =='like'){
		element.innerHTML = 'liked';
		element.className = "redlink";
		
		var count = parseInt(document.getElementsByClassName(p_id)[0].innerHTML) + 1;
		document.getElementsByClassName(p_id)[0].innerHTML = count + " likes";
		xhttp.open("GET", "like.php?account_id="+account_id+"&product_id="+product_id+"&operation=add",true);
		xhttp.send();
	}
	else{
		element.innerHTML = 'like';
		element.className = "bluelink";
		var count = parseInt(document.getElementsByClassName(p_id)[0].innerHTML) - 1;
		document.getElementsByClassName(p_id)[0].innerHTML = count + " likes";
		xhttp.open("GET", "like.php?account_id="+account_id+"&product_id="+product_id+"&operation=min",true)
		xhttp.send();	
	}
}

function update(a,b){
	var pid = 'like_'+ a;
	if(b==0){
		document.getElementById(pid).innerHTML = "like";
		document.getElementById(pid).className = "bluelink";
		
	}
	else{
	if(b==1)
		document.getElementById(pid).innerHTML = "liked";	
		document.getElementById(pid).className = "redlink";
	}
		
}
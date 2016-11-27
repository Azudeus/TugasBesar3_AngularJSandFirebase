function getExtension(filename) {
    var parts = filename.split('.');
    return parts[parts.length - 1];
}

//validate user input
function myProductValidate(update, productId){
    var name = document.getElementsByName("name")[0].value;
    var desc = document.getElementsByName("description")[0].value;
    var prc = document.getElementsByName("price")[0].value;
	var file = document.getElementsByName("photochoose")[0].value;
    /*var formInName = new String(name);
    var formInDesc = new String(desc);
    var formInPrice = new String(prc);
    var allvalid = true;*/
    //Cek kevalidan nama produk
    //Cek kevalidan deskripsi produk
    //Cek kevalidan harga
    
	if((name.length==0) || (desc.length == 0) || (prc.length == 0) || (file.length == 0)){
		alert("Field must be not empty");
		return false;
	}
	
	if(isNaN(prc)){
		alert("Price must be a number");
		return false;
	}
	
	if(desc.length>200){
		alert("Description must be fewer than 200 character");
		return false;	
	}
	
	if(getExtension(file)!='jpg'){
		alert("Photo must be JPG");
		return false;
	}
	/*
    //Jika nama, deskripsi, dan harga valid, maka coba untuk submit
    if(allvalid){
        var data = new FormData();
        data.append("Name", name);
        data.append("description", desc);
        data.append("price", prc);
        data.append("photochoose", document.getElementById('photochoose'));
        var xconnect = new XMLHttpRequest();
        xconnect.onreadystatechange = function(){
            if (this.readyState == 4 && this.status == 200){
                switch(this.responseText){
                    case "1" : {
                            alert("Invalid image");
                            break;
                    }
                    case "2": {
                            alert("Too many image (max 1)");
                            break;
                    }
                    case "3": {
                            alert("Image already exist");
                            break;
                    }
                    case "4": {
                            alert("Unsupported file type");
                            break;
                    }
                    case "5": {
                            alert("ERROR");
                            break;
                    }
                    case "Success":{
                            alert("Success!");
                            redirect(username);
                            break;
                    }
                    default:{
                            alert(this.responseText);
                    }
                }
            }
        };
        //open connection
        if(update){
            xconnect.open("POST", "formUpdate.php?account_id="+username+"&prod_id="+productId, true);
        }
        else{
            xconnect.open("POST", "formUpload.php?account_id="+username, true);
        }
        xconnect.setRequestHeader("Content-Type", "multipart/form-data");
        xconnect.send(data);
    }*/
 }
        
//jika cancel, maka tampilkan dialog "Are you sure you want to cancel? dan redirect
function myProductCancel(username){
    if(confirm("Do you really want to cancel?")){
        redirect(username);
    }
    //else do nothing
}
    
function redirect(username){
    document.location.href = "yourproduct.php?account_id="+username;
}


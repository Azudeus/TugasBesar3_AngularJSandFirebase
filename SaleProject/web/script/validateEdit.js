function validateEdit() {
    var name = document.forms["edit_product"]["name"].value;
    var description = document.forms["edit_product"]["description"].value;    
    var price = document.forms["edit_product"]["price"].value;    

    if (name == null || name == "") {
        alert("Product name must be filled out");
        return false;
    }

    if (description == null || description == "") {
        alert("Description must be filled out");
        return false;
    }

    if (price == null || price == "") {
    	alert("Price must be filled out");
    	return false;
    }

    if (isNaN(price)) {
    	alert ("Price must be a valid number");
    	return false;
    }
}


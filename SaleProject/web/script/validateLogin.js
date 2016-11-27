function validateLogin() {
    var username = document.forms["login"]["username"].value;
    var password = document.forms["login"]["password"].value;    

    if (username == null || username == "") {
        alert("Username or Email must be filled out");
        return false;
    }

    if (password == null || password == "") {
        alert("Password must be filled out");
        return false;
    }
}


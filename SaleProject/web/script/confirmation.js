function confirmation() {
	var ret = confirm("Are you sure?");
	if (ret == true) {
		return true;
	} else {
		return false;
	}
}
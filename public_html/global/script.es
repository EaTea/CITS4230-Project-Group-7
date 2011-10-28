function gmain() {
	var top = document.getElementById("main_nav_list");
	if (top.getAttribute("data-cp") != "") {
		var items = top.getElementsByTagName("a");
		for (var i = 0; i < items.length; i++) {
			if (items[i].getAttribute("href").indexOf(top.getAttribute("data-cp"), 0) != -1) {
				items[i].parentNode.setAttribute("class", "current-menu-item");
			}
		}
	}
}

function validate_login() {
	var username = document.forms['login']['username'].value;
	if((username == null || username == "")) {
		alert('Please fill in the username field.');
		return false;
	}
	if(username.length < 4) {
		alert('Please enter a username that is at least 4 characters long.');
		return false;
	}
	if(username.length > 32) {
		alert('Please enter a username that is at most 32 characters long.');
		return false;
	}
	if(username.match(/\W/) != null) {
		alert("A character that is not a letter, number or underscore is in the username.\nPlease make sure to remove them.");
		return false;
	}
	var password = document.forms['login']['password'].value;
	if((password == null || password == "")) {
		alert('Please fill in the password field.');
		return false;
	}
	if(password.length < 6) {
		alert('Please enter a password that is at least 6 characters long.');
		return false;
	}
	if(password.length > 64) {
		alert('Please enter a password that is at most 64 characters long.');
		return false;
	}
}

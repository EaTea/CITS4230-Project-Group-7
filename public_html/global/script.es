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
	var username = document.forms['login']['user'].value;
	if((username == null || username == "")) {
		alert('Please fill in the username field with a valid username.');
		return false;
	}
	if(username.match(/\W/) != null) {
		alert("You\'ve used a character that's not a letter, number or underscore in your username.\nPlease remove it from your username and resubmit.");
		return false;
	}
	var password = document.forms['login']['pass'].value;
	if((password == null || password == "")) {
		alert('Please fill in the password field with a valid password.');
		return false;
	}
	if(password.match(/.{6,}/) == null) {
		alert('Please use a password that is at least of length 6 characters.');
		return false;
	}
}

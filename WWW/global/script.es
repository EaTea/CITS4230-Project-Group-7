function load() {
	fallback();
	gmain();
	main();
}

function main() {}

function fallback() {
	// CSS3 target-name property fallback
	var aElt = document.getElementById("validators").getElementsByTagName("a");
	for (var i = 0; i < aElt.length; i++) {
		var a = aElt[i];
		if (a.style.targetName == "new") {
			break;
		}
		a.setAttribute("target", "_blank");
	}
}

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

function show_accesskeys() {
	alert("Access keys are:\n\
	c - Goes to page body\n\
	m - Goes to main menu\n\
	i - Goes to footer\n\
	");
	return false;
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
	if(password.match(/[\w]{6,}/) == null) {
		alert('Please use a password that consists of letters, numbers or underscores only, and is at least of length 6.');
		return false;
	}
}

function Slideshow() {
	this.sshow = document.getElementById("slideshow");
	this.caption = this.sshow.getElementsByTagName("figcaption")[0];
	this.imgs = this.sshow.getElementsByTagName("div")[0].getElementsByTagName("img");
	this.nav = this.sshow.getElementsByTagName("nav")[0].getElementsByTagName("ul")[0];
	this.t = 0;
	this.cur = 0;
	
	this.update = function(next) {
		if (next != this.cur) {
			this.caption.innerHTML = this.imgs[next].getAttribute("title");
			var elts = this.nav.childNodes;
			elts[this.cur].removeAttribute("class");
			this.imgs[this.cur].style.display = "none";
			elts[next].setAttribute("class", "hovered");
			this.imgs[next].style.display = "inline";
			this.cur = next;
		}
	}
	this.next = function() {
		var children = this.nav.childNodes;
		this.update((this.cur + 1) % children.length);
		var local = this;
		this.t = setTimeout(function() {
			local.next();
		}, 5000);
	}
	this.start = function() {
		if (!this.t) {
			var local = this;
			this.t = setTimeout(function() {
				local.next();
			}, 5000);
		}
	}
	this.end = function() {
		clearTimeout(this.t);
		this.t = 0;
	}
	
	{
		var local = this;
		this.sshow.addEventListener("mousemove", function(event) {
			local.end();
			event.stopPropagation();
		}, false);
		document.addEventListener("mousemove", function(event) {
			local.start();
		}, false);
	}
	/*this.sshow.onmousemove = function(event) {}
	document.onmouseover = function(event) {}*/
	for (var i = 0; i < this.imgs.length; i++) {
		// Create navigation
		var li = document.createElement("li");
		var div = document.createElement("div");
		li.appendChild(div);
		li.appendChild(document.createTextNode(this.imgs[i].getAttribute("alt")));
		li.setAttribute("title", i);
		var local = this;
		li.addEventListener("mousemove", function(event) {
			var cur = event.currentTarget;
			local.update(cur.getAttribute("title"));
		}, false);
		//li.onmouseover = function(event) {}
		if (i == 0) li.setAttribute("class", "hovered");
		this.nav.appendChild(li);
	}
	this.caption.innerHTML = this.imgs[0].title;
}

function main() {
	ss = new Slideshow();
	ss.start();
}

function validate_registration() {
	var username = document.forms['signup']['new_user'].value;
	if((username == null || username == "")) {
		alert('Please fill in the username field with a valid username.');
		return false;
	}
	if(username.match(/\W/) != null) {
		alert("You\'ve used a character that's not a letter, number or underscore in your username.\nPlease remove it from your username and resubmit.");
		return false;
	}
	var email = document.forms['signup']['email'].value;
	if((email == null || email == "")) {
		alert('Please fill in the email field with a valid email.');
		return false;
	}
	if(email.match(/[\w\.]+@([\w]+\.)+[\w]{2,}/) == null) {
		alert('It looks like you\'ve inputted an invalid email address.\nPlease make sure you inputted a valid email address and try again.');
		return false;
	}
	var confirm_email = document.forms['signup']['v_email'].value;
	if(email.match(confirm_email) == null) {
		alert('Hey! Listen! Your email doesn\'t match the confirmation email!\nPlease make sure they match and then try again!');
		return false;
	}
	var password = document.forms['signup']['new_pass'].value;
	if((password == null || password == "")) {
		alert('Please fill in the password field with a valid password.');
		return false;
	}
	if(password.match(/.{6,}/) == null) {
		alert('Please use a password that is at least of length 6 characters.');
		return false;
	}
	var confirm_password = document.forms['signup']['v_pass'].value;
	if(password.match(confirm_password) == null) {
		alert("Oops! Your password and confirmation password don't match.\nPlease check that they were the same and try again.");
		return false;
	}
}

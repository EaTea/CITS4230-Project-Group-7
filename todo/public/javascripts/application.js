// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function validate_registration() {
	var username = document.forms['new_user']['user[username]'].value;
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
	var email = document.forms['new_user']['user[email]'].value;
	if((email == null || email == "")) {
		alert('Please fill in the email field.');
		return false;
	}
	if(email.length > 64) {
		alert('Please enter a email that is at most 64 characters long.');
		return false;
	}
	if(email.match(/([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/i) == null) {
		alert('An invalid email address has been entered.\nPlease make sure a valid email address is entered.');
		return false;
	}
	var confirm_email = document.forms['new_user']['user[email_confirmation]'].value;
	if(email.match(confirm_email) == null) {
		alert('Oops! The email address entered does not match the confirmation email.\nPlease make sure they match.');
		return false;
	}
	var password = document.forms['new_user']['user[password]'].value;
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
	var confirm_password = document.forms['new_user']['user[password_confirmation]'].value;
	if(password.match(confirm_password) == null) {
		alert("Oops! The password entered does not match the confirmation password.\nPlease check that they are the same.");
		return false;
	}
}

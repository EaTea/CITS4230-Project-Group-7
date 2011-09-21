function load() {
	fallback();
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

function show_accesskeys() {
	alert("Sorry, this display is still not implemented properly.\n\
For now we have a alert window.\n\
Current access keys are:\n\
	c - Goes to page body\n\
	m - Goes to main menu\n\
	i - Goes to footer\n\
	");
	return false;
}

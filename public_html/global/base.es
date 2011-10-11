function load() {
	fallback();
	gmain();
	main();
}

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

function gmain() {}
function main() {}

function show_accesskeys() {
	alert("Access keys are:\n\
	c - Goes to page body\n\
	m - Goes to main menu\n\
	i - Goes to footer\n\
	");
	return false;
}

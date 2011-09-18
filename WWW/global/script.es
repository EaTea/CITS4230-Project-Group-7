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

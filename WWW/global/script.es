function load() {
	fallback();
	main();
}

function main() {}

function fallback() {
	// CSS3 target-name property fallback
	aElt=document.getElementById("validators").getElementsByTagName("a");
	for (i = 0; i < aElt.length; i++) {
		a = aElt[i];
		if (a.style.targetName == "new") {
			break;
		}
		a.target = "_blank";
	}
}

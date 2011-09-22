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

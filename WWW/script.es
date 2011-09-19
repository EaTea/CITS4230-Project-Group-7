function Slideshow(title) {
	this.sshow = document.getElementById("slideshow");
	this.imgs = this.sshow.getElementsByTagName("div")[0].getElementsByTagName("img");
	this.nav = this.sshow.getElementsByTagName("nav")[0].getElementsByTagName("ul")[0];
	this.t;
	this.on = 0;
	this.cur = 0;
	
	this.update = function(next) {
		this.imgs[this.cur].style.display = "none";
		this.imgs[next].style.display = "inline";
		this.cur = next;
	}
	this.next = function(oname) {
		var children = this.nav.childNodes;
		var i = this.cur;
		if (children[i].getAttribute("class") == "hovered") {
			children[i].removeAttribute("class");
			var n = 0;
			if (i+1 < children.length) {
				n = i+1;
			}
			children[n].setAttribute("class", "hovered");
			this.update(n);
		}
		this.t = setTimeout(oname+".next('"+oname+"')", 3000);
	}
	this.start = function(oname) {
		if (!this.on) {
			this.on=1;
			this.t = setTimeout(oname+".next('"+oname+"')", 3000);
		}
	}
	this.end = function() {
		clearTimeout(this.t);
		this.on=0;
	}
	this.mover = function(event) {
		if (event.target == event.currentTarget) {
			var siblings = event.currentTarget.parentNode.childNodes;
			for (var i = 0; i < siblings.length; i++) {
				siblings[i].removeAttribute("class");
				if (siblings[i] == event.currentTarget) {
					siblings[i].setAttribute("class", "hovered");
					eval(event.currentTarget.parentNode.getAttribute("title")+".update("+i+")");
				}
			}
		}
	}
	
	this.nav.setAttribute("title", title);
	for (var i = 0; i < this.imgs.length; i++) {
		// Set image titles
		var title = this.imgs[i].alt;
		this.imgs[i].title = title;
		// Create navigation
		var li = document.createElement("li");
		var div = document.createElement("div");
		li.appendChild(div);
		li.appendChild(document.createTextNode(i));
		li.addEventListener("mouseover", this.mover, false);
		//li.onmouseover = this.mover;
		if (i == 0) li.setAttribute("class", "hovered");
		this.nav.appendChild(li);
	}
}

function main() {
	ss = new Slideshow("ss");
	ss.sshow.addEventListener("mousemove", function(event) {
		ss.end();
		event.stopPropagation();
	}, false);
	document.addEventListener("mousemove", function(event) {
		ss.start("ss");
	}, false);
	/*ss.sshow.onmousemove = function(event) {
		ss.end();
		event.stopPropagation();
	}
	document.onmouseover = function(event) {
		ss.start("ss");
	}*/
	ss.start("ss");
}

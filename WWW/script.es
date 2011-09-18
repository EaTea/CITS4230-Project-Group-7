function Slideshow() {
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
			var siblings = ss.nav.childNodes;//event.currentTarget.parentNode.childNodes;
			for (var i = 0; i < siblings.length; i++) {
				siblings[i].removeAttribute("class");
				if (siblings[i] == event.currentTarget) {
					siblings[i].setAttribute("class", "hovered");
					ss.update(i);
				}
			}
			//event.currentTarget.setAttribute("class", "hovered");
		}
	}
	
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
	ss = new Slideshow();
	ss.sshow.addEventListener("mouseover", function(event) {
		if (event.eventPhase == Event.BUBBLING_PHASE) {
			ss.end();
		}
	}, false);
	ss.sshow.addEventListener("mouseout", function(event) {
		if (event.eventPhase == Event.CAPTURING_PHASE) {
			ss.start("ss");
		}
	}, true);
	/*ss.sshow.onmouseout = function(event) {
		if (event.eventPhase == Event.BUBBLING_PHASE) {
			ss.start("ss");
		}
	}
	ss.sshow.onmouseover = function(event) {
		if (event.eventPhase == Event.BUBBLING_PHASE) {
			ss.end();
		}
	}*/
	ss.start("ss");
}

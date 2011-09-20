function Slideshow(sname) {
	this.sshow = document.getElementById("slideshow");
	this.imgs = this.sshow.getElementsByTagName("div")[0].getElementsByTagName("img");
	this.nav = this.sshow.getElementsByTagName("nav")[0].getElementsByTagName("ul")[0];
	this.t;
	this.on = 0;
	this.cur = 0;
	
	this.update = function(next) {
		if (next != this.cur) {
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
		this.t = setTimeout(sname+".next()", 5000);
	}
	this.start = function() {
		if (!this.on) {
			this.on=1;
			this.t = setTimeout(sname+".next()", 5000);
		}
	}
	this.end = function() {
		clearTimeout(this.t);
		this.on=0;
	}
	this.mover = function(event) {
		var cur = event.currentTarget;
		eval(sname+".update("+cur.getAttribute("title")+")");
	}
	
	this.sshow.addEventListener("mousemove", function(event) {
		eval(sname+".end()");
		event.stopPropagation();
	}, false);
	document.addEventListener("mousemove", function(event) {
		eval(sname+".start()");
	}, false);
	/*this.sshow.onmousemove = function(event) {
		eval(sname+".end()");
		event.stopPropagation();
	}
	document.onmouseover = function(event) {
		eval(sname+".start()");
	}*/
	for (var i = 0; i < this.imgs.length; i++) {
		// Create navigation
		var li = document.createElement("li");
		var div = document.createElement("div");
		li.appendChild(div);
		li.appendChild(document.createTextNode(i));
		li.setAttribute("title", i);
		li.addEventListener("mousemove", this.mover, false);
		//li.onmouseover = this.mover;
		if (i == 0) li.setAttribute("class", "hovered");
		this.nav.appendChild(li);
	}
}

function main() {
	ss = new Slideshow("ss");
	ss.start("ss");
}

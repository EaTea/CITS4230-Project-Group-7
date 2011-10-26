function Slideshow(elt) {
	this.caption = elt.getElementsByTagName("section")[0];
	this.imgs = elt.getElementsByTagName("div")[0].getElementsByTagName("img");
	this.nav = elt.getElementsByTagName("div")[2].getElementsByTagName("ul")[0];
	this.t = 0;
	this.cur = 0;

	this.update = function(next) {
		if (next != this.cur) {
			var prev = this.cur;
			this.cur = next;
			for (var i = 0; i < this.imgs.length; i++) {
				this.imgs[i].style.left = ((i-next)*100)+"%";
			}
			this.caption.innerHTML = this.imgs[next].getAttribute("data-caption");
			var elts = this.nav.childNodes;
			elts[prev].removeAttribute("class");
			elts[next].setAttribute("class", "hovered");
		}
	}
	this.next = function() {
		this.update((this.cur + 1) % this.imgs.length);
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
		elt.addEventListener("mousemove", function(event) {
			local.end();
			event.stopPropagation();
		}, false);
		document.addEventListener("mousemove", function(event) {
			local.start();
		}, false);
		/*elt.onmousemove = function(event) {}
		document.onmouseover = function(event) {}*/
	}
	for (var i = 0; i < this.imgs.length; i++) {
		// Initialise the "tape"
		this.imgs[i].style.left = (i*100)+"%";
		// Create controller
		var li = document.createElement("li");
		var div = document.createElement("div");
		li.appendChild(div);
		li.appendChild(document.createTextNode(this.imgs[i].getAttribute("data-sub")));
		li.setAttribute("data-index", i);
		var local = this;
		li.addEventListener("mousemove", function(event) {
			var cur = event.currentTarget;
			local.update(parseInt(cur.getAttribute("data-index")));
		}, false);
		//li.onmouseover = function(event) {}
		if (i == 0) li.setAttribute("class", "hovered");
		this.nav.appendChild(li);
	}
	this.caption.innerHTML = this.imgs[0].getAttribute("data-caption");
}

function main() {
	ss = new Slideshow(document.getElementById("slideshow"));
	ss.start();
}

function arcaneScene($element,w,h){
	this.scene = {};
	scene.root = new arcaneNode((w/2),(h/2),0);
	scene.meta = {width : w, height: h};
	$element.html(
	'<canvas id="arcaneCanvas" width="'+w+'" height="'+h+'"></canvas>'
	);
}

scene.prototype.attachChild = function(node){
	this.scene.root.attachChild(node);
}

scene.prototype.draw = function(){
	var context = $("#arcaneCanvas")[0].getContext("2d");
	this.root.drawNode(context);
}

scene.prototype.animate = function(step){
	
}

function arcaneNode(x,y,angle,renderer,parent){
	this.children = [];
	if (x!==undefined)this.x=x;
	if (y!==undefined)this.y=y;
	if (angle!==undefined)this.angle=angle;
	if (parent!==undefined)this.parent=parent;
	if (renderer!==undefined)this.renderer=renderer;
}

arcaneNode.prototype.attachChild = function(objectNode){
	this.children.push(objectNode);
	return this;
}

arcaneNode.prototype.addToParent = function(parent){
	parent.attachChild(this);
	this.parent = parent;
}

arcaneNode.prototype.removeChild = function(objectNode){
	for (var i in this.children){
		if (this.children[i]===objectNode){
			this.children.splice(i,1);
		}
	}
}

arcaneObject.prototype.drawNode = function(context){
	context.rotate(this.angle);
	context.translate(this.x,this.y);
	this.renderer(context)
	context.save();
	for (var c in this.children){
		this.children[c].drawNode();
	}
	context.restore();
}

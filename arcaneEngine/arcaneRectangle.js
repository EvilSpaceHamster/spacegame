function arcaneRectangle(x,y,w,h,style){
	this.x=x;
	this.y=y;
	this.w=w;
	this.h=h;
	this.style=style || {};
	this.node = new arcaneNode(x,y,this.prototype.renderer)
}

arcaneRectangle.prototype.renderer = function(context){
	if (this.style.fill!==undefined){
		context.setFillColor(this.style.fill);
		context.fillRect(this.x,this.y,this.w,this.h);
	}
	if (this.style.stroke!==undefined){
		context.setStrokeColor(this.style.stroke);
		context.strokeRect(this.x,this.y,this.w,this.h);
	}
}



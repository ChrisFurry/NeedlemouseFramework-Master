/// @description 
var type = switchStyle;
with(parPlayer){
	if(collision_line(xprevious,yprevious,x,y,other,true,true)){
		switch(type){
			case 0:
				solidLayer = other.switchLayer1;
				break;
			case 1:
				if(xspeed < 0)solidLayer = other.switchLayer1;
				if(xspeed > 0)solidLayer = other.switchLayer2;
				break;
			case 2:
				if(yspeed < 0)solidLayer = other.switchLayer1;
				if(yspeed > 0)solidLayer = other.switchLayer2;
				break;
		}
	}
}
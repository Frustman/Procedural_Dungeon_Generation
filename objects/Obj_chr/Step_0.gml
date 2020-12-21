dx = lengthdir_x(moveSpeed,ControllerID.directionBox);
dy = lengthdir_y(moveSpeed,ControllerID.directionBox);

signX = sign(dx);
signY = sign(dy);

if(signX > 0)
	image_xscale = 1.0;
else if(signX < 0)
	image_xscale = -1.0;

if(ControllerID.move){
	image_speed = 0.2;
} else{
	image_index = 0;
	image_speed = 0;
}

if(ControllerID.move && place_empty(x + dx, y, Obj_wall)){
	x += dx;
} else if(ControllerID.move && !place_empty(x + dx, y, Obj_wall)){
	while(place_free(x + signX / 2, y)){
		x += signX / 2;
	}
}
if(ControllerID.move && place_empty(x, y + dy, Obj_wall)){
	y += dy;
} else if(ControllerID.move && !place_empty(x, y + dy, Obj_wall)){
	while(place_free(x, y + signY / 2)){
		y += signY / 2;
	}
}


if (!place_free(ceil(x),y)){
 x = floor(x);
}
if (!place_free(x,ceil(y))){
 y = floor(y);
}
if (!place_free(floor(x),y)){
 x = ceil(x);
}
if (!place_free(x,floor(y))){
 y = ceil(y);
}
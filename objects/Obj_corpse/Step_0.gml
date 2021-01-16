/// @description Insert description here
// You can write your code in this editor

dx = dx * 0.9;
dy = dy * 0.9;

signX = sign(dx);
signY = sign(dy);

if(place_empty(x + dx, y, Obj_wall)){
	x += dx;
} else if(!place_empty(x + dx, y, Obj_wall)){
	while(place_free(x + signX / 100, y)){
		x += signX / 100;
	}
}
if(place_empty(x, y + dy, Obj_wall)){
	y += dy;
} else if(!place_empty(x, y + dy, Obj_wall)){
	while(place_free(x, y + signY / 100)){
		y += signY / 100;
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
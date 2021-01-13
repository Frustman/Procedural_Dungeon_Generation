/// @description Insert description here
// You can write your code in this editor
chr_diff = point_distance(Obj_chr.x, Obj_chr.y, x, y);
for(var i = -1;i < 2; i++){
	for(var j = -1 ; j < 2; j++){
		in_sight = collision_line(x + sprite_width * i,y + sprite_height * j,Obj_chr.x,Obj_chr.y,Obj_wall,true,false) == noone;
		if(in_sight) break;
	}
	if(in_sight) break;
}
if(knuckback){
	dx = lengthdir_x(2,point_direction(x,y,Obj_chr.x,Obj_chr.y) - 180);
	dy = lengthdir_y(2,point_direction(x,y,Obj_chr.x,Obj_chr.y) - 180);
}else {
	dx = 0;
	dy = 0;
}

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
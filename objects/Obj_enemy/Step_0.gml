/// @description Insert description here
// You can write your code in this editor
chr_diff = point_distance(Obj_chr.x, Obj_chr.y, x, y);

width = (bbox_bottom - bbox_top)*3/5;
height = (bbox_left - bbox_right)*3/5;
for(var i = -1;i < 2; i++){
	for(var j = -1 ; j < 2; j++){
		if(i == 0 || j == 0) in_sight = collision_line(x + width / 2 * i,y + height / 2 * j,Obj_chr.x,Obj_chr.y,Obj_wall,true,false) == noone;
		if(in_sight) break;
	}
	if(in_sight) break;
}
if(knuckback){
	dx = lengthdir_x(2,point_direction(x,y,Obj_chr.x,Obj_chr.y) - 180);
	dy = lengthdir_y(2,point_direction(x,y,Obj_chr.x,Obj_chr.y) - 180);
} else {
	dx = 0;
	dy = 0;
}
if(stun){
	path_end();	
}

if(hit){
	ac_cnt++;
	var _channel = animcurve_get_channel(ac_hit_scale, 0);
	var _val = animcurve_channel_evaluate(_channel, ac_cnt / 10);
	xscale = sign(xscale) * _val;
	yscale = _val;
} else {
	xscale = sign(xscale) * 1.0;
	yscale = 1.0;
}

anim_maxIndex = image_number;

if(anim_index < (anim_maxIndex) * anim_fps){
	anim_index++;
} else{
	anim_index = 0;
}

real_index = anim_index div anim_fps;

/*
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
}*/
/// @description Insert description here
// You can write your code in this editor

chr_diff = point_distance(Obj_chr.x, Obj_chr.y, x, y);
in_sight = collision_line(x,y,Obj_chr.x,Obj_chr.y,Obj_wall,true,false) == noone;

if(state != states.attack && chr_diff < 60 && in_sight && state_change){
	dx = 0;
	dy = 0;
	state = states.attack_ready;
	state_change = false;
	sp_index = 1;
	alarm[0] = change_delay;
	alarm[1] = change_delay;
}

if(state != states.attack && state != states.attack_ready && chr_diff > 60 && in_sight){
	state = states.move;
	dir = point_direction(x,y,Obj_chr.x,Obj_chr.y);
	state_change = false;
	sp_index = 3;
	alarm[0] = change_delay;
}

if(state == states.attack && state_change){
	pdir = point_direction(x,y,Obj_chr.x,Obj_chr.y);
	var hit = instance_create_layer(x + lengthdir_x(2,pdir), y + lengthdir_y(2,pdir),"instances",Obj_enemy_attackmsk);
	with(hit){
		dir = other.pdir - 270;
	}
	state = states.idle;
	sp_index = 0;
	state_change = false;
	alarm[0] = change_delay;
}

if(state == states.idle && state_change){
	sp_index = 0;
	state_change = false;
	alarm[0] = change_delay / 2;
	alarm[2] = change_delay / 2;
}


if(state == states.move && state_change && !in_sight){
	dir = Scr_ran_dir(x,y);
	sp_index = 0;
	state_change = false;
	alarm[0] = change_delay / 2;
	alarm[3] = change_delay / 2;
}

if(state == states.move && state_change && in_sight){
	sp_index = 3;
	dir = point_direction(x,y,Obj_chr.x,Obj_chr.y);
	state_change = false;
	alarm[0] = change_delay / 2;
	alarm[3] = change_delay / 2;
}

if(state == states.move && !state_change){
	dx = lengthdir_x(1,dir);
	dy = lengthdir_y(1,dir);
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
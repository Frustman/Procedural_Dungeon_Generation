if(!dash){
	if(instance_exists(Obj_controller)){
		dx = lengthdir_x(moveSpeed,Obj_controller.directionBox);
		dy = lengthdir_y(moveSpeed,Obj_controller.directionBox);
	} else{
		dx = 0;
		dy = 0;
	}
} else{
	dx = lengthdir_x(dashSpeed,dashDir);
	dy = lengthdir_y(dashSpeed,dashDir);
}
if(!shoot){
	ds_list_clear(shoot_list);
	ds_list_clear(wall_list);
	_Enemy_num = 0;
	_Wall_num = 0;
}
if(_Enemy_num > 0 && _Wall_num > 0){
	if(point_distance(x,y,shoot_list[|0].x, shoot_list[|0].y) < point_distance(x,y,wall_list[|0].x,wall_list[|0].y)){
		near_id = shoot_list[|0];
		near_inst = "enemy";
	} else{
		near_id = wall_list[|0];
		near_inst = "wall";
	}
}else if(_Enemy_num > 0 && _Wall_num == 0){
	near_id = shoot_list[|0];
	near_inst = "enemy";
}else if(_Enemy_num == 0 && _Wall_num > 0){
	near_id = wall_list[|0];
	near_inst = "wall";
}else{
	near_id = noone;
	near_inst = "noone";
}
AttackTarget = instance_nearest(x,y,Obj_enemy);
if(Scr_get_room_pos(AttackTarget.x, AttackTarget.y) != Scr_get_room_pos(x,y)){
	AttackTarget = noone;
}



anim_maxIndex = image_number;

if(anim_index < (anim_maxIndex) * anim_fps){
	anim_index++;
	if(dash || shoot) anim_index++;
} else{
	anim_index = 0;
}

if(dash){
	dashSpeed -= 0.125;
	clamp(dashSpeed,0,4.5);
}

signX = sign(dx);
signY = sign(dy);

if(signX > 0){
	image_xscale = 1.0;
	LookRight = 1;
}
else if(signX < 0){
	image_xscale = -1.0;
	LookRight = 0;
}

if(Obj_controller.move){
	state = "move";
} else{
	state = "idle";
}

if(!shoot && (Obj_controller.move || dash) && place_empty(x + dx, y, Obj_wall)){
	x += dx;
} else if(Obj_controller.move && !place_empty(x + dx, y, Obj_wall)){
	while(place_free(x + signX / 100, y)){
		x += signX / 100;
	}
}
if(!shoot && (Obj_controller.move || dash) && place_empty(x, y + dy, Obj_wall)){
	y += dy;
} else if(Obj_controller.move && !place_empty(x, y + dy, Obj_wall)){
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
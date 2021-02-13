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

EnemyCount = instance_number(Obj_enemy);
if(EnemyCount > 0){
	ds_priority_clear(enemy_pr);
	with(Obj_enemy){
		ds_priority_add(other.enemy_pr,id,point_distance(x,y,other.x,other.y));
	}
	canTarget = true;
	_target = noone;
	AttackTarget = noone;
	while(canTarget && !ds_priority_empty(enemy_pr)){
		_target = ds_priority_delete_min(enemy_pr);
		if(collision_line(x,y + 8,_target.x,_target.y,Obj_wall,false,false) == noone){
			canTarget = false;
			AttackTarget = _target;
		}
	}
	if(AttackTarget == noone){
		AttackTarget = instance_nearest(x,y,Obj_enemy);
	}
} else {
	AttackTarget = noone;
}
if(AttackTarget != noone && Scr_get_room_pos(AttackTarget.x, AttackTarget.y) != Scr_get_room_pos(x,y)){
	AttackTarget = noone;
}

ds_list_clear(shoot_list);
ds_list_clear(wall_list);

if(AttackTarget != noone && instance_exists(AttackTarget)){
	angle = point_direction(x,y,AttackTarget.x, AttackTarget.y) + random(5) - 2.5;	
} else{
	angle = Obj_controller.directionBox + random(5) - 2.5;
}
if(AttackTarget == noone){
	if(image_xscale = 1.0){
		shootX = x + lengthdir_x(11.3775583264319501,angle + 90 - 79.215702132437);
	} else{
		shootX = x + lengthdir_x(11.3775583264319501,angle - 90 + 79.215702132437);
	}
	if(image_xscale = 1.0){
		shootY = y + lengthdir_y(11.3775583264319501,angle + 90 - 79.215702132437);
	} else{
		shootY = y + lengthdir_y(11.3775583264319501,angle - 90 + 79.215702132437);
	}
} else if(AttackTarget != noone && instance_exists(AttackTarget)){
	if(x < AttackTarget.x){
		shootX = x + lengthdir_x(11.3775583264319501,angle + 90 - 79.215702132437);
	} else{
		shootX = x + lengthdir_x(11.3775583264319501,angle - 90 + 79.215702132437);
	}
	if(x < AttackTarget.x){
		shootY = y + lengthdir_y(11.3775583264319501,angle + 90 - 79.215702132437);
	} else{
		shootY = y + lengthdir_y(11.3775583264319501,angle - 90 + 79.215702132437);
	}
}

anim_maxIndex = image_number;

if(anim_index < (anim_maxIndex) * anim_fps){
	anim_index++;
	if(dash || shoot) anim_index++;
} else{
	anim_index = 0;
}

if(dash){
	dashSpeed -= 0.115;
	clamp(dashSpeed,0,3);
	if(random(1) < 0.2){
		instance_create_layer(x,y+8,"Instances",Obj_dust);
	}
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
	if(footstep){
		footstep = false;
		alarm[2] = 20;
		audio_play_sound(Dirt_footstep_9,0,false);
	}
} else{
	state = "idle";
}

if((Obj_controller.move || dash) && place_empty(x + dx, y, Obj_wall)){
	x += dx;
} else if(Obj_controller.move && !place_empty(x + dx, y, Obj_wall)){
	while(place_free(x + signX / 100, y)){
		x += signX / 100;
	}
}
if((Obj_controller.move || dash) && place_empty(x, y + dy, Obj_wall)){
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
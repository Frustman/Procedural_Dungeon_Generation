image_xscale = sign(image_xscale) * 1.0;
image_yscale = 1.0;


if(!dash){
	if(instance_exists(Obj_controller)){
		dx = lengthdir_x(moveSpeed* (Obj_controller.distanceBox / Obj_controller.boxRadius / 10 * 0.3 + 0.7),Obj_controller.directionBox);
		dy = lengthdir_y(moveSpeed* (Obj_controller.distanceBox / Obj_controller.boxRadius / 10 * 0.3 + 0.7),Obj_controller.directionBox);
	} else{
		dx = 0;
		dy = 0;
	}
} else{
	dx = lengthdir_x(dashSpeed,dashDir);
	dy = lengthdir_y(dashSpeed,dashDir);
}

/*EnemyCount = instance_number(Obj_enemy);
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
ds_list_clear(wall_list);*/

angle = Obj_controller.AttackDirection;

/*if(AttackTarget != noone && instance_exists(AttackTarget)){
	angle = point_direction(x,y,AttackTarget.x, AttackTarget.y) + random(5) - 2.5;	
} else{
	angle = Obj_controller.directionBox + random(5) - 2.5;
}*/


anim_maxIndex = image_number;

if(anim_index < (anim_maxIndex) * anim_fps){
	anim_index++;
	if(shoot) anim_index++;
} else{
	anim_index = 0;
}
if(gun_index < (gun_maxIndex) * gun_fps){
	gun_index++;
}

if(dash){
	dashSpeed -= 0.3;
	if(dashSpeed < 0) dashSpeed = 0;
	if(random(1) < 0.4){
		instance_create_layer(x,y+8,"sort_end",Obj_dust);
	}
	Scr_force_update([dx,dy]);
}

if(sign(dx) > 0){
	image_xscale = 1.0;
	LookRight = 1;
}
else if(sign(dx) < 0){
	image_xscale = -1.0;
	LookRight = 0;
}

if(Obj_controller.move){
	state = "move";
	if(!dash) Scr_force_update([dx,dy]);
} else{
	state = "idle";
}

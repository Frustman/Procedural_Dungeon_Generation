/// @description Insert description here
// You can write your code in this editor

if(bullet_count < bullet_maxCount){
	instance_create_depth(shootX,shootY, -1, Obj_Catridge);
	state = "shoot";
	shoot = true;
	anim_index = 0;
	alarm[1] = 20;
	hitX = shootX + lengthdir_x(600,angle);
	hitY = shootY + lengthdir_y(600,angle);
	bullet_count ++;

	_Enemy_num = collision_line_list(shootX,shootY,shootX+lengthdir_x(600,angle),shootY+lengthdir_y(600,angle),Obj_enemy,true,false,shoot_list,true);
	_Wall_num = collision_line_list(shootX,shootY,shootX+lengthdir_x(600,angle),shootY+lengthdir_y(600,angle),Obj_wall,true,false,wall_list,true);

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
	//Scr_shake(0,0.5);

	if(_Enemy_num > 0 && _Wall_num > 0){
		if(point_distance(shootX,shootY,shoot_list[|0].x,shoot_list[|0].y) < point_distance(shootX,shootY,wall_list[|0].x,wall_list[|0].y)){
			with(shoot_list[|0]){
				hp -= 5;
				AttackBy = other;
			}
			ray_map = Scr_ray_cast([shootX, shootY],angle,shoot_list[|0],true,false,500);
			if(ds_exists(ray_map,ds_type_map)){
				var point = ray_map[?"hitPosition"];
				if(array_length(point)){
					hitX = point[0];
					hitY = point[1];
				}else{
					hitX = shootX;
					hitY = shootY;
				}
			}
		} else{
			ray_map = Scr_ray_cast([shootX, shootY],angle,wall_list[|0],true,false,500);
			if(ds_exists(ray_map,ds_type_map)){
				var point = ray_map[?"hitPosition"];
				if(array_length(point)){
					hitX = point[0];
					hitY = point[1];
				}else{
					hitX = shootX;
					hitY = shootY;
				}
			}
		}
	} else if(_Enemy_num > 0 && _Wall_num == 0){
		with(shoot_list[|0]){
			hp -= 5;	
		}
		ray_map = Scr_ray_cast([shootX, shootY],angle,shoot_list[|0],true,false,500);
		if(ds_exists(ray_map,ds_type_map)){
			var point = ray_map[?"hitPosition"];
			if(array_length(point)){
				hitX = point[0];
				hitY = point[1];
			}else{
				hitX = shootX;
				hitY = shootY;
			}
		}
	} else if(_Enemy_num == 0 && _Wall_num > 0){
		ray_map = Scr_ray_cast([shootX, shootY],angle,wall_list[|0],true,false,500);
		if(ds_exists(ray_map,ds_type_map)){
			var point = ray_map[?"hitPosition"];
			if(array_length(point)){
				hitX = point[0];
				hitY = point[1];
			}else{
				hitX = shootX;
				hitY = shootY;
			}
		}
	}

	var bullet = instance_create_layer(shootX,shootY,"Instances",Obj_bullet);
	
	with(bullet){
		bullet_type = "normal";
		shake = false;
		targetX = other.hitX;
		targetY = other.hitY;
	}
} else if(bullet_count == bullet_maxCount){
	instance_create_depth(shootX,shootY, -1, Obj_Catridge);
	state = "shoot";
	shoot = true;
	anim_index = 0;
	alarm[1] = 20;
	hitX = shootX + lengthdir_x(600,angle);
	hitY = shootY + lengthdir_y(600,angle);

	_Enemy_num = collision_line_list(shootX,shootY,shootX+lengthdir_x(600,angle),shootY+lengthdir_y(600,angle),Obj_enemy,true,false,shoot_list,true);
	_Wall_num = collision_line_list(shootX,shootY,shootX+lengthdir_x(600,angle),shootY+lengthdir_y(600,angle),Obj_wall,true,false,wall_list,true);

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

	if(_Enemy_num > 0 && _Wall_num > 0){
		if(point_distance(shootX,shootY,shoot_list[|0].x,shoot_list[|0].y) < point_distance(shootX,shootY,wall_list[|0].x,wall_list[|0].y)){
			with(shoot_list[|0]){
				hp -= 5;
				AttackBy = other;
				knuckback = true;
				stun = true;
				alarm[0] = 5;
				alarm[1] = 45;
			}
			ray_map = Scr_ray_cast([shootX, shootY],angle,shoot_list[|0],true,false,500);
			if(ds_exists(ray_map,ds_type_map)){
				var point = ray_map[?"hitPosition"];
				if(array_length(point)){
					hitX = point[0];
					hitY = point[1];
				}else{
					hitX = shootX;
					hitY = shootY;
				}
			}
		} else{
			ray_map = Scr_ray_cast([shootX, shootY],angle,wall_list[|0],true,false,500);
			if(ds_exists(ray_map,ds_type_map)){
				var point = ray_map[?"hitPosition"];
				if(array_length(point)){
					hitX = point[0];
					hitY = point[1];
				}else{
					hitX = shootX;
					hitY = shootY;
				}
			}
		}
	} else if(_Enemy_num > 0 && _Wall_num == 0){
		with(shoot_list[|0]){
			hp -= 5;	
			knuckback = true;
			stun = true;
			alarm[0] = 5;
			alarm[1] = 15;
		}
		ray_map = Scr_ray_cast([shootX, shootY],angle,shoot_list[|0],true,false,500);
		if(ds_exists(ray_map,ds_type_map)){
			var point = ray_map[?"hitPosition"];
			if(array_length(point)){
				hitX = point[0];
				hitY = point[1];
			}else{
				hitX = shootX;
				hitY = shootY;
			}
		}
	} else if(_Enemy_num == 0 && _Wall_num > 0){
		ray_map = Scr_ray_cast([shootX, shootY],angle,wall_list[|0],true,false,500);
		if(ds_exists(ray_map,ds_type_map)){
			var point = ray_map[?"hitPosition"];
			if(array_length(point)){
				hitX = point[0];
				hitY = point[1];
			}else{
				hitX = shootX;
				hitY = shootY;
			}
		}
	}

	var bullet = instance_create_layer(shootX,shootY,"Instances",Obj_bullet);
	
	with(bullet){
		Scr_shake(1,0.7);
		bullet_type = "strong";
		shake = true;
		targetX = other.hitX;
		targetY = other.hitY;
	}
	bullet_count = 0;
}
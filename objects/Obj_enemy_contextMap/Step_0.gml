/// @description Insert description here
// You can write your code in this editor
event_inherited();
player_dist = point_distance(Obj_chr.x,Obj_chr.y,x,y);



if(hp <= 0){
	with(instance_create_layer(x,y,"Instances",Obj_corpse)){
		spr = Spr_slime_dead;
		dir = point_direction(Obj_chr.x,Obj_chr.y,other.x,other.y);
	}
	instance_destroy(self);
}

context_val++;
atk_gage++;

if(atk_gage > atk_max_gage){
	if(player_dist <= atk_range){
		/*with(instance_create_layer(x,y,"sort_start",Obj_projectile_slime)){
			motion_set(point_direction(x,y,Obj_chr.x,Obj_chr.y + 12),2);
			image_angle = point_direction(x,y,Obj_chr.x,Obj_chr.y + 12);
		}*/	
	}
	atk_gage = 0;
}

if(context_val >= context_interval) context_val = 0;
if(context_val == 0){
	if(player_dist > strafe_range) state = ai_state.chase;
	else if(player_dist <= strafe_range && player_dist >= strafe_range - 10) state = ai_state.strafe;
	else if(player_dist < strafe_range - 10) state = ai_state.backward;

	max_val = -999;
	max_idx = 0;

	max_val_dir = -999;
	max_idx_dir = 0;

	var normal = point_direction(Obj_chr.x,Obj_chr.y,x,y);
	
	for(var i = 0; i < ray_count; i++){
		context_map[i] = 0;	
		context_dangerous[i] = false;
		
		var x1 = lengthdir_x(1,normal);
		var y1 = lengthdir_y(1,normal);
		var x2 = context_dir[i][0];
		var y2 = context_dir[i][1];
		
		var dot = (x1 * x2 + y1 * y2);
		if(state == ai_state.backward) context_map[i] =  (1.0 - abs(dot - 0.9)) * 2;
		if(state == ai_state.strafe) context_map[i] = (1.0 - abs(dot)) * 2;
		if(state == ai_state.chase) context_map[i] = 1.0 - (dot);
	
	
		if(collision_line(x,y,x + lengthdir_x(abs(context_map[i] * ray_distance),context_dir[i][2]),y + lengthdir_y(abs(context_map[i] * ray_distance),context_dir[i][2]),Obj_enemy,true,true) != noone || collision_line(x,y,x + lengthdir_x(abs(context_map[i] * ray_distance),context_dir[i][2]),y + lengthdir_y(abs(context_map[i] * ray_distance),context_dir[i][2]),Obj_wall,true,true) != noone){
		//if(collision_line(x,y,x + lengthdir_x(abs(context_map[i] * ray_distance),context_dir[i][2]),y + lengthdir_y(abs(context_map[i] * ray_distance),context_dir[i][2]),Obj_wall,false,true) != noone){
			context_dangerous[i] = true;
		}
	
		context_left[i] = false;
		if(!context_dangerous[i]){
			if(context_map[i] > max_val){
				max_idx = i;
				max_val = context_map[i];
			}
		}
	}


	force[0] = 0;
	force[1] = 0;


	var st = round(point_direction(x,y,Obj_chr.x,Obj_chr.y) / ( 360 / ray_count));

	if(ray_left == true){
		for(var i = st; i < st + ray_count div 2; i++){
			if(!context_dangerous[i % ray_count]){
				if(context_map[i % ray_count] > max_val_dir){
					max_idx_dir = i % ray_count;
					max_val_dir = context_map[i % ray_count];
				}
			}
			context_left[i % ray_count] = true;
		}
	} else {
		for(var i = st + ray_count div 2; i < st + ray_count; i++){
			if(!context_dangerous[i % ray_count]){
				if(context_map[i % ray_count] > max_val_dir){
					max_idx_dir = i % ray_count;
					max_val_dir = context_map[i % ray_count];
				}
			}
			context_left[i % ray_count] = true;
		}
	}
	if(abs(max_val_dir - max_val) >= 0.75) ray_left = !ray_left;
}

dir_ideal[0] = context_dir[max_idx_dir][0];
dir_ideal[1] = context_dir[max_idx_dir][1];

// check big size

plus_ray[0] = false;
plus_ray[1] = false;

if(state == ai_state.chase){
	var ideal_ppd = context_dir[max_idx_dir][2] - 90;
	var x_ppd = lengthdir_x(sprite_rad,ideal_ppd);
	var y_ppd = lengthdir_y(sprite_rad,ideal_ppd);

	var x_ray = lengthdir_x(abs(context_map[max_idx_dir] * ray_distance),context_dir[max_idx_dir][2]);
	var y_ray = lengthdir_y(abs(context_map[max_idx_dir] * ray_distance),context_dir[max_idx_dir][2]);

	if(collision_line(x + x_ppd, y + y_ppd, x + x_ppd + x_ray, y + y_ppd + y_ray, Obj_wall, true, true) != noone){
		plus_ray[0] = true;
		dir_ideal[0] += lengthdir_x(0.7, ideal_ppd + 180);
		dir_ideal[1] += lengthdir_y(0.7, ideal_ppd + 180);
	}

	if(collision_line(x - x_ppd, y - y_ppd, x - x_ppd + x_ray, y - y_ppd + y_ray, Obj_wall, true, true) != noone){
		plus_ray[1] = true;
		dir_ideal[0] += lengthdir_x(0.7, ideal_ppd);
		dir_ideal[1] += lengthdir_y(0.7, ideal_ppd);
	}
} else if(state == ai_state.strafe){
	var ideal_ppd = context_dir[max_idx_dir][2] - 90;
	var x_ppd = lengthdir_x(sprite_rad,ideal_ppd);
	var y_ppd = lengthdir_y(sprite_rad,ideal_ppd);

	var x_ray = lengthdir_x(abs(context_map[max_idx_dir] * ray_distance),context_dir[max_idx_dir][2]);
	var y_ray = lengthdir_y(abs(context_map[max_idx_dir] * ray_distance),context_dir[max_idx_dir][2]);

	if(collision_line(x + x_ppd, y + y_ppd, x + x_ppd + x_ray, y + y_ppd + y_ray, Obj_wall, true, true) != noone){
		plus_ray[0] = true;
		dir_ideal[0] += lengthdir_x(0.3, ideal_ppd + 180);
		dir_ideal[1] += lengthdir_y(0.3, ideal_ppd + 180);
	}

	if(collision_line(x - x_ppd, y - y_ppd, x - x_ppd + x_ray, y - y_ppd + y_ray, Obj_wall, true, true) != noone){
		plus_ray[1] = true;
		dir_ideal[0] += lengthdir_x(0.3, ideal_ppd);
		dir_ideal[1] += lengthdir_y(0.3, ideal_ppd);
	}
}
//

force[0] = dir_ideal[0] - dir[0];
force[1] = dir_ideal[1] - dir[1];

dir[0] += force[0] / 6;
dir[1] += force[1] / 6;

var force_dir = point_direction(0,0,dir[0],dir[1]);


/*if(dir > 360) dir -= 360;
if(dir < 0) dir = 360;
dir = lerp(dir, dir_ideal, 0.1);*/
if(state == ai_state.backward) _speed  = 1;
else _speed = 0.6;

Scr_force_update([lengthdir_x(_speed,force_dir), lengthdir_y(_speed, force_dir)]);
//motion_set(force_dir,_speed);

if(Obj_chr.x < x){
	xscale *= (sign(xscale) == 1) ? 1 : -1;
} else {
	xscale *= (sign(xscale) == 1) ? -1 : 1;
}
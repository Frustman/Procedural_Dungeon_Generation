/// @description Insert description here
// You can write your code in this editor
event_inherited();
player_dist = point_distance(Obj_chr.x,Obj_chr.y,x,y);

if(player_dist > strafe_range) state = "chase";
if(player_dist <= strafe_range && player_dist >= strafe_range - 5) state = "strafe";
if(player_dist < strafe_range - 5) state = "safe";



if(hp <= 0){
	with(instance_create_layer(x,y,"Instances",Obj_corpse)){
		spr = Spr_slime_dead;
		dir = point_direction(Obj_chr.x,Obj_chr.y,other.x,other.y);
	}
	instance_destroy(self);
}

context_val++;

if(context_val >= context_interval) context_val = 0;
if(context_val == 0){
	max_val = -999;
	max_idx = 0;

	max_val_dir = -999;
	max_idx_dir = 0;

	var _dir = point_direction(Obj_chr.x,Obj_chr.y,x,y);

	for(var i = 0; i < ray_count; i++){
		context_map[i] = 0;	
		context_dangerous[i] = false;
	
			
		var x1 = lengthdir_x(1,_dir);
		var y1 = lengthdir_y(1,_dir);
			
		if(player_dist <= strafe_range - 3 && player_dist >= strafe_range - 5){
			x1 = lengthdir_x(1,_dir + 90);	
			y1 = lengthdir_y(1,_dir + 90);	
		}
		var x2 = context_dir[i][0];
		var y2 = context_dir[i][1];
		var dot = (x1 * x2 + y1 * y2);
		if(state == "safe") context_map[i] =  1.0 - abs(dot - 0.9);
		if(state == "strafe") context_map[i] = 1.0 - abs(dot);
		if(state == "chase") context_map[i] = 1.0 - (dot);
	
	
		if(collision_line(x,y,x + lengthdir_x(abs(context_map[i] * ray_distance),context_dir[i][2]),y + lengthdir_y(abs(context_map[i] * ray_distance),context_dir[i][2]),Obj_enemy,false,true) != noone || collision_line(x,y,x + lengthdir_x(abs(context_map[i] * ray_distance),context_dir[i][2]),y + lengthdir_y(abs(context_map[i] * ray_distance),context_dir[i][2]),Obj_wall,false,true) != noone){
			context_dangerous[i] = true;
		}
	
	
		if(!context_dangerous[i]){
			if(context_map[i] > max_val_dir){
				max_idx_dir = i;
				max_val_dir = context_map[i];
			}
		}
	}


	force[0] = 0;
	force[1] = 0;


	var st = point_direction(x,y,Obj_chr.x,Obj_chr.y) div( 360 / ray_count );

	if(ray_left == true){
		for(var i = st; i < st + ray_count div 2; i++){
			if(!context_dangerous[i % ray_count]){
				if(context_map[i % ray_count] > max_val){
					max_idx = i % ray_count;
					max_val = context_map[i % ray_count];
				}
			}
		}
	} else {
		for(var i = st + ray_count div 2 + 1; i <= st + ray_count; i++){
			if(!context_dangerous[i % ray_count]){
				if(context_map[i % ray_count] > max_val){
					max_idx = i % ray_count;
					max_val = context_map[i % ray_count];
				}
			}
		}
	}
	if(max_val_dir - max_val >= 0.5) ray_left = !ray_left;

}

dir_ideal[0] = context_dir[max_idx][0];
dir_ideal[1] = context_dir[max_idx][1];

force[0] = dir_ideal[0] - dir[0];
force[1] = dir_ideal[1] - dir[1];

dir[0] += force[0] / 6;
dir[1] += force[1] / 6;

var force_dir = point_direction(0,0,dir[0],dir[1]);


/*if(dir > 360) dir -= 360;
if(dir < 0) dir = 360;
dir = lerp(dir, dir_ideal, 0.1);*/
if(state == "safe") _speed  = 1;
else _speed = 0.6;

Scr_force_update([lengthdir_x(_speed,force_dir), lengthdir_y(_speed, force_dir)]);
//motion_set(force_dir,_speed);

	if(Obj_chr.x < x){
		xscale *= (sign(xscale) == 1) ? 1 : -1;
	} else {
		xscale *= (sign(xscale) == 1) ? -1 : 1;
	}
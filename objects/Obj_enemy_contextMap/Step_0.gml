/// @description Insert description here
// You can write your code in this editor
event_inherited();
player_dist = point_distance(Obj_chr.x,Obj_chr.y,x,y);

if(player_dist > 50) state = "chase";
if(player_dist <= 50 && player_dist >= 45) state = "strafe";
if(player_dist < 45) state = "safe";

if(hp <= 0){
	with(instance_create_layer(x,y,"Instances",Obj_corpse)){
		spr = Spr_slime_dead;
		dir = point_direction(Obj_chr.x,Obj_chr.y,other.x,other.y);
	}
	instance_destroy(self);
}
for(var i = 0; i < ray_count; i++){
	context_map[i] = 0;	
	context_dangerous[i] = false;
}
with(Obj_chr){
	if(!(x == other.x && y == other.y)){
		for(var i = 0; i < other.ray_count; i++){
			var _dir = point_direction(x,y,other.x,other.y);
			
			var x1 = lengthdir_x(1,_dir);
			var y1 = lengthdir_y(1,_dir);
			
			if(other.player_dist <= 47 && other.player_dist >= 45){
				x1 = lengthdir_x(1,_dir + 90);	
				y1 = lengthdir_y(1,_dir + 90);	
			}
			var x2 = other.context_dir[i][0];
			var y2 = other.context_dir[i][1];
			var dot = (x1 * x2 + y1 * y2);
			if(other.state == "safe") other.context_map[i] =  1.0 - abs(dot - 0.65);
			if(other.state == "strafe") other.context_map[i] = 1.0 - (dot);
			if(other.state == "chase") other.context_map[i] = 1.0 - (dot);
		}
	}
}
for(var i = 0; i < ray_count; i++){
	if(collision_line(x,y,x + lengthdir_x(context_map[i] * 10,context_dir[i][2]),y + lengthdir_y(context_map[i] * 10,context_dir[i][2]),Obj_enemy,false,true) != noone || collision_line(x,y,x + lengthdir_x(context_map[i] * 10,context_dir[i][2]),y + lengthdir_y(context_map[i] * 10,context_dir[i][2]),Obj_wall,false,true) != noone){
		context_dangerous[i] = true;
	}
}

force[0] = 0;
force[1] = 0;

max_val = -999;
max_idx = 0;

for(var i = 0; i < ray_count; i++){
	if(!context_dangerous[i]){
		if(context_map[i] > max_val){
			max_idx = i;
			max_val = context_map[i];
		}
	}
}

dir_ideal[0] = context_dir[max_idx][0];
dir_ideal[1] = context_dir[max_idx][1];

force[0] = dir_ideal[0] - dir[0];
force[1] = dir_ideal[1] - dir[1];

dir[0] += force[0] / 6;
dir[1] += force[1] / 6;


/*if(dir > 360) dir -= 360;
if(dir < 0) dir = 360;
dir = lerp(dir, dir_ideal, 0.1);*/

motion_set(point_direction(0,0,dir[0],dir[1]),_speed);

	if(Obj_chr.x < x){
		xscale *= (sign(xscale) == 1) ? 1 : -1;
	} else {
		xscale *= (sign(xscale) == 1) ? -1 : 1;
	}
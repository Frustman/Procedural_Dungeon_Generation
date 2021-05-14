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
for(var i = 0; i < ray_count; i++) context_map[i] = 0;
with(Obj_chr){
	if(!(x == other.x && y == other.y)){
		for(var i = 0; i < other.ray_count; i++){
			var _dir = point_direction(x,y,other.x,other.y);
			var dist = point_distance(x,y,other.x,other.y);
			
			var x1 = lengthdir_x(1,_dir);
			var y1 = lengthdir_y(1,_dir);
			
			var x2 = lengthdir_x(1,other.context_dir[i]);
			var y2 = lengthdir_y(1,other.context_dir[i]);
			var dot = dot_product(x1,y1,x2,y2);
			
			
			//if(state == ai_state.friendly) other.context_friendly[i] =  1.0 - abs(dot - 0.65);
			//if(state == ai_state.aggressive) other.context_aggressive[i] = (1.0 - (dot)) / 2;
			
			//other.context_map[i] += (1.0 - abs(dot - 0.65)) / dist;
			other.context_map[i] += (1.0 - (dot));
			
			
		}
	}
}

ds_list_clear(wall_list);

collision_circle_list(x,y,10,Obj_wall32,false,false,wall_list,false);

for(var i = 0; i < ds_list_size(wall_list); i++){
	for(var j = 0; j < other.ray_count; j++){
		var _dir = point_direction(wall_list[|i].x,wall_list[|i].y,x,y);
		var dist = point_distance(x,y,wall_list[|i].x,wall_list[|i].y);
			
		var x1 = lengthdir_x(1,_dir);
		var y1 = lengthdir_y(1,_dir);
			
		var x2 = lengthdir_x(1,context_dir[j]);
		var y2 = lengthdir_y(1,context_dir[j]);
		var dot = dot_product(x1,y1,x2,y2);
		
		if(dist >= 5)	other.context_map[j] += (1.0 - abs(dot - 0.65));
		else			other.context_map[j] += (1.0 - abs(dot - 0.65)) / dist * 5;
	}
}/*
with(Obj_wall32){
	if(!(x == other.x && y == other.y)){
		for(var i = 0; i < other.ray_count; i++){
			var _dir = point_direction(x,y,other.x,other.y);
			var dist = point_distance(x,y,other.x,other.y);
			
			var x1 = lengthdir_x(1,_dir);
			var y1 = lengthdir_y(1,_dir);
			
			var x2 = lengthdir_x(1,other.context_dir[i]);
			var y2 = lengthdir_y(1,other.context_dir[i]);
			var dot = dot_product(x1,y1,x2,y2);
			
			
			//if(state == ai_state.friendly) other.context_friendly[i] =  1.0 - abs(dot - 0.65);
			//if(state == ai_state.aggressive) other.context_aggressive[i] = (1.0 - (dot)) / 2;
			
			//other.context_map[i] += (1.0 - abs(dot - 0.65)) / dist / dist;
			//other.context_map[i] += (1.0 - (dot)) / dist;
			
			
		}
	}
}*/
var maxval = -1;
maxidx = -1;
for(var i = 0; i < ray_count; i++){
	//context_map[i] = 0;
	//context_map[i] = context_friendly[i] + context_aggressive[i];
	if(context_map[i] >= maxval){
		maxidx = i;
		maxval = context_map[i];
	}
}
for(var i = 0; i < ray_count; i++){
	context_map[i] /= maxval;
}


motion_set(context_dir[maxidx],_speed);

	if(Obj_chr.x < x){
		xscale *= (sign(xscale) == 1) ? 1 : -1;
	} else {
		xscale *= (sign(xscale) == 1) ? -1 : 1;
	}
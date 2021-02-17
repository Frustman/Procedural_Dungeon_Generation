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
for(var i = 0; i < 16; i++){
	context_map[i] = 0;	
	context_dangerous[i] = false;
}
with(Obj_chr){
	if(!(x == other.x && y == other.y)){
		for(var i = 0; i < 16; i++){
			var dot = dot_product(x - other.x, y - other.y, other.context_dir[i][0], other.context_dir[i][1]) / point_distance(x,y,other.x,other.y) / point_distance(0,0,other.context_dir[i][0],other.context_dir[i][1]);
			other.context_map[i] = max(dot,0);
		}
	}
}
for(var i = 0; i < 16; i++){
	if(collision_line(x,y,x + lengthdir_x(max_distance,context_dir[i][2]),y + lengthdir_y(max_distance,context_dir[i][2]),Obj_enemy,false,true) != noone){
		context_dangerous[i] = true;
	}
}

final_dir[0] = 0;
final_dir[1] = 0;

for(var i = 0; i < 16; i++){
	if(!context_dangerous[i]){
		final_dir[0] += context_map[i] * context_dir[i][0];
		final_dir[1] += context_map[i] * context_dir[i][1];
	}
}
var dir = point_direction(0,0,final_dir[0],final_dir[1]);
var dist = point_distance(0,0,final_dir[0],final_dir[1]);
motion_set(dir,_speed);

	if(final_dir[0] < 0){
		xscale *= (sign(xscale) == 1) ? 1 : -1;
	} else {
		xscale *= (sign(xscale) == 1) ? -1 : 1;
	}
/// @description Insert description here
// You can write your code in this editor
event_inherited();
var player_dist = point_distance(Obj_chr.x,Obj_chr.y,x,y);

if(hp <= 0){
	with(instance_create_layer(x,y,"Instances",Obj_corpse)){
		spr = Spr_slime_dead;
		dir = point_direction(Obj_chr.x,Obj_chr.y,other.x,other.y);
	}
	instance_destroy(self);
}
if(player_dist >= 90){
	if(mp_grid_path(path_grid,player_path,x,y,Obj_chr.x,Obj_chr.y + 8,1)){
		targetX = path_get_point_x(player_path,1);
		targetY = path_get_point_y(player_path,1);
	}
	if(targetX < x){
		xscale *= (sign(xscale) == 1) ? 1 : -1;
	} else {
		xscale *= (sign(xscale) == 1) ? -1 : 1;
	}
	if(!stun) mp_potential_step_object(targetX,targetY,0.5,Obj_wall);
} else {
	if(!attack_delay){
		with(instance_create_layer(x,y,"Instances",Obj_projectile_slime)){
			motion_set(point_direction(x,y,Obj_chr.x,Obj_chr.y),1);
			image_angle = point_direction(x,y,Obj_chr.x,Obj_chr.y);
		}
		attack_delay = true;
		alarm[0] = 60;
	}
}
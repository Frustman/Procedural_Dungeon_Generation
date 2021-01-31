/// @description Insert description here
// You can write your code in this editor
event_inherited();


if(hp <= 0){
	with(instance_create_layer(x,y,"Instances",Obj_corpse)){
		spr = Spr_slime_dead;
		dir = point_direction(Obj_chr.x,Obj_chr.y,other.x,other.y);
	}
	instance_destroy(self);
}
if(mp_grid_path(path_grid,player_path,x,y,Obj_chr.x,Obj_chr.y + 8,1)){
	targetX = path_get_point_x(player_path,1);
	targetY = path_get_point_y(player_path,1);
}
if(targetX < x){
	image_xscale = 1.0;
} else {
	image_xscale = -1.0;
}
if(!stun) mp_potential_step_object(targetX,targetY,1,Obj_wall);
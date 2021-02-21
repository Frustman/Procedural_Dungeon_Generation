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


_angle += Scr_perlin_noise_1d(seed + current_time / 100);
_speed = 0.3;

motion_set(_angle,_speed);

if(lengthdir_x(1,_angle) < 0){
	xscale *= (sign(xscale) == 1) ? 1 : -1;
} else {
	xscale *= (sign(xscale) == 1) ? -1 : 1;
}
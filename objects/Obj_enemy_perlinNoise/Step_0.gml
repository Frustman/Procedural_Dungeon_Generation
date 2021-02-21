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

if(!relax) _speed = lerp(_speed, 0.3, random(0.05) + 0.07);
else _speed = 0;


if(point_distance(x,y,spawnX,spawnY) >= spawn_radius){
	_angle = lerp(_angle,point_direction(x,y,spawnX,spawnY),0.1);
}
_angle += Scr_perlin_noise_1d(seed + current_time / 100);
motion_set(_angle,_speed);


if(instance_place(x + lengthdir_x(10,_angle), y + lengthdir_y(10,_angle),Obj_wall)){
	_angle = lerp(_angle,point_direction(x,y,spawnX,spawnY), 0.1);
}


if(lengthdir_x(1,_angle) < 0){
	xscale *= (sign(xscale) == 1) ? 1 : -1;
} else {
	xscale *= (sign(xscale) == 1) ? -1 : 1;
}
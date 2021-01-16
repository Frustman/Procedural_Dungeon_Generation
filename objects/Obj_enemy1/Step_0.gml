/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(chr_diff > 45 && in_sight){
	targetX = Obj_chr.x;
	targetY = Obj_chr.y;
	targeted = true;
	state = states.move;
}
if(chr_diff <= 45 && in_sight && state != states.attack_ready && state != states.attack && state_change){
	state = states.attack_ready;
	state_change = false;
	alarm[2] = 60;
}

if(hp <= 0){
	with(instance_create_layer(x,y,"Instances",Obj_corpse)){
		spr = Spr_slime_dead;
		dx = lengthdir_x(10,point_direction(other.AttackBy.x,other.AttackBy.y,other.x,other.y));
		dy = lengthdir_y(10,point_direction(other.AttackBy.x,other.AttackBy.y,other.x,other.y));
	}
	instance_destroy(self);
}

if(state == states.attack_ready && state_change){
	state = states.attack;
	var inst = instance_create_layer(x,y,"Instances",Obj_enemy_attackmsk);
	pdir = point_direction(x,y,Obj_chr.x,Obj_chr.y);
	with(inst){
		dir = other.pdir;
	}
	state_change = false;
	alarm[3] = 30;
}

if(state == states.move && targeted && !stun){
	image_speed = 1.0;
	if(x < Obj_chr.x){
		image_xscale = -1.0;	
	}else{
		image_xscale = 1.0;	
	}
	if(point_distance(x,y,targetX,targetY) >= 16){
		sp_index = 3;
		mp_potential_step_object(targetX,targetY,1,Obj_wall);
	} else{
		sp_index = 0;
		targetX = x;
		targetY = y;
		targeted = false;
	}
}
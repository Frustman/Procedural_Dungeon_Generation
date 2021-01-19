/// @description Insert description here
// You can write your code in this editor
event_inherited();

var playerX = Obj_chr.x;
var playerY = Obj_chr.y;


if(in_sight && (state == states.move || state == states.idle) && state_change){
	if(x < playerX){
		image_xscale = -1.0;	
	}else{
		image_xscale = 1.0;	
	}
	state_change = false;
	ray_map = Scr_ray_cast([x, y],point_direction(x,y,playerX,playerY),Obj_wall,true,false,500);
	if(ds_exists(ray_map,ds_type_map)){
		var point = ray_map[?"hitPosition"];
		if(array_length(point)){
			targetX = point[0];
			targetY = point[1];
		}else{
			targetX = playerX;
			targetY = playerY;
		}
	}
	if(point_distance(x,y,targetX,targetY) >= point_distance(x,y,playerX,playerY)){
		state = states.attack_ready;
		sprite_index = Spr_wildpig_attack_ready;
	} else{
		state = states.move;
		targetX = playerX;
		targetY = playerY;
		sprite_index = Spr_wildpig_attack;
	}
	targeted = true;
	alarm[2] = 120;
}

if(hp <= 0){
	with(instance_create_layer(x,y,"Instances",Obj_corpse)){
		spr = Spr_wildpig_dead;
		dir = point_direction(Obj_chr.x,Obj_chr.y,other.x,other.y);
	}
	instance_destroy(self);
}

if(state == states.attack_ready && state_change){
	state = states.attack;
	sprite_index = Spr_wildpig_attack;
	state_change = false;
}

if(state == states.attack && targeted){
	if(point_distance(x,y,targetX,targetY) >= 32){
		if(x < targetX){
			image_xscale = -1.0;	
		}else{
			image_xscale = 1.0;	
		}
		mp_potential_step_object(targetX,targetY,4.5,Obj_wall);
		if(random(1) < 0.2){
			instance_create_layer(x,y+16,"Instances",Obj_dust);
		}
	} else{
		targetX = x;
		targetY = y;
		targeted = false;
		state_change = false;
		alarm[2] = 120;
		state = states.idle;
		sprite_index = Spr_wildpig_idle;
	}
}

if(state == states.move && targeted && !stun){
	image_speed = 1.0;
	sprite_index = Spr_wildpig_attack;
	if(point_distance(x,y,targetX,targetY) >= 16){
		mp_potential_step_object(targetX,targetY,1,Obj_wall);
	} else{
		targetX = x;
		targetY = y;
		targeted = false;
	}
}
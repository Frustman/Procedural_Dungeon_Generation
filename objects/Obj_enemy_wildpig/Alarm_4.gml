/// @description Insert description here
// You can write your code in this editor
state_change = true;
var tX = targetX;
var tY = targetY;
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
	targetX = tX;
	targetY = tY;
	sprite_index = Spr_wildpig_attack;
}
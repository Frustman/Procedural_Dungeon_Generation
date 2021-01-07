/// @description Insert description here
// You can write your code in this editor
if(AttackTarget != noone){
	angle = point_direction(x,y,AttackTarget.x, AttackTarget.y);	
} else{
	angle = Obj_controller.directionBox;
}
if(image_xscale = 1.0){
	shootX = x + lengthdir_x(21.3775583264319501,angle + 90 - 79.215702132437);
} else{
	shootX = x + lengthdir_x(21.3775583264319501,angle - 90 + 79.215702132437);
}
if(image_xscale = 1.0){
	shootY = y + lengthdir_y(21.3775583264319501,angle + 90 - 79.215702132437);
} else{
	shootY = y + lengthdir_y(21.3775583264319501,angle - 90 + 79.215702132437);
}
	
instance_create_depth(shootX,shootY, -1, Obj_Catridge);
state = "shoot";
shoot = true;
anim_index = 0;
alarm[1] = 20;

_Enemy_num = collision_line_list(shootX,shootY,x+lengthdir_x(600,angle),y+lengthdir_y(600,angle),Obj_enemy,true,false,shoot_list,true);
_Wall_num = collision_line_list(shootX,shootY,x+lengthdir_x(600,angle),y+lengthdir_y(600,angle),Obj_wall,true,false,wall_list,true);
if(_Enemy_num > 0 && _Wall_num > 0){
	if(point_distance(shootX,shootY,shoot_list[|0].x,shoot_list[|0].y) < point_distance(shootX,shootY,wall_list[|0].x,wall_list[|0].y)){
		with(shoot_list[|0]){
			hp -= 5;
			Scr_shake(0.5,0.5);
		}
	}
} else if(_Enemy_num > 0 && _Wall_num == 0){
	with(shoot_list[|0]){
		hp -= 5;	
		Scr_shake(0.5,0.5);
	}
}
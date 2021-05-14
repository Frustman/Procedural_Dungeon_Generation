/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(Spr_controlBox, 0, boxCenterX, boxCenterY,4.0,4.0,0,c_white,1);

draw_sprite(Spr_info, 0, infoCenterX, infoCenterY);
draw_sprite(Spr_DashBox, 0, dashCenterX, dashCenterY);
draw_sprite_ext(Spr_controlBox, 0, AttackCenterX, AttackCenterY,4.0,4.0,0,c_white,1);

draw_sprite_ext(Spr_controller, 0, boxCenterX + lengthdir_x(min(distanceBox, boxRadius), directionBox), boxCenterY + lengthdir_y(min(distanceBox, boxRadius), directionBox),4.0,4.0,0,c_white,1);
draw_sprite_ext(Spr_Attack, 0, AttackCenterX + lengthdir_x(min(AttackDistance, AttackRadius), AttackDirection), AttackCenterY + lengthdir_y(min(AttackDistance, AttackRadius), AttackDirection),4.0,4.0,0,c_white,1);

/// @description Insert description here
// You can write your code in this editor

draw_sprite(Spr_controlBox, 0, boxCenterX, boxCenterY);
draw_sprite(Spr_controller, 0, boxCenterX + lengthdir_x(min(distanceBox, boxRadius), directionBox), boxCenterY + lengthdir_y(min(distanceBox, boxRadius), directionBox));
draw_sprite(Spr_controller, 0, AttackCenterX + lengthdir_x(min(AttackDistance, AttackRadius), AttackDirection), AttackCenterY + lengthdir_y(min(AttackDistance, AttackRadius), AttackDirection));

draw_text(0,400,attackIndex);

draw_sprite(Spr_DashBox, 0, dashCenterX, dashCenterY);
draw_sprite(Spr_AttackBox, 0, AttackCenterX, AttackCenterY);

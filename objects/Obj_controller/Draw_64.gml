/// @description Insert description here
// You can write your code in this editor

draw_sprite(Spr_controlBox, 0, boxCenterX, boxCenterY);
draw_sprite(Spr_controller, 0, boxCenterX + lengthdir_x(min(distanceBox, boxRadius), directionBox), boxCenterY + lengthdir_y(min(distanceBox, boxRadius), directionBox));

draw_sprite(Spr_DashBox, 0, dashCenterX, dashCenterY);
draw_sprite(Spr_AttackBox, 0, AttackCenterX, AttackCenterY);

draw_text(0,200,view_wport[0]);
draw_text(0,210,view_hport[0]);
draw_text(0,220,surface_get_width(application_surface));
draw_text(0,230,surface_get_height(application_surface));
draw_text(display_get_width(),display_get_height(),"1");
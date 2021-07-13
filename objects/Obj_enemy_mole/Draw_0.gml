/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,0,c_white,1.0);
shader_reset();

draw_text(x,y+10,state_name);
draw_text(x,y+30,FA_stop);
draw_text(x,y+50,FA_angle);
draw_text(x,y+70,point_direction(x,y,FA_center_x,FA_center_y));

draw_circle(FA_center_x,FA_center_y,FA_center_radius,true);
draw_set_color(c_blue);
draw_line(x,y,x+lengthdir_x(15,FA_angle), y + lengthdir_y(15,FA_angle));
draw_set_color(c_red);
var dir = point_direction(x,y,FA_center_x,FA_center_y);
draw_line(x,y,x+lengthdir_x(15,dir), y + lengthdir_y(15,dir));
draw_set_color(c_white);
/// @description Insert description here
// You can write your code in this editor
shader_reset();
if(cnt <= 3 || cnt >= 10) draw_set_color(c_black);
draw_line_width(x + lengthdir_x(width_val / 2,angle + 180),y + lengthdir_y(width_val / 2,angle + 180),x + lengthdir_x(width_val / 2,angle),y + lengthdir_y(width_val / 2,angle),height_val);
draw_set_color(c_white);
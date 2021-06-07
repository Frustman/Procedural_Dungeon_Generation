/// @description Insert description here
// You can write your code in this editor
var xpos = parent.x;
var ypos = parent.y;

draw_set_font(Font_ui);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_text(xpos, ypos, buff);
draw_text(xpos, ypos + 20, dialog);
draw_set_color(c_white);

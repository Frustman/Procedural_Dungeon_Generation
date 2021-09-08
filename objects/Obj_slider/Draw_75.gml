/// @description Insert description here
// You can write your code in this editor

var slider_xS	= slider_x - slider_width / 2;
var slider_xE	= slider_x + slider_width / 2;
var slider_yS	= slider_y - slider_height / 2;
var slider_yE	= slider_y + slider_height / 2;

var slider_valX = (slider_val - slider_minVal) / (slider_maxVal - slider_minVal) * slider_width + slider_x - slider_width / 2;

draw_set_font(Font_ui);
draw_set_color(c_white);
draw_rectangle(slider_xS, slider_yS, slider_xE, slider_yE, false);
draw_set_color(c_black);
draw_circle(slider_valX, slider_y, 8, false);
draw_set_color(c_white);
draw_text(slider_xE + 16, slider_yS - 2, slider_val);
draw_text(slider_xS, slider_yS - 24, slider_name);
draw_set_font(-1);
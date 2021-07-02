/// @description Insert description here
// You can write your code in this editor

var centerX = display_get_gui_width() / 2;
var centerY = display_get_gui_height() / 2;
draw_sprite_ext(Spr_letterbox,0,centerX,2 * centerY + 160 - _val_E * 128,deviceWidth / 10,1.0,0,c_white,1.0);
draw_sprite_ext(Spr_letterbox,0,centerX, -160 + _val_E * 128,deviceWidth / 10,1.0,0,c_white,1.0);

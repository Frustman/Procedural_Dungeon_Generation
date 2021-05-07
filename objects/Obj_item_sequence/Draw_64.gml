/// @description Insert description here
// You can write your code in this editor

var centerX = display_get_gui_width() / 2;
var centerY = display_get_gui_height() / 2;

draw_sprite_ext(item_sprite, item_index,centerX,centerY,_val_S * 10,_val_S * 10,0,c_white,1.0);

draw_sprite_ext(Spr_letterbox,0,centerX,2 * centerY + 128 - _val_E * 128,deviceWidth / 10,1.0,0,c_white,1.0);
draw_sprite_ext(Spr_letterbox,0,centerX, -128 + _val_E * 128,deviceWidth / 10,1.0,0,c_white,1.0);

//if(cnt >= sequence_length * 2 / 5){
	draw_set_font(Font_rumber);
	draw_set_halign(fa_center);
	draw_text_transformed(centerX,2 * centerY + 128 - _val_E * 128 - 90,"YOU'VE GOT " + item_name,1.0,1.0,0);
	draw_set_halign(fa_left);
	draw_set_font(-1);
//}
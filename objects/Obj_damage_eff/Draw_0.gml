/// @description Insert description here
// You can write your code in this editor
if(!critical)
	Scr_draw_text_outline(x - 8 * image_xscale,y  - 8 * image_yscale,image_xscale,image_yscale,2,Font_damage,c_black,c_white,dmg);
	//draw_text_outline(x - 8 * image_xscale,y  - 8 * image_yscale,dmg,2,c_black,4);
else{
	Scr_draw_text_outline(x - 8 * image_xscale,y  - 8 * image_yscale,image_xscale + 0.1,image_yscale + 0.1,2,Font_damage,c_black,c_yellow,dmg);
}
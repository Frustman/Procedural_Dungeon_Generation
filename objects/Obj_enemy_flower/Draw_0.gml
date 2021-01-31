/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(!stun){
	sprite_index = Spr_flower_idle;
	draw_sprite_ext(Spr_flower_idle,-1,x,y,image_xscale,1.0,0,c_white,1.0);
} else
	draw_sprite_ext(Spr_slime_hurt,-1,x,y,image_xscale,1.0,0,c_white,1.0);
shader_reset();

//draw_rectangle_color(x-10,y-22,x-10 + hp/1.5, y-20,c_black,c_black,c_black,c_black,true);
//draw_rectangle_color(x-10,y-22,x-10 + hp/1.5, y-20,c_red,c_red,c_red,c_red,false);
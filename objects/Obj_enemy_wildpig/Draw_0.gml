/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(state == states.attack){
	sprite_index = Spr_wildpig_attack;
	draw_sprite_ext(Spr_wildpig_attack,real_index,x,y,image_xscale,1.0,0,c_white,1.0);
}else if(!stun){
	if(state == states.idle){
		sprite_index = Spr_wildpig_idle;
		draw_sprite_ext(Spr_wildpig_idle,real_index,x,y,image_xscale,1.0,0,c_white,1.0);
	} if(state == states.move){
		sprite_index = Spr_wildpig_attack;
		draw_sprite_ext(Spr_wildpig_attack,real_index,x,y,image_xscale,1.0,0,c_white,1.0);
	} if(state == states.attack_ready){
		sprite_index = Spr_wildpig_attack_ready;
		draw_sprite_ext(Spr_wildpig_attack_ready,real_index,x,y,image_xscale,1.0,0,c_white,1.0);
	} 
} else
	draw_sprite_ext(Spr_slime_hurt,-1,x,y,image_xscale,1.0,0,c_white,1.0);
shader_reset();

draw_rectangle_color(x-10,y-22,x-10 + hp/1.5, y-20,c_black,c_black,c_black,c_black,true);
draw_rectangle_color(x-10,y-22,x-10 + hp/1.5, y-20,c_red,c_red,c_red,c_red,false);
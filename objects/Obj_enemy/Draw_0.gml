/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(Spr_hpbar,0,x - 11,y + abs(height) + 2, hp/maxhp, 1.0, 0 ,c_white,1.0);
draw_sprite(Spr_hpbar_frame,0,x - 14,y + abs(height));

if(Obj_chr.AttackTarget == id){
	shader_set(Sha_white_outline);
	shader_set_uniform_f(upixelH,texelH);
	shader_set_uniform_f(upixelW,texelW);
}

if(hit) shader_set(Sha_hit);

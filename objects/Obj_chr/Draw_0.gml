/// @description Insert description here
// You can write your code in this editor
real_index = anim_index div anim_fps;
//draw_sprite(Spr_wallM,0,(x div 64) * 64, ((y + 8) div 64) * 64);
//shader_set(Sha_sepia);


if(AttackTarget == noone){
	TargetAngle = angle;	
}
if(shoot) hand_x = sign(lengthdir_x(1,TargetAngle));

image_xscale = (abs(image_xscale) > 0) ? image_xscale : 1.0;
hand_x = (abs(hand_x) > 0) ? hand_x : 1.0;

if(dash){
	sprite_index = Spr_chr_dash;
	anim_fps = 7;
	draw_sprite_ext(Spr_chr_dash,real_index,x,y,shoot ? hand_x : image_xscale,image_yscale,0,c_white,image_alpha);
}else{
	if(hit){
		anim_fps = 10;
		sprite_index = Spr_chr_hurt;
		draw_sprite_ext(Spr_chr_hurt,real_index,x,y,shoot ? hand_x : image_xscale,image_yscale,0,c_white,image_alpha);
	} else if(state == "idle"){
		sprite_index = Spr_chr;
		draw_sprite_ext(Spr_chr,real_index,x,y,shoot ? hand_x : image_xscale,image_yscale,0,c_white,image_alpha);
	} else if(state == "move"){
		anim_fps = 5;
		sprite_index = Spr_chr_move;
		draw_sprite_ext(Spr_chr_move,real_index,x,y,shoot ? hand_x : image_xscale,image_yscale,0,c_white,image_alpha);
	}
}

if(shoot){
	var gun_reac = -animcurve_channel_evaluate(channel_gun, gun_index / gun_reac_duration) * 4;
	gun_index += global.timeScale;
	var Gangle = (hand_x == 1.0) ? TargetAngle : TargetAngle  - 180;
	draw_sprite_ext(Spr_chr_hand,0,x + lengthdir_x(gun_reac,Gangle),y + 8 + lengthdir_y(gun_reac, Gangle),hand_x,image_yscale,Gangle,c_white,image_alpha);
	if(gun_index <= 2) draw_sprite_ext(Spr_muzzle,irandom(3),x + lengthdir_x(gun_reac,Gangle),y + 8 + lengthdir_y(gun_reac, Gangle),hand_x,image_yscale,Gangle,c_white,image_alpha);
	
}
//draw_circle(x,y,3,false);

//shader_reset();
/*if(charging){
	anim_fps = 10;
	hand_x = sign(lengthdir_x(1,angle)) * 2.0;

	draw_sprite_ext(Spr_chr_hand,0,x,y,hand_x,image_yscale,(hand_x == 2.0) ? angle : angle - 180,c_white,1.0);
} */
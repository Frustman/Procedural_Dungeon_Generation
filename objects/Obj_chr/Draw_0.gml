/// @description Insert description here
// You can write your code in this editor
real_index = anim_index div anim_fps;


Scr_z_tilt_set();

draw_sprite_ext(Spr_chr_msk, 0, x, y + 4 + zFloor,1,1,0,c_white, 6 / 255);

if(state_name == "DASH"){
	sprite_index = Spr_chr_dash;
	anim_fps = 7;
	draw_sprite_ext(Spr_chr_dash,real_index,x,y + z,shoot ? hand_x : image_xscale,image_yscale,0,c_white,image_alpha);
}else{
	if(hit){
		anim_fps = 4;
		sprite_index = Spr_chr_hurt;
		draw_sprite_ext(Spr_chr_hurt,real_index,x,y + z,shoot ? hand_x : image_xscale,image_yscale,0,c_white,image_alpha);
	} else if(state_name == "IDLE"){
		sprite_index = Spr_chr;
		draw_sprite_ext(Spr_chr,real_index,x,y + z,shoot ? hand_x : image_xscale,image_yscale,0,c_white,image_alpha);
	} else if(state_name == "MOVE"){
		anim_fps = 5;
		sprite_index = Spr_chr_move;
		draw_sprite_ext(Spr_chr_move,real_index,x,y + z,shoot ? hand_x : image_xscale,image_yscale,0,c_white,image_alpha);
	}
}

Scr_z_tilt_reset();


/*
if(shoot){
	var gun_reac = -animcurve_channel_evaluate(channel_gun, gun_index / gun_reac_duration) * 4;
	gun_index += global.timeScale;
	var Gangle = (hand_x == 1.0) ? TargetAngle : TargetAngle  - 180;
	draw_sprite_ext(Spr_chr_hand,CONTAINER.player_guntype,x + lengthdir_x(gun_reac,Gangle),y + 8 + lengthdir_y(gun_reac, Gangle),hand_x,image_yscale,Gangle,c_white,image_alpha);
	if(gun_index <= 2) draw_sprite_ext(Spr_muzzle,irandom(3),x + lengthdir_x(gun_reac,Gangle),y + 8 + lengthdir_y(gun_reac, Gangle),hand_x,image_yscale,Gangle,c_white,image_alpha);
	
}
//draw_circle(x,y,3,false);

//shader_reset();
/*if(charging){
	anim_fps = 10;
	hand_x = sign(lengthdir_x(1,angle)) * 2.0;

	draw_sprite_ext(Spr_chr_hand,0,x,y,hand_x,image_yscale,(hand_x == 2.0) ? angle : angle - 180,c_white,1.0);
} */
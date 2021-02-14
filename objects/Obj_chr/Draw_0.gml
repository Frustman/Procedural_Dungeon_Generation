/// @description Insert description here
// You can write your code in this editor
real_index = anim_index div anim_fps;
//draw_sprite(Spr_wallM,0,(x div 64) * 64, ((y + 8) div 64) * 64);
if(dash){
	sprite_index = Spr_chr_dash;
	draw_sprite_ext(Spr_chr_dash,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
}else{
	if(hit){
		sprite_index = Spr_chr_hurt;
		draw_sprite_ext(Spr_chr_hurt,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
	} else if(state == "idle"){
		sprite_index = Spr_chr;
		draw_sprite_ext(Spr_chr,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
	} else if(state == "move"){
		anim_fps = 5;
		sprite_index = Spr_chr_move;
		draw_sprite_ext(Spr_chr_move,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
	}
}

if(shoot){
	anim_fps = 10;
	if(AttackTarget != noone && instance_exists(AttackTarget)){
		angle = point_direction(x,y,AttackTarget.x, AttackTarget.y);
		if(x >= AttackTarget.x){
			image_xscale = -1.0;
		}else{
			image_xscale = 1.0;
		}
	} else{
		angle = Obj_controller.directionBox;
		image_xscale = sign(lengthdir_x(1,angle));
	}

	draw_sprite_ext(Spr_chr_hand,real_index,x,y,image_xscale,image_yscale,(image_xscale == 1.0) ? angle : angle - 180,c_white,1.0);
} 
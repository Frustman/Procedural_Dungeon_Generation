/// @description Insert description here
// You can write your code in this editor
real_index = anim_index div anim_fps;

if(dash){
	sprite_index = Spr_chr_dash;
	//draw_sprite_ext(Spr_chr_hand,LookRight,x,y,1.0,1.0,0,c_white,1.0);
	draw_sprite_ext(Spr_chr_dash,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
	//draw_sprite_ext(Spr_chr_hand,!LookRight,x,y,1.0,1.0,0,c_white,1.0);
}else{
	if(state == "idle"){
		sprite_index = Spr_chr;
		//draw_sprite_ext(Spr_chr_hand,LookRight,x,y,1.0,1.0,0,c_white,1.0);
		draw_sprite_ext(Spr_chr,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
		//draw_sprite_ext(Spr_chr_hand,!LookRight,x,y,1.0,1.0,0,c_white,1.0);
	} else if(state == "move"){
		sprite_index = Spr_chr_move;
		//draw_sprite_ext(Spr_chr_hand,LookRight,x,y,1.0,1.0,0,c_white,1.0);
		draw_sprite_ext(Spr_chr_move,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
		//draw_sprite_ext(Spr_chr_hand,!LookRight,x,y,1.0,1.0,0,c_white,1.0);
	}
}

if(shoot){
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
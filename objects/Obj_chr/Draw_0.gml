/// @description Insert description here
// You can write your code in this editor
real_index = anim_index div anim_fps;

/*if(_Enemy_num > 0){
	draw_sprite(Spr_hitnask,0,shoot_list[|0].x, shoot_list[|0].y)
}
if(_Wall_num > 0){
	draw_sprite(Spr_hitnask,0,wall_list[|0].x, wall_list[|0].y)
}
*/

if(AttackTarget != noone){
	draw_sprite_ext(Spr_target,0,AttackTarget.x,AttackTarget.y,0.8,0.8,0,c_white,1.0);
}

if(dash){
	sprite_index = Spr_chr_dash;
	//draw_sprite_ext(Spr_chr_hand,LookRight,x,y,1.0,1.0,0,c_white,1.0);
	draw_sprite_ext(Spr_chr_dash,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
	//draw_sprite_ext(Spr_chr_hand,!LookRight,x,y,1.0,1.0,0,c_white,1.0);
} else if(shoot){
	sprite_index = Spr_chr_shoot;
	if(AttackTarget != noone){
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
	
	draw_sprite_ext(Spr_chr_shoot,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
	draw_sprite_ext(Spr_chr_hand,real_index,x,y,image_xscale,image_yscale,(image_xscale == 1.0) ? angle : angle - 180,c_white,1.0);
	
} else{
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
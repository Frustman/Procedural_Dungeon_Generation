/// @description Insert description here
// You can write your code in this editor
real_index = anim_index div anim_fps;
if(dash){
	sprite_index = Spr_chr_dash;
	//draw_sprite_ext(Spr_chr_hand,LookRight,x,y,1.0,1.0,0,c_white,1.0);
	draw_sprite_ext(Spr_chr_dash,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
	//draw_sprite_ext(Spr_chr_hand,!LookRight,x,y,1.0,1.0,0,c_white,1.0);
} else if(shoot){
	sprite_index = Spr_chr_shoot;
	var ran = random(3.0) - 1.5;
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
	if(image_xscale = 1.0){
		shootX = x + lengthdir_x(21.3775583264319501,angle + 90 - 79.215702132437);
	} else{
		shootX = x + lengthdir_x(21.3775583264319501,angle - 90 + 79.215702132437);
	}
	if(image_xscale = 1.0){
		shootY = y + lengthdir_y(22.3775583264319501,angle + 90 - 79.215702132437);
	} else{
		shootY = y + lengthdir_y(22.3775583264319501,angle - 90 + 79.215702132437);
	}
	if(near_inst != "noone"){
		var point = Scr_BS_line(shootX,shootY,angle,600,near_id);		
	}
	
	draw_sprite_ext(Spr_chr_shoot,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
	draw_sprite_ext(Spr_chr_hand,real_index,x,y,image_xscale,image_yscale,(image_xscale == 1.0) ? angle : angle - 180,c_white,1.0);
	if(near_inst == "noone"){
		draw_line(shootX,shootY,x + lengthdir_x(600,angle + ran),y + lengthdir_y(600,angle + ran))
	} else{	
		draw_line(shootX,shootY,point[|0],point[|1]);
	}
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
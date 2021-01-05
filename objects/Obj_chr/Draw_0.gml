/// @description Insert description here
// You can write your code in this editor
real_index = anim_index div anim_fps;
if(dash){
	sprite_index = Spr_chr_dash;
	draw_sprite_ext(Spr_chr_hand,LookRight,x,y,1.0,1.0,0,c_white,1.0);
	draw_sprite_ext(Spr_chr_dash,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
	draw_sprite_ext(Spr_chr_hand,!LookRight,x,y,1.0,1.0,0,c_white,1.0);
} else{
	if(state == "idle"){
		sprite_index = Spr_chr;
		draw_sprite_ext(Spr_chr_hand,LookRight,x,y,1.0,1.0,0,c_white,1.0);
		draw_sprite_ext(Spr_chr,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
		draw_sprite_ext(Spr_chr_hand,!LookRight,x,y,1.0,1.0,0,c_white,1.0);
	} else if(state == "move"){
		sprite_index = Spr_chr_move;
		draw_sprite_ext(Spr_chr_hand,LookRight,x,y,1.0,1.0,0,c_white,1.0);
		draw_sprite_ext(Spr_chr_move,real_index,x,y,image_xscale,image_yscale,0,c_white,1.0);
		draw_sprite_ext(Spr_chr_hand,!LookRight,x,y,1.0,1.0,0,c_white,1.0);
	}
}

//draw_sprite_ext(Spr_sword,0,x,y,1.0,1.0,Obj_controller.AttackdirectionBox + 30,c_white,1.0);
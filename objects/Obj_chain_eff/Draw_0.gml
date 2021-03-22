/// @description Insert description here
// You can write your code in this editor
if(target != -1 && par != -1 && instance_exists(target) && instance_exists(par)){
	var dir = point_direction(par.x,par.y,target.x,target.y);
	var dist = point_distance(par.x,par.y,target.x,target.y);
	draw_sprite_ext(Spr_chain_burst1,image_index,par.x,par.y,1.0,1.0,dir,c_white,1.0);
	draw_sprite_ext(Spr_chain_burst1,image_index,target.x,target.y,1.0,1.0,dir,c_white,1.0);
	draw_sprite_ext(Spr_chain_burst2,image_index,par.x,par.y,1.0,1.0,dir,c_white,1.0);
	draw_sprite_ext(Spr_chain_burst2,image_index,target.x,target.y,1.0,1.0,dir,c_white,1.0);
	for(var i = 0; i <= dist div len; i++){
		draw_sprite_ext(Spr_chain_mid,image_index,par.x + lengthdir_x((len - 30) * i, dir),par.y + lengthdir_y((len - 30) * i, dir),1.0,1.0,dir,c_white,1.0);
	}
}